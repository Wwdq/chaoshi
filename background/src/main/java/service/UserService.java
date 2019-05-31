package service;

import dao.UserMapper;
import model.Power;
import model.UserAdmin;
import model.UserAdmin;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;
    Logger logger = Logger.getLogger(UserService.class);
    public UserAdmin doLogin(UserAdmin user){
        UserAdmin user1 = userMapper.selectUser(user);
    logger.debug("数据查到了" +  user1);
         return user1;
    }

    public List<UserAdmin> selectUser(Map<String, Integer> map) {
        List<UserAdmin> list = userMapper.selectAll(map);
        return list;
    }

    public int selectCount() {
        return userMapper.selectCount();
    }

    public UserAdmin selectUserByName(String username) {
        return userMapper.selectByName(username);
    }

    public void insertUser(UserAdmin user) {
        userMapper.insert(user);
    }

    public UserAdmin selectUserById(int parseInt) {
        return userMapper.selectById(parseInt);
    }

    public void update(UserAdmin user) {
        userMapper.updateByPrimaryKey(user);
    }

    public void delete(int parseInt) {
        userMapper.deleteByPrimaryKey(parseInt);
    }

    public void doUserRole(Map<String, Object> map) {
        userMapper.insertUserRole(map);
    }

    public void deleteUserRole(Map<String, Object> map) {
        userMapper.deleteUserRole(map);
    }

    public List<Power> selectPowerByUserId(Integer id) {
        return userMapper.selectPowerByUserId(id);
    }

    public void updatePassword(UserAdmin user) {
        userMapper.updatePassword(user);
    }
}
