package controller;

import common.JsonData;
import model.User;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class UserController {
    @Autowired
    private UserService  userService;
    private Logger logger = Logger.getLogger(UserController.class);
    @RequestMapping("/loginOut")
    public void loginOut(HttpSession session,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        session.removeAttribute("user");
        session.invalidate();
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }
    @RequestMapping("/loginIn")
    public void loginIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath()+"/index.jsp");
    }
    @RequestMapping("/doLogin")
    @ResponseBody
     public  JsonData doLogin(User user, HttpSession session){
        User user1= userService.doLogin(user);
        if(user1==null) {
            return JsonData.fail("用户名密码不匹配");
        }
        else {
            session.setAttribute("user", user1);
            return  JsonData.success();
        }
     }
     @RequestMapping("/hasUser")
     @ResponseBody
     public JsonData hasUsername(String username){
         if(userService.hasUsername(username))
              return JsonData.success();
         else
         return JsonData.fail("用户名已经存在");
     }
    @RequestMapping("/loginNow")
     public void loginIn(User user,HttpSession session,HttpServletResponse res,HttpServletRequest re) throws ServletException, IOException {
         logger.debug(user);
         userService.insertUser(user);
         user.setName(user.getUsername());
         session.setAttribute("user", user);
         res.sendRedirect(re.getContextPath()+"/index.jsp");

     }
//    @RequestMapping("/session")
//    @ResponseBody
//    public JsonData session(HttpSession session ){
//        System.out.println((User)session.getAttribute("user"));
//            session.invalidate();
//
//            return JsonData.success();
//
//    }
    }

