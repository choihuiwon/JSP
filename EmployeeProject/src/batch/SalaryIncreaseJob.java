package batch;



import java.util.ArrayList;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import dto.EmployeeDto;
import service.EmployeeService;

public class SalaryIncreaseJob implements Job{
	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		// 주기적으로 자동으로 수행할 일
		System.out.println("연봉 증가 대상자");
		ArrayList<EmployeeDto> list = EmployeeService.getInstance().lowSalary();
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i).getEno() + " " + list.get(i).getName() + " " + list.get(i).getDepartment());
		}
		int count = EmployeeService.getInstance().lowSalaryIncreas();
		if(count != 0)	System.out.println("사원 연봉 증가 완료 5건");
	}
	
}
