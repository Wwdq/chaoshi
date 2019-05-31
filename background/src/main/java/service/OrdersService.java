package service;

import com.sun.tools.corba.se.idl.constExpr.Or;
import dao.CaheDao;
import dao.OrdersMapper;
import model.OrderItem;
import model.Orders;
import org.omg.CORBA.ORB;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.ShardedJedis;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class OrdersService {
    @Autowired
    private OrdersMapper ordersMapper;
    @Autowired
    private CaheDao caheDao;

    public void selectAll(HttpServletRequest request, Integer pageNo, Integer pageSize) {
        List<Orders> list = ordersMapper.selectAll((pageNo-1)*pageSize,pageSize);
        for (Orders orders : list) {
            List<OrderItem> orderItems = ordersMapper.selectItem(orders.getId());
            orders.setOrderItems(orderItems);

        }
        int count = ordersMapper.selectCount();
        int pageMax = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
        request.setAttribute("orders", list);
        request.setAttribute("pageMax", pageMax);
    }

    public void selectByStatus(HttpServletRequest request,  Integer flag,Integer pageNo,Integer pageSize) {
        flag = flag == 0 ? 1 : 3;
        List<Orders> list = ordersMapper.selectByStatus(flag,(pageNo-1)*pageSize,pageSize);
        for (Orders orders : list) {
            List<OrderItem> orderItems = ordersMapper.selectItem(orders.getId());
            orders.setOrderItems(orderItems);

        }
        int count = ordersMapper.selectCount1(flag);
        int pageMax = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
        request.setAttribute("orders", list);
        request.setAttribute("pageMax", pageMax);

    }

    public void updateStatus(Integer id, Integer status) {
        if(status==3)
            status = 4;
        if(status==1)
            status = 3;
        ShardedJedis jedis = caheDao.getJedis();
        Orders orders = ordersMapper.selectByid(id);

        try {
            jedis.del("USER_ITEM:" + orders.getUserid());
            ordersMapper.updateStatus(id, status);
        }finally {
            jedis.close();
        }

    }
}
