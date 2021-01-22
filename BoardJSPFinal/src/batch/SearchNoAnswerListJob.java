package batch;


import java.util.List;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import dao.MemberDao;
import dto.QnADto;

public class SearchNoAnswerListJob implements Job{
	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		// 주기적으로 자동으로 수행할 일
		List<QnADto> list = MemberDao.getInstance().selectQnANoAnswerList();
		if(!list.isEmpty()) {
			for(QnADto l : list)
				System.out.println(l.toString());
		}
			
	}
	
}
