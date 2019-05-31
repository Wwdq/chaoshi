package dao;

import model.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Service;

import java.util.List;

public interface AdminMapper {
    @Select("select * from user limit #{param1},#{param2}")

    List<User> selectAll(int i, Integer pageSize);

    @Select("select count(*) from user")
    int selectCount();
    @Select("select * from user where id=#{0}")
    User selectById(int id);
    @Update("update user set password=#{password},phone=#{phone} where id = #{id}")
    void updateUser(User user);
    @Delete("delete from user where id  = #{0}")
    void delete(int id);
}
