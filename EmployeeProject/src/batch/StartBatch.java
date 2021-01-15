package batch;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class StartBatch
 *
 */
@WebListener
public class StartBatch implements ServletContextListener {
	CronTriggerMaker js;
    /**
     * Default constructor. 
     */
    public StartBatch() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
    	System.out.println("MemberManager End");
    	js.shutdownScheduler();// 스케줄러 종료
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
    	System.out.println("MemberManager Start");
    	js = new CronTriggerMaker("0 0 9 1 1 ? *", SalaryIncreaseJob.class);
		js.createTrigger();
    }
	
}
