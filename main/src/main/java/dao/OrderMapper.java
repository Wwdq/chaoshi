package dao;

import jdk.internal.instrumentation.InstrumentationMethod;
import model.OrderItem;
import model.Orders;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface OrderMapper {
    @Insert("INSERT INTO orders(money,address,phone,NAME,STATUS,createtime,userid) values(#{money},#{address},#{phone},#{name},#{status},#{createtime},#{userid})")
    void insertOrders(Orders orders);
    @Select("select id from orders order by id desc limit 1")
    int selectLast();

    void insertItem(Map<String, Object> map);
   @Select("select * from orders where userid=#{0} order by createtime DESC")
    List<Orders> selectById(int id);
    @Select("select * from  orderitem where orderid=#{0}")
    List<OrderItem> selectItemByOrderId(int id);
     @Delete("delete from orders where id=#{0}")
    void deleteOrders(int id);
    @Delete("delete from orderitem where orderid=#{0}")
    void deleteItem(int id);
    @Update("update orders set status=#{param2} where id=#{param1}")
    void updateStatus(Integer id, Integer status);
}
