package controller;

import common.JsonData;
import model.Address;
import model.User;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.OrderService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;
    private Logger logger = Logger.getLogger(OrderController.class);

    @RequestMapping("/main")

    public String main(HttpServletRequest req,Integer []id , double total){
        logger.debug("接收请求："+total);
        orderService.doOrder(req,id, total);

        return "order/main";
    }
    @RequestMapping("/insert")
    @ResponseBody
    public JsonData insert(HttpServletRequest req, Address address,Integer[] id, Double total, Integer key){
        logger.debug("接收请求000："+total);
        HttpSession session=req.getSession();
        User user = (User) session.getAttribute("user");
        orderService.insertOrders(session,user.getId(), total, id,key,address);
        return JsonData.success();
    }
    @RequestMapping("/userOrder")

    public String  toOrder(HttpServletRequest req ){
        User user = (User) req.getSession().getAttribute("user");
        orderService.selectOrdersByUserId(req,user.getId());
        return "order/userOrder";
    }
    @RequestMapping("/select")

    public String  selectByStatus(HttpServletRequest req,Integer status ){
        User user = (User) req.getSession().getAttribute("user");
        orderService.selectOrdersByStatus(req,user.getId(),status);
        return "order/userOrder";
    }
    @RequestMapping("/delete")
    @ResponseBody
    public JsonData insert(HttpServletRequest req,Integer id){

        HttpSession session=req.getSession();
        User user = (User) session.getAttribute("user");
        orderService.deleteOrders(session,user.getId(), id);
        return JsonData.success();
    }
    @RequestMapping("/doStatus")
    @ResponseBody
    public JsonData insert(HttpServletRequest req,Integer id,Integer status){

        HttpSession session=req.getSession();

        orderService.updateStatus(id, status, session);
        return JsonData.success();
    }
    @RequestMapping("/checkNumber")
    @ResponseBody
    public JsonData checkNumber(HttpServletRequest req,Integer[] id){

        HttpSession session=req.getSession();

        String msg = orderService.checkNumber(req.getSession(),id);
        if(msg.equals("success")) {
            return JsonData.success();
        }else{
            return JsonData.fail(msg + "库存不足");
        }
    }

}
