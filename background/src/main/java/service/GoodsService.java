package service;

import dao.GoodsMapper;
import model.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class GoodsService {
    @Autowired
    private GoodsMapper goodsMapper;

    public void selectAll(HttpServletRequest request, Integer pageNo, Integer pageSize) {
        Map<String, Integer> map = new HashMap<>();
        map.put("start", (pageNo - 1) * pageSize);
        map.put("size", pageSize);
        int count = goodsMapper.selectCount();
        int pageMax = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
        List<Goods> list = goodsMapper.selectAll(map);
        request.setAttribute("list", list);
        request.setAttribute("pageMax", pageMax);

    }

    public void selectAllbyKey(String key, HttpServletRequest request, Integer pageNo, Integer pageSize) {
        Map<String, Object> map = new HashMap<>();
        map.put("start", (pageNo - 1) * pageSize);
        int count = goodsMapper.selectCount();
        int pageMax = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
        map.put("size", pageSize);
        map.put("key", "%"+key+"%");
        List<Goods> list = goodsMapper.selectAllByKey(map);
        request.setAttribute("list", list);
        request.setAttribute("pageMax", pageMax);
    }

    public void insert(Goods goods) {
        goodsMapper.insert(goods);
    }

    public void delete(int id) {
        goodsMapper.delete(id);
    }

    public void updateDiscount(int id) {
        goodsMapper.updateDiscount(id);
    }

    public void update(int id,HttpServletRequest request) {
        Goods goods = goodsMapper.selectById(id);
        request.setAttribute("goods", goods);

    }

    public void doUpdate(Goods goods) {
        goodsMapper.update(goods);
    }
}
