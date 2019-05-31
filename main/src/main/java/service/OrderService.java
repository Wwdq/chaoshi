package service;

import com.sun.tools.corba.se.idl.constExpr.Or;
import common.JsonUtil;
import dao.*;
import model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;
import redis.clients.jedis.JedisShardInfo;
import redis.clients.jedis.ShardedJedis;
import sun.misc.Cache;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.*;

@Service

public class OrderService {
    private final static String KEY = "USER_ITEM:";
    @Autowired
    private CartMapper cartMapper;
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private CacheMapper cacheMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private GoodsMapper goodsMapper;
    private  static final String KEY_ID = "userOfCard:";
    public   void doOrder(HttpServletRequest req,Integer[] id, double total) {
        ShardedJedis jedis = cartMapper.getJedis();
        List<CartItem> list=new ArrayList<>();
        User user = (User) req.getSession().getAttribute("user");
        List<Address> addrList = userMapper.selectAddr(user.getId());
        String key = KEY_ID + user.getId();
        List<CartItem> itemList = JsonUtil.string2List(jedis.get(key), CartItem.class);
        Iterator<CartItem> iterator = itemList.iterator();
        while(iterator.hasNext()) {
            CartItem cartItem = iterator.next();
            for (int i : id) {
                if(i==cartItem.getId()){
                    list.add(cartItem);

                    break;
                }
            }
        }

        req.setAttribute("orderList", list);
        req.setAttribute("total", total);
        req.setAttribute("addrList", addrList);

        jedis.set(key, JsonUtil.object2String(itemList));


        jedis.close();

    }
//新增订单，把购物车数据删除，把订单数据增加，把订单数据放到redis
    public void insertOrders(HttpSession session, int id, double total, Integer[] goodid, Integer key1, Address address) {
        Date date = new Date(System.currentTimeMillis());
        Orders orders=new Orders();
        //装配订单数据
        orders.setUserid(id);
        orders.setMoney(total);
        orders.setCreatetime(date);
        orders.setStatus(key1 + 1);
        orders.setName(address.getName());
        orders.setPhone(address.getPhone());
        orders.setAddress(address.getAddr());
        //在数据库中插入数据
        orderMapper.insertOrders(orders);
        int orderid=orderMapper.selectLast();
        ShardedJedis jedis = cartMapper.getJedis();
        List<Orders> orders1 = new ArrayList<>();
        if(jedis.exists(KEY+id)) {
              orders1 = JsonUtil.string2List(jedis.get(KEY + id), Orders.class);
        }
        List<CartItem> list=new ArrayList<>();
        String key = KEY_ID + id;
        List<CartItem> itemList = JsonUtil.string2List(jedis.get(key), CartItem.class);
        Iterator<CartItem> iterator = itemList.iterator();
        while(iterator.hasNext()) {
            CartItem cartItem = iterator.next();
            for (int i : goodid) {
                if(i==cartItem.getId()){
                    cartItem.setPrice(cartItem.getDisPrice() == 0 ? cartItem.getPrice() : cartItem.getDisPrice());
                    goodsMapper.updateCount(cartItem.getId(), cartItem.getCount());
                    list.add(cartItem);
                    iterator.remove();
                    break;
                }
            }
        }
        List<OrderItem> list2 = new ArrayList<>();
        for(CartItem item:list){
            OrderItem item1=new OrderItem();
            item1.setCount(item.getCount());
            item1.setName(item.getName());
            item1.setSrc(item.getSrc());
            item1.setGoodid(item.getId());
            item1.setPrice(item.getPrice());
            list2.add(item1);
        }
        orders.setOrderItems(list2);
        orders1.add(orders);
        jedis.set(KEY + id, JsonUtil.object2String(orders1));
        System.out.println(Arrays.toString(goodid));
        //使用map封装参数
        Map<String,Object>map=new HashMap<>();
        map.put("orderid", orderid);
        map.put("list", list);

        orderMapper.insertItem(map);

        jedis.set(key, JsonUtil.object2String(itemList));
        session.setAttribute("itemList", itemList);
        jedis.close();
    }
//根据用户id查找订单，如果是第一次就放到redis
    public void selectOrdersByUserId(HttpServletRequest req, int id) {
        String key = KEY + id;
        List<Orders> list = new ArrayList<>();

        ShardedJedis jedis = cacheMapper.getJedis();
        if (jedis.exists(key)) {
            list = JsonUtil.string2List(jedis.get(key), Orders.class);
        } else {
            list=orderMapper.selectById(id);

            for (Orders orders : list) {
                if (orders.getStatus() == 2) {
                    if (new Date(System.currentTimeMillis()).getDay() - orders.getCreatetime().getDay() >= 1) {
                        orders.setStatus(6);

                    }
                }
                List<OrderItem> orderItems = orderMapper.selectItemByOrderId(orders.getId());
                orders.setOrderItems(orderItems);
                jedis.set(key, JsonUtil.object2String(list));

            }

        }
        jedis.close();
        req.setAttribute("orders", list);
    }
 //删除订单
    public void deleteOrders(HttpSession session, int id, Integer id1) {
        orderMapper.deleteOrders(id1);
        ShardedJedis jedis = cacheMapper.getJedis();
        List<Orders> list = JsonUtil.string2List(jedis.get(KEY + id), Orders.class);
        Iterator<Orders> iterator = list.iterator();
        while (iterator.hasNext()) {
            if (iterator.next().getId() == id1) {
                iterator.remove();
                break;
            }
        }
        jedis.set(KEY + id, JsonUtil.object2String(list));
        jedis.close();

        orderMapper.deleteItem(id1);
    }

    public void updateStatus(Integer id, Integer status, HttpSession session) {
        int s = 0;
        switch (status) {
            case 1:
                s = 3;
                break;
            case 2:
                s = 1;
                break;
            case 3:
                s = 4;
                break;
            case 4:
                s = 5;
                break;
        }
        User user = (User) session.getAttribute("user");
        ShardedJedis jedis = cacheMapper.getJedis();
        List<Orders> list = JsonUtil.string2List(jedis.get(KEY + user.getId()), Orders.class);
        Iterator<Orders> iterator = list.iterator();
        while (iterator.hasNext()) {
            Orders order = iterator.next();
            if (order.getId() == id) {
                order.setStatus(s);
                break;
            }
        }
        jedis.set(KEY + user.getId(), JsonUtil.object2String(list));
        jedis.close();
        orderMapper.updateStatus(id, s);

    }

    public void selectOrdersByStatus(HttpServletRequest req, int id, Integer status) {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        ShardedJedis jedis = cacheMapper.getJedis();
        List<Orders> list = JsonUtil.string2List(jedis.get(KEY + user.getId()), Orders.class);
        List<Orders> list1 = new ArrayList<>();
        if (status == 0) {
            list1 = list;
        } else {
            for (Orders orders : list) {
                if (orders.getStatus() == status) {
                    list1.add(orders);
                }
            }
        }
        jedis.close();

        req.setAttribute("orders", list1);
    }

    public String checkNumber(HttpSession session,Integer[] id) {
        User user = (User) session.getAttribute("user");
        int id1 = user.getId();
        ShardedJedis jedis = cacheMapper.getJedis();
        String key = KEY_ID + id1;
        List<CartItem> itemList = JsonUtil.string2List(jedis.get(key), CartItem.class);
        for(int n:id){
            int count = goodsMapper.selectCountById(n);
            int number=0;
            String name = "";
            for(CartItem m:itemList){
                if(m.getId()==n){
                    number = m.getCount();
                    name = m.getName();
                }
            }
            if(count<number){
                return name;
            }
        }
        return "success";

    }
}
