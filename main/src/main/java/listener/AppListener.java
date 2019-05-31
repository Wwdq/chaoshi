package listener;

import dao.CacheMapper;
import org.springframework.web.context.support.WebApplicationContextUtils;
import service.TimerService;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.Timer;

public class AppListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ServletContext servletContext = servletContextEvent.getServletContext();
        String path=servletContext.getContextPath();
        servletContext.setAttribute("APP_PATH", path);
        //设置定时执行的线程
        Timer timer = new Timer();
        TimerService timerService = WebApplicationContextUtils.getWebApplicationContext(servletContext).getBean(TimerService.class);
        timer.schedule(timerService, 1000, 2000*15*60);

    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
