package service;

import common.JsonUtil;
import dao.CacheMapper;
import dao.GoodsMapper;
import model.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.ShardedJedis;

import java.util.List;
import java.util.TimerTask;
//此类的作用是实现定时执行更新缓存，缓存更新的实现在监听器中
@Service
public class TimerService extends TimerTask{
    @Autowired
    private CacheMapper cacheMapper;
    @Autowired
    private GoodsMapper goodsMapper;



       @Override
       public void run() {
           System.out.println("cache  update");
           ShardedJedis jedis = cacheMapper.getJedis();
           List<Goods> goodsList = goodsMapper.selectTopTen();
           jedis.set("TOP_TEN", JsonUtil.object2String(goodsList));
           jedis.close();


   }
}
