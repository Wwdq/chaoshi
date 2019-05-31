package service;

import dao.AdminMapper;
import dao.OrdersMapper;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Service
public class AdminService {
    @Autowired
    private AdminMapper adminMapper;

    public void selectAll(HttpServletRequest request,Integer pageNo, Integer pageSize) {
        List<User> list = adminMapper.selectAll((pageNo - 1) * pageSize, pageSize);
        int count = adminMapper.selectCount();
        int pageMax = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
        request.setAttribute("list", list);
        request.setAttribute("pageMax", pageMax);
    }

    public void selectById(HttpServletRequest request, int id) {
        User user = adminMapper.selectById(id);
        request.setAttribute("sp", user);

    }

    public void doUpdate(User user) {
        adminMapper.updateUser(user);
    }

    public void doDelete(int id) {
        adminMapper.delete(id);
    }
}
