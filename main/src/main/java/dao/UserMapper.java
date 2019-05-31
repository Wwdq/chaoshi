package dao;

import model.Address;
import model.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface UserMapper {
    @Select("select * from user where username=#{username} and password =#{password}")
    User selectUser(User user);
    @Insert("INSERT INTO USER (id,username,PASSWORD,NAME)  VALUES (DEFAULT,#{username},#{password},#{username});")
   int  insertUser(User user);

    @Select("select *from user where username=#{0}")
    User selectByUsername(String username);
    @Update("update user set QQ=#{QQ},email=#{email},phone=#{phone},sex=#{sex} where username=#{username}")
    void updateMsg(User my);

    @Select("select password from user where id=#{0}")

    String selectPassword(int id);

    @Update("update user set password=#{param1} where id =#{param2}")
    void updatePassword(String s, int id);
    @Delete( "delete from address where id=#{0}")
    void deleteAddr(Integer id);

    @Update("update address set phone=#{phone},name=#{name},zip=#{zip},addr=#{addr} where id = #{id}")

    void updateAddr(Address address);

    @Select("select * from address where userid=#{0}")

    List<Address> selectAddr(int id);

    @Select("select * from address where id=#{0}")

    Address selectAddrById(Integer id);
    @Insert("insert into address (phone,name,addr,zip,userid) values (#{param2.phone},#{param2.name},#{param2.addr},#{param2.zip},#{param1})")
    void insertAddr(int id, Address address);
}
