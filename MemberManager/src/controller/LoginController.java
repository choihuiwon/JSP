package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ModelAndView;
import service.MemberService;
import vo.MemberVo;

public class LoginController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		HttpSession session = request.getSession();	// request에서 세션 정보를 읽어옴
		session.setMaxInactiveInterval(60*10);
		
		ModelAndView view = new ModelAndView();
		
		//회원정보 검색 결과를 받음
	
		MemberVo vo = MemberService.getInstance().checkLogin(id,pass);
		if(vo != null){
			session.setAttribute("login", true);
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			session.setAttribute("grade", vo.getGrade());
			
			if(session.getAttribute("result_url")!=null){
				String url = (String)session.getAttribute("result_url");
				session.removeAttribute("result_url");
				view.setPage(url);
				view.setSendRedirect(true);
			}
			else {
				view.setPage("main.jsp");
				view.setSendRedirect(true);
			}
		}else{
			session.setAttribute("login", false);
			view.setPage("login.jsp");
			view.setSendRedirect(true);
		}
	
		return view;
	}

}
