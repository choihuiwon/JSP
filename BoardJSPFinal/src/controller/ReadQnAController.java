package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelAndView;
import service.MemberService;

public class ReadQnAController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		int qno = Integer.parseInt(request.getParameter("qno"));
		int count = MemberService.getInstance().readQnA(qno);
		ModelAndView view = new ModelAndView();
		try {
			if(count == 0)
				response.getWriter().append("<script>alert('답변 읽기 실패');history.back();</script>");
			else {
				view.setPage("qnaView.do");
				view.setSendRedirect(true);
			}
				
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return view;
	}

}
