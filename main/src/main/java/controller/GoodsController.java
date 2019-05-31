package controller;


import model.Goods;
import common.JsonData;
import common.PageUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.GoodsService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

@Controller
@RequestMapping("/goods")
public class GoodsController {
    @Autowired
    private GoodsService goodsService;
    private Logger logger = Logger.getLogger(GoodsController.class);  //日志文件

    @RequestMapping("/index")
    public String toIndex(Integer flag, HttpServletRequest req, @RequestParam(defaultValue = "1") Integer pageNo, @RequestParam(defaultValue = "4") Integer size, Integer type) {
        List<Goods> topTen = goodsService.selectTopTen();

        req.setAttribute("topTen", topTen);
        if (flag != null) {
            List<Goods> goods = goodsService.selectByFlag(pageNo, size);
            req.setAttribute("goods", goods);
            logger.debug(goods);
            PageUtil page = new PageUtil();
            page.setPageNo(pageNo);
            int count = goodsService.selectCountFlag() % size == 0 ? goodsService.selectCountFlag() / size : goodsService.selectCountFlag() / size + 1;
            page.setCount(count);
            logger.debug(count);
            page.setType(0);
            page.setFlag(1);
            req.setAttribute("page", page);
            return "/goods/goods";
        }

        if (type == 0) {
            List<Goods> goods = goodsService.selectAll(pageNo, size);
            req.setAttribute("goods", goods);
            logger.debug(goods);
            PageUtil page = new PageUtil();
            page.setPageNo(pageNo);
            int count = goodsService.selectCount() % size == 0 ? goodsService.selectCount() / size : goodsService.selectCount() / size + 1;
            page.setCount(count);
            page.setType(0);
            logger.debug(count);
            req.setAttribute("page", page);
        } else {
            List<Goods> goods = goodsService.selectByType(type, pageNo, size);
            req.setAttribute("goods", goods);
            logger.debug(goods);
            PageUtil page = new PageUtil();
            page.setPageNo(pageNo);
            int count = goodsService.selectTypeCount(type) % size == 0 ? goodsService.selectTypeCount(type) / size : goodsService.selectTypeCount(type) / size + 1;
            page.setCount(count);
            logger.debug(count);
            page.setType(type);
            req.setAttribute("page", page);
        }
        return "/goods/goods";
    }

    @RequestMapping("/find")
    public String find(String key, HttpServletRequest req, @RequestParam(defaultValue = "1") Integer pageNo, @RequestParam(defaultValue = "2") Integer size) {
        List<Goods> topTen = goodsService.selectTopTen();

        req.setAttribute("topTen", topTen);
        List<Goods> goods = goodsService.selectAllByKey(key, pageNo, size);
        req.setAttribute("goods", goods);
        logger.debug(goods);
        PageUtil page = new PageUtil();
        page.setPageNo(pageNo);
        int count = goodsService.selectCountByName(key) % size == 0 ? goodsService.selectCountByName(key) / size : goodsService.selectCountByName(key) / size + 1;
        page.setCount(count);
        logger.debug(count);
        page.setKey(key);
        page.setFf(1);
        req.setAttribute("page", page);
      logger.debug(page.getKey()+"?????------"+page.getFf());
        return "/goods/goods";
    }
     @RequestMapping("/show")
    public String show(String id, HttpServletRequest request){
         int key = Integer.parseInt(id);
         Goods good=goodsService.selectByID(key);
         request.setAttribute("good", good);
    return "goods/show";
    }

}



