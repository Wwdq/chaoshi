package listener;

import com.mysql.cj.Session;
import dao.CacheMapper;
import model.User;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import redis.clients.jedis.ShardedJedis;
import redis.clients.jedis.ShardedJedisPool;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionListener  implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {


    }

    @Override
    //session销毁的时候  执行删除缓存操作
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        System.out.println("51615616");
        HttpSession session = httpSessionEvent.getSession();
        User user = (User) session.getAttribute("user");
        System.out.println("001"+user);
        CacheMapper cacheMapper = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext()).getBean(CacheMapper.class);
        ShardedJedis jedis = cacheMapper.getJedis();
        if(user!=null){
            jedis.del("USER_ITEM:" + user.getId());
        }
        System.out.println("success  del");
          jedis.close();


    }
}
