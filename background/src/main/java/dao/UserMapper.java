package dao;

import model.Power;
import model.UserAdmin;
import model.UserAdmin;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    @Delete("delete from useradmin where id=#{0}")
    int deleteByPrimaryKey(Integer id);
    @Insert("insert into useradmin (username,password,telephone,creattime) values(#{username},#{password},#{telephone},#{creattime})")
    int insert(UserAdmin user);

    int insertSelective(UserAdmin record);

    UserAdmin selectUser(UserAdmin user);

    int updateByPrimaryKeySelective(UserAdmin record);
     @Update("update useradmin set username=#{username} ,telephone=#{telephone} where  id=#{id}")
    int updateByPrimaryKey(UserAdmin record);

    List<UserAdmin> selectAll(Map<String, Integer> map);
    @Select("select count(*) from user")
    int selectCount();
     @Select("select * from useradmin where username=#{0}")
     UserAdmin selectByName(String username);
    @Select("select * from useradmin where id=#{0}")
    UserAdmin selectById(int parseInt);

    void insertUserRole(Map<String, Object> map);

    void deleteUserRole(Map<String, Object> map);
    @Select("SELECT * FROM POWER WHERE id IN (SELECT pid FROM rolepower WHERE rid  IN (SELECT rid FROM  roleuser WHERE uid=#{0}))")
    List<Power> selectPowerByUserId(Integer id);
     @Update("update useradmin set password=#{password} ,telephone = #{telephone} where  id =  #{id}")
    void updatePassword(UserAdmin user);
}