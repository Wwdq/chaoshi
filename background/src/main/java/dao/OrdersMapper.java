package dao;

import model.OrderItem;
import model.Orders;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface OrdersMapper {
    @Select("select * from orders order by createtime DESC limit #{param1} ,#{param2}")
    List<Orders> selectAll(int i, Integer pageSize);
    @Select("select *  from orderitem  where orderid=#{0} ")
    List<OrderItem> selectItem(int id);
    @Select("select * from orders   where   status=#{param1}  order by createtime DESC limit #{param2} ,#{param3} ")
    List<Orders> selectByStatus(Integer integer, int i, Integer flag);
    @Update("update orders set status =#{param2} where id = #{param1}")
    void updateStatus(Integer id, Integer status);
     @Select("select count(*) from orders")
    int selectCount();
    @Select("select count(*) from orders where status =#{0}")
    int selectCount1(int status);
    @Select("select *  from orders where id =#{0}")
    Orders selectByid(Integer id);
}
