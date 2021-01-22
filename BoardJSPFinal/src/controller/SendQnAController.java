package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.QnADto;
import model.ModelAndView;
import service.MemberService;

public class SendQnAController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		
		String writer = (String) request.getSession().getAttribute("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		if(writer == null || title == null || content == null)
			try {
				response.getWriter().append("<script>alert('데이터를 전부 입력해 주세요.');history.back();</script>");
			} catch (IOException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
		
		QnADto dto = new QnADto(title, content, writer);
		ModelAndView view = new ModelAndView();
		
		try {
			MemberService.getInstance().sendQnA(dto);
			view.setPage("qnaView.do");
			view.setSendRedirect(true);
		} catch (Exception e) {
			e.printStackTrace();
			try {
				response.getWriter().append("<script>alert('문의 등록 실패');history.back();</script>");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		return view;
	}

}
