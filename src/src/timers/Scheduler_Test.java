package src.timers;

import java.util.Date;

import org.apache.log4j.BasicConfigurator;
import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class Scheduler_Test {
	public static void main(String[] args) {
		
		
		BasicConfigurator.configure();
	
		SchedulerFactory schedulerFactory = new StdSchedulerFactory();
	
		try {
			//스케줄러 가져오기
			Scheduler scheduler = schedulerFactory.getScheduler();
			
			// 작업(Job) 생성
			JobDetail job = JobBuilder.newJob(Scheduler_Job.class)
					.withIdentity("time",Scheduler.DEFAULT_GROUP)
					.build();
					
					Trigger trigger = TriggerBuilder.newTrigger()
					.withIdentity("timetrigger",Scheduler.DEFAULT_GROUP)
					.withSchedule(CronScheduleBuilder.cronSchedule(" 0 0 0 1/1 * ? "))		//정각마다실행("0 0 0 1/1 * ? ")
					.build();
			// 작업과 트리거를 스케줄러에 등록
			scheduler.scheduleJob(job, trigger);
			
			// 스케줄러 시작
			scheduler.start();
			
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
		

	}
}
	
	
	
	

