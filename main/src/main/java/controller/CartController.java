package controller;

import common.JsonData;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.CartService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartService cartService;
    @RequestMapping("/main")
    public String toCart(HttpServletRequest request){
        HttpSession session=request.getSession();
        User user = (User) session.getAttribute("user");
        cartService.selectCartById( request,session, user);
        return "cart/cart";
    }
    @RequestMapping("/addCart")
    @ResponseBody
    public JsonData addCart(HttpServletRequest req,Integer id,Integer number){
        User user= (User) req.getSession().getAttribute("user");
        cartService.addCart(req, id, number, user.getId());
        return  JsonData.success();
    }
    @RequestMapping("/subCart")
    @ResponseBody
    public JsonData addCart(HttpServletRequest req,Integer id){
        User user= (User) req.getSession().getAttribute("user");
        cartService.subCart(req, id, user.getId());
        return  JsonData.success();
    }
    @RequestMapping("/delCart")

    public String delCart(HttpServletRequest req,Integer id){
        User user= (User) req.getSession().getAttribute("user");
        cartService.delCart(req, id, user.getId());
        return  "cart/cart";
    }

}
