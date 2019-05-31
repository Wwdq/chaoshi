package redisTest;
import common.JsonUtil;
import dao.CartMapper;
import model.CartItem;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.ShardedJedis;
import java.util.ArrayList;
import java.util.List;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:springmvc.xml","classpath:ApplicationContext.xml"})
@WebAppConfiguration("src/main/resources")
public class RedisTest {
    @Autowired
    private CartMapper cartMapper;
    @Test
   public void  getKey(){
       ShardedJedis jedis=cartMapper.getJedis();
       String name = jedis.get("name");
       System.out.println(name);
   }
   // 普通对象转化成json
   @Test
   public void jsonTest(){
       ShardedJedis jedis=cartMapper.getJedis();
       CartItem cartItem=new CartItem();
       cartItem.setId(1);
       cartItem.setName("橘子");
       cartItem.setPrice(5.5);
       cartItem.setSrc("/page");
       String s=JsonUtil.object2String(cartItem);
       System.out.println(s);
       jedis.set("test", s);
   }
   // 集合对象转换成json
   @Test
    public void list2JsonTest(){
       ShardedJedis jedis=cartMapper.getJedis();
       CartItem cartItem=new CartItem();
       cartItem.setId(1);
       cartItem.setName("橘子");
       cartItem.setPrice(5.5);
       cartItem.setSrc("/page");
       CartItem cartItem1=new CartItem();
       cartItem1.setId(2);
       cartItem1.setName("香蕉");
       cartItem1.setPrice(5.5);
       cartItem1.setSrc("/page");
       List<CartItem> list =new ArrayList<>();
       list.add(cartItem);
       list.add(cartItem1);
       for(CartItem c:list)
           System.out.println(c);
       String s = JsonUtil.object2String(list);
       System.out.println(s);
       jedis.set("test1", s);
   }
   @Test
    public void string2Object(){
       ShardedJedis jedis=cartMapper.getJedis();
       String s = jedis.get("test");
       CartItem cartItem = JsonUtil.string2Object(s, CartItem.class);
       System.out.println(cartItem);

   }
   @Test
   public void string2List(){
       ShardedJedis jedis=cartMapper.getJedis();
       String s = jedis.get("test1");
       List<CartItem> cartItems = JsonUtil.string2List(s, CartItem.class);
       System.out.println(cartItems);

   }



}
