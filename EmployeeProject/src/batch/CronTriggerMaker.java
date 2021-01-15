package batch;

import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.Job;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class CronTriggerMaker {
	private String timer;	// 크론 표현식
	private Class<? extends Job> job;
	private Scheduler scheduler;
	public CronTriggerMaker(String timer, Class<? extends Job> job) {
		super();
		this.timer = timer;
		this.job = job;
	}
	public void createTrigger() {
		SchedulerFactory factory;
		
		// job 생성
		JobDetail jobDetail = JobBuilder.newJob(job).withIdentity(job.getName(), "group").build();
		
		// CronTrigger 생성
		CronTrigger cronTrigger = TriggerBuilder.newTrigger().withIdentity("trigger", "group").
				withSchedule(CronScheduleBuilder.cronSchedule(timer)).build();
		
		factory = new StdSchedulerFactory();
		try {
			scheduler = factory.getScheduler();
			scheduler.start();
			//JobDetail, CronTrigger를 스케줄러에 등록
			scheduler.scheduleJob(jobDetail, cronTrigger);

			// 스케줄러에 등록된 job 비우기때문에 동작 안함
//			scheduler.clear();
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
	}
	public void shutdownScheduler() {
		// 스케줄러 종료
		try {
			scheduler.shutdown();
		} catch (SchedulerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
