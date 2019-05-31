package service;

import common.JsonUtil;
import dao.CartMapper;
import dao.GoodsMapper;
import model.CartItem;
import model.Goods;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.ShardedJedis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
public class CartService {
    @Autowired
    private CartMapper cartMapper;
    @Autowired
    private GoodsMapper goodsMapper;
    private  static final String KEY_ID = "userOfCard:";

    public void addCart(HttpServletRequest req, Integer id, Integer number, int id1) {
        Goods goods = goodsMapper.selectById(id);
        CartItem cartItem=new CartItem();
        cartItem.setSrc(goods.getSrc());
        cartItem.setDisPrice(goods.getDisPrice());
        cartItem.setName(goods.getName());
        cartItem.setId(goods.getId());
        cartItem.setPrice(goods.getPrice());
        String key=KEY_ID + id1;
        ShardedJedis jedis = cartMapper.getJedis();
        //购物车还没创建
        if (!jedis.exists(key)) {
            cartItem.setCount(number);
            List<CartItem> list=new ArrayList<>();
            list.add(cartItem);
            jedis.set(key, JsonUtil.object2String(list));
            req.getSession().setAttribute("itemList", list);
        }else{
            List<CartItem> itemList = JsonUtil.string2List(jedis.get(key), CartItem.class);
            boolean flag=false;
            for(CartItem item :itemList){
                //购物车存在当前商品 就增加数量
                if(item.getId()==cartItem.getId()){
                    item.setCount(item.getCount() + number);
                    flag = true;
                    break;
                }
            }
            //购物车里不存在当前商品 就创建
            if(!flag){
                cartItem.setCount(number);
                itemList.add(cartItem);
            }
            jedis.set(key, JsonUtil.object2String(itemList));
            req.getSession().setAttribute("itemList", itemList);

        }
    jedis.close();

    }

    public void selectCartById(HttpServletRequest request,HttpSession session, User user) {
        String key = KEY_ID + user.getId();
        ShardedJedis jedis = cartMapper.getJedis();
        List<CartItem> itemList = new ArrayList<>();
        if(jedis.exists(key)) {
            String s = jedis.get(key);
              itemList= JsonUtil.string2List(s, CartItem.class);
        }
        request.getSession().setAttribute("itemList",itemList);
        jedis.close();

    }

    public void subCart(HttpServletRequest req, Integer id, int id1) {
        String key = KEY_ID + id1;
        ShardedJedis jedis = cartMapper.getJedis();
        String s = jedis.get(key);
        List<CartItem> itemList = JsonUtil.string2List(s, CartItem.class);
        for(CartItem cartItem:itemList){
            if(cartItem.getId()==id) {
                cartItem.setCount(cartItem.getCount() - 1);
                break;
            }
        }
        jedis.set(key, JsonUtil.object2String(itemList));
        req.getSession().setAttribute("itemList", itemList);
        jedis.close();
    }

    public void delCart(HttpServletRequest req, Integer id, int id1) {
        String key = KEY_ID + id1;
        ShardedJedis jedis = cartMapper.getJedis();
        String s = jedis.get(key);
        List<CartItem> itemList = JsonUtil.string2List(s, CartItem.class);
        Iterator<CartItem> iterator = itemList.iterator();
        while(iterator.hasNext()){
            if(iterator.next().getId()==id) {
                iterator.remove();
                break;
            }
        }
        jedis.set(key, JsonUtil.object2String(itemList));
        req.getSession().setAttribute("itemList", itemList);
        jedis.close();

    }
}
