package service;

import common.JsonUtil;
import dao.CacheMapper;
import dao.GoodsMapper;
import model.Goods;
import common.PageUtil;
import org.apache.log4j.Logger;
import org.omg.CORBA.INTERNAL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.ShardedJedis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class GoodsService {
    private  final  static String KEY="GOODS ID:";
    @Autowired
    private GoodsMapper goodsMapper;
    private Logger logger = Logger.getLogger(GoodsService.class);
    @Autowired
    private CacheMapper cacheMapper;
//   查询所有商品
    public List<Goods> selectAll(Integer pageNo, Integer size) {
        Map<String, Integer> map = new HashMap<>();
        map.put("start", (pageNo - 1) * size);
        map.put("size", size);
        return goodsMapper.selectAll(map);
    }
    //按分类查询商品
    public List<Goods> selectByType(Integer type, Integer pageNo, Integer size) {
        String s="";
        switch (type) {
            case 1:
                s="进口产品";
                break;
            case 2:
                s="水果";
                break;
            case 3:
                s="蔬菜";
                break;
            case 4:
                s="海鲜";
                break;
            case 5:
                s="家禽";
                break;
        }
        PageUtil page=new PageUtil();
        page.setStart((pageNo - 1) * size);
        page.setSize(size);
        page.setTypeName(s);
        return goodsMapper.selectByType(page);
    }

    public int selectCount() {
       return  goodsMapper.selectAllCount();
    }
    //按分类查找商品总数
    public int selectTypeCount(Integer type){
          String s="";
          switch (type) {
              case 1:
                  s="进口产品";
                  break;
              case 2:
                  s="水果";
                  break;
              case 3:
                  s="蔬菜";
                  break;
              case 4:
                  s="海鲜";
                  break;
              case 5:
                  s="家禽";
                  break;

          }

        return goodsMapper.selectTypeCount(s);
    }

    public List<Goods> selectByFlag(Integer pageNo, Integer size) {
        Map<String, Integer> map = new HashMap<>();
        map.put("start", (pageNo - 1) * size);
        map.put("size", size);
        return goodsMapper.selectByFlag(map);
    }

    public int selectCountFlag() {
        return goodsMapper.selectFlagCount();
    }

    public List<Goods> selectAllByKey(String key, Integer pageNo, Integer size) {
        Map<String, Object> map = new HashMap<>();
        map.put("start", (pageNo - 1) * size);
        map.put("size", size);

        key="%"+key+"%";
        map.put("key", key);
        return goodsMapper.selectByName(map);
    }

    public int selectCountByName(String key) {
            key="%"+key+"%";
        return goodsMapper.selectNameCount(key);
    }

    public Goods selectByID(int key) {
        ShardedJedis jedis = cacheMapper.getJedis();
        String n = KEY + key;
        Goods goods = new Goods();
       if( jedis.exists(KEY + key)){
           goods = JsonUtil.string2Object(jedis.get(n), Goods.class);
           jedis.expire(n, 900);
       }else{
           goods = goodsMapper.selectById(key);
           jedis.setex(n, 900, JsonUtil.object2String(goods));
        }
         jedis.close();
        return goods;
    }

    public List<Goods> selectTopTen() {
        ShardedJedis jedis = cacheMapper.getJedis();
        List<Goods> goods = new ArrayList<>();
        if(jedis.exists("TOP_TEN")){
            goods = JsonUtil.string2List(jedis.get("TOP_TEN"), Goods.class);
        }else{
            goods = goodsMapper.selectTopTen();
        }
        jedis.close();

        return goods;
    }

}
