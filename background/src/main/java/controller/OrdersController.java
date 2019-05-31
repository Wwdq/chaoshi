package controller;

import common.JsonData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.OrdersService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/orders")
public class OrdersController {
    @Autowired
    private OrdersService ordersService;
    @RequestMapping("/main")
    public String main(HttpServletRequest request, Integer flag,@RequestParam(defaultValue = "1") Integer pageNo, @RequestParam(defaultValue = "5") Integer pageSize){
        if(flag==null||flag.equals("")) {
            ordersService.selectAll(request, pageNo,pageSize);
        }else {
            ordersService.selectByStatus(request,flag, pageNo,pageSize);

        }
        return "orders/main";
    }
    @RequestMapping("/status")

    public void doStatus(HttpServletRequest request, HttpServletResponse response,Integer id, Integer status) throws IOException {
        ordersService.updateStatus(id,status);
        int flag = status == 1 ? 0 : 1;
        response.sendRedirect(request.getContextPath()+"/orders/main?flag="+flag);

    }



}
