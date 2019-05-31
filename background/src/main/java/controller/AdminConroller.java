package controller;

import common.JsonData;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.AdminService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/spuser")
public class AdminConroller {
    @Autowired
    private AdminService adminService;
    @RequestMapping("/main")
    public String main(HttpServletRequest request, @RequestParam(defaultValue = "1") Integer pageNo, @RequestParam(defaultValue = "8") Integer pageSize){
        adminService.selectAll(request,pageNo, pageSize);
        return "spuser/main";
    }
    @RequestMapping("/update")
    public String update(HttpServletRequest request,int id){
        adminService.selectById(request, id);
        return "spuser/update";
    }
    @RequestMapping("/doUpdate")
    @ResponseBody
    public JsonData doUpdate(HttpServletRequest request, User user){
        adminService.doUpdate(user);
        return JsonData.success();
    }
    @RequestMapping("/delete")

    public void delete(HttpServletRequest request, HttpServletResponse response, int id) throws IOException {
        adminService.doDelete(id);
response.sendRedirect(request.getContextPath()+"/spuser/main");

    }
}
