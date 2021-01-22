package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelAndView;
import service.MemberService;

public class UpdatePassController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		int count = MemberService.getInstance().updatePass(id,pass);
		ModelAndView view = null;
		try {
			if(count == 0)
				response.getWriter().append("<script>alert('비밀번호 업데이트 실패');history.back();</script>");
			else {
				view = new ModelAndView("login.jsp", true);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return view;
	}

}
