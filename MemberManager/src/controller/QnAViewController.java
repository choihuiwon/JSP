package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.QnADto;
import model.ModelAndView;
import service.MemberService;

public class QnAViewController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		int pageNo = 1;
		if(request.getParameter("pageNo") != null)
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		String id = (String) request.getSession().getAttribute("id");
		String grade= (String) request.getSession().getAttribute("grade");
		if(id == null)
			return new ModelAndView("main.jsp", true);
		ArrayList<QnADto> list = MemberService.getInstance().selectQnAList(id, pageNo, grade);
		request.setAttribute("list", list);
		
		return new ModelAndView("qna.jsp", false);
	}

}
