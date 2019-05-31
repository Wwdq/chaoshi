package service;

import common.JsonUtil;
import dao.CacheMapper;
import dao.UserMapper;
import model.Address;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.ShardedJedis;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CacheMapper cacheMapper;
    private final static String KEY = "USER ADDR:";

    public User doLogin(User user) {
        User user1=userMapper.selectUser(user);
        return user1;
    }
    public void insertUser(User user){
        userMapper.insertUser(user);
    }
    public boolean  hasUsername(String name){
        User user = userMapper.selectByUsername(name);
        return user==null;
    }

    public void updateMsg(User my) {
        userMapper.updateMsg(my);
    }

    public String selectPassword(int id) {
        return userMapper.selectPassword(id);
    }

    public void updatePassword(String password, int id) {
        userMapper.updatePassword(password, id);
    }

    public void deleteAddr(Integer id) {



        userMapper.deleteAddr(id);
    }

    public void updateAddr(Address address) {

        userMapper.updateAddr(address);
    }

    public void selectAddr(HttpServletRequest request, int id) {

           List<Address> addressList = userMapper.selectAddr(id);



        request.setAttribute("addrList", addressList);


    }

    public Address selectAddrById(Integer id) {
        return  userMapper.selectAddrById(id);
    }

    public void insertAddr(int id, Address address) {

        userMapper.insertAddr(id, address);
    }
}
