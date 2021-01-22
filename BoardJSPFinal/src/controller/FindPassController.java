package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelAndView;
import service.MemberService;

public class FindPassController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pass = MemberService.getInstance().findPass(id,name);
		ModelAndView view = null;
		try {
			if(pass == null)
				response.getWriter().append("<script>alert('입력하신 정보에 해당하는 회원이 없습니다.');history.back();</script>");
			else {
				request.setAttribute("id", id);
				view = new ModelAndView("pass_update.jsp", false);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return view;
	}

}
