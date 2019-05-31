package dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import redis.clients.jedis.ShardedJedis;
import redis.clients.jedis.ShardedJedisPool;
@Component
public class CaheDao {
    @Autowired
    private ShardedJedisPool shardedJedisPool;
    public ShardedJedis getJedis(){
        return shardedJedisPool.getResource();
    }
}
