package controller;

import common.JsonData;
import model.Address;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.UserService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/user")
public class UserMsgController {
    @Autowired
    private UserService userService;
    @RequestMapping("/msg")
    public String  userMsg(HttpSession session, HttpServletResponse response) throws IOException {
      if(session.getAttribute("user")==null){
          response.sendRedirect(session.getServletContext().getAttribute("APP_PATH") + "/login.jsp");
          return null;
      }else
          return "user/userMsg";
    }
    @RequestMapping("/updateMsg")
    @ResponseBody
    public JsonData updateMsg(User user, HttpSession session){
        User my = (User) session.getAttribute("user");
        my.setPhone(user.getPhone());
        my.setQQ(user.getQQ());
        my.setSex(user.getSex());
        my.setEmail(user.getEmail());
        userService.updateMsg(my);
        return JsonData.success();
    }
    @RequestMapping("/password")

    public String  password( HttpSession session){
        User user= (User) session.getAttribute("user");
        return "user/password" ;

    }
    @RequestMapping("/checkPassword")
    @ResponseBody
    public JsonData  checkPassword( HttpSession session,String password){
        User user= (User) session.getAttribute("user");
        String now = userService.selectPassword(user.getId());
        if(now.equals(password))
            return JsonData.success();
        else
            return JsonData.fail("密码不一致");

    }
    @RequestMapping("/updatePassword")
    @ResponseBody
    public JsonData  updatePassword( HttpSession session,String password){
        User user= (User) session.getAttribute("user");
        try{
            userService.updatePassword(password, user.getId());
        }catch (Exception e){
            e.printStackTrace();
            return JsonData.fail("更新失败");
        }
        return JsonData.success();

    }
    @RequestMapping("/addr")

    public String  addr(HttpServletRequest request,HttpSession session){
        User user = (User) session.getAttribute("user");
        userService.selectAddr(request,user.getId());
        return "user/addr" ;

    }
    @ResponseBody
    @RequestMapping("/deleteAddr")
    public JsonData deleteAddr(Integer id){
        try{
            userService.deleteAddr(id);
        }catch (Exception e){
            e.printStackTrace();
            return JsonData.fail();
        }
        return JsonData.success();
    }
    @RequestMapping("/updateAddr")
    public String goUpdate(Integer id,HttpServletRequest request){
        Address address = userService.selectAddrById(id);
        request.setAttribute("address", address);
        return "user/updateAddr";
    }
    @RequestMapping("/doUpdate")
    @ResponseBody
    public JsonData doUpdate(Address address){
        try{
            userService.updateAddr(address);

        }catch (Exception e){
            e.printStackTrace();
            return JsonData.fail();
        }
        return JsonData.success();
    }

    @RequestMapping("/insertAddr")
    @ResponseBody
    public JsonData insertAddr(Address address,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");

        try{
            userService.insertAddr(user.getId(),address);

        }catch (Exception e){
            e.printStackTrace();
            return JsonData.fail();
        }
        return JsonData.success();
    }
}
