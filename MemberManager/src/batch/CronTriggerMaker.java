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
	
	public CronTriggerMaker(String timer, Class<? extends Job> job) {
		super();
		this.timer = timer;
		this.job = job;
	}
	public void createTrigger() {
		SchedulerFactory factory;
		Scheduler scheduler;
		
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
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		/*
		 * 크론 표현식 : 초 분 시 일 월 요일 년도
		 * 초 : 0~59, * , /
		 * 분 : 0~59, * , /
		 * 시 : 0~23, * , /
		 * 일 : 1~31, * , /
		 * 월 : 1~12, * , /
		 * 요일 : 0~6, SUN ~ SAT, * ? / L #
		 * 년도 : 비우거나 1970~2099, - * /
		 * 
		 * * : 모든 값
		 * ? : 특정한 값이 없음
		 * - : 범위 SUN-SAT
		 * / : 시작시간 / 단위
		 * , : 특정 값일때만
		 * 
		 * 0/5 * * * * ? --> 5초마다
		 * 0 0/5 * * * ? --> 5분마다
		 * 0 22 23 ? * * ? --> 23시 22분 0초마다 실행
		 * http://www.cronmaker.com/
		*/
		CronTriggerMaker js = new CronTriggerMaker("* * * * * ?", IntervalJob.class);
		js.createTrigger();
	}
}
