package controller;

import java.io.IOException;

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
			try {
				response.getWriter().append("<script>alert('아이디에 해당하는 회원이 있습니다.');history.back();</script>");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
//			view.setPage("register.jsp");
//			view.setSendRedirect(true);
		}
		
		
		return view;
	}

}
