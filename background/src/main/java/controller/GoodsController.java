package controller;

import common.JsonData;
import model.Goods;
import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.GoodsService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/goods")
public class GoodsController {
    @Autowired
    private GoodsService goodsService;
    @RequestMapping("/main")
    public String main(String key, HttpServletRequest request,@RequestParam(defaultValue = "1") Integer pageNo, @RequestParam(defaultValue = "8") Integer pageSize){
        if(key==null||key.equals(""))
            goodsService.selectAll(request, pageNo, pageSize);
        else
            goodsService.selectAllbyKey(key,request, pageNo, pageSize);
        return "goods/main";
    }
    @RequestMapping("/add")
    public String add(){

        return "goods/add";
    }
    @RequestMapping("/insert")
    @ResponseBody
    public JsonData insert(Goods goods){
        goodsService.insert(goods);
        return JsonData.success();
    }
    @RequestMapping("/delete")
    public void  delete(int id, HttpServletRequest request,HttpServletResponse response) throws IOException {
        goodsService.delete(id);
        response.sendRedirect(request.getContextPath()+"/goods/main");

    }
    @RequestMapping("/discount")
    public void discount(int id,HttpServletRequest request,HttpServletResponse response) throws IOException {
        goodsService.updateDiscount(id);
        response.sendRedirect(request.getContextPath()+"/goods/main");
    }
    @RequestMapping("/update")
    public String update(HttpServletRequest request,int id){
        goodsService.update(id, request);
        return "goods/update";
    }
    @RequestMapping("/doUpdate")
    @ResponseBody
    public JsonData doUpdate(HttpServletRequest request,Goods goods){
        goodsService.doUpdate(goods);
        return JsonData.success();
    }

}
