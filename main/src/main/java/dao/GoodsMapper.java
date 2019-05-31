package dao;

import model.Goods;
import common.PageUtil;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public  interface GoodsMapper {
    @Select("select * from goods  limit #{start},#{size}")
    List<Goods> selectAll(Map<String, Integer> map);
    @Select("select * from goods  where  type=#{typeName} limit #{start},#{size}")
    List<Goods> selectByType(PageUtil page);
    @Select("select count(*) from goods")
     int selectAllCount();
    @Select("select count(*) from goods where  type=#{0}")
    int selectTypeCount(String  type);

   //  查找打折的商品的DAO
    @Select("select * from goods where discount=1 limit #{start},#{size}")
    List<Goods> selectByFlag(Map<String, Integer> map);
    @Select("select count(*) from goods  where discount =1")
    int selectFlagCount();
    //按商品名 查找对应的商品的DAO
    @Select("select count(*) from goods  where name like #{0}")
    int selectNameCount(String key);
    @Select("select * from goods  where  name like #{key}  limit #{start},#{size}")
    List<Goods> selectByName(Map<String, Object> map);
    @Select("select * from goods  where  id=#{0}")
    Goods selectById(int key);
    @Update("update goods set count=count-#{param2},saleCount=saleCount+#{param2} where id=#{param1}")
    void updateCount(int id, int count);
   @Select("select count from goods where id =#{0}")
    int selectCountById(int n);

    @Select("select * from goods order by   saleCount DESC limit 10")
    List<Goods> selectTopTen();

}
