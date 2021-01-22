package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelAndView;
import service.MemberService;

public class ResponseQnAController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		int qno = Integer.parseInt(request.getParameter("qno"));
		String res = request.getParameter("res");
		
		ModelAndView view = new ModelAndView();
		
		int count = MemberService.getInstance().responseQnA(qno, res);
		try {
			if(count == 0)
				response.getWriter().append("<script>alert('답변등록 실패');history.back();</script>");
			else {
				view.setPage("qnaView.do");
				view.setSendRedirect(true);
			}
				
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return view;
	}

}
