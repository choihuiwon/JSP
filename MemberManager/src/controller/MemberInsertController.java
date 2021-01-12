package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelAndView;
import service.MemberService;
import vo.MemberVo;

public class MemberInsertController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		String id = (String)request.getParameter("id");
		String passwd = (String)request.getParameter("passwd");
		String name = (String)request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));

		MemberVo vo = new MemberVo(id,passwd,name,age);
		ModelAndView view = new ModelAndView();
		try {
			MemberService.getInstance().insertMemberVo(vo);
			view.setPage("login.jsp");
			view.setSendRedirect(true);
		} catch (Exception e) {
			view.setPage("register.jsp");
			view.setSendRedirect(true);
		}
		
		
		return null;
	}

}
