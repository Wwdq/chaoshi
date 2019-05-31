package dao;

        import model.Goods;
        import org.apache.ibatis.annotations.Delete;
        import org.apache.ibatis.annotations.Insert;
        import org.apache.ibatis.annotations.Select;
        import org.apache.ibatis.annotations.Update;
        import org.springframework.stereotype.Service;

        import java.util.List;
        import java.util.Map;

public interface GoodsMapper {
    @Select("select * from goods    limit #{start},#{size}")
    List<Goods> selectAll(Map<String, Integer> map);
    @Select("select * from goods    where name like #{key} limit #{start},#{size}")
    List<Goods> selectAllByKey(Map<String, Object> map);
    @Select("select count(*) from goods")
    int selectCount();
    @Insert("insert goods (name,price,disPrice,count,saleCount,type,discount) values (#{name},#{price},#{disPrice},#{count},#{saleCount},#{type},#{discount})")
    void insert(Goods goods);
     @Delete("delete from goods where id=#{0}")
    void delete(int id);
    @Update("update goods set discount =1 where id =#{0}")
    void updateDiscount(int id);
     @Select("select * from goods where id=#{0}")
    Goods selectById(int id);

    @Update("update goods set name=#{name},price=#{price},disPrice=#{disPrice},count=#{count} ,type=#{type}  where id = #{idjj}")

    void update(Goods goods);
}
