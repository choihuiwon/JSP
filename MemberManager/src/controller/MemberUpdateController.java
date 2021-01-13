package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ModelAndView;
import service.MemberService;
import vo.MemberVo;

public class MemberUpdateController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
//		request.setCharacterEncoding("utf-8");
		
		// 수정할 데이터들
		String id = request.getParameter("id");
		String pass = request.getParameter("passwd");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		ModelAndView view = new ModelAndView();
		try {
			if(id == null || pass == null || name == null)
				response.getWriter().append("<script>alert('데이터를 전부 입력해 주세요.');history.back();</script>");

			MemberVo vo = new MemberVo(id,pass,name,age);
			MemberService.getInstance().modifyMemberVo(vo);
			view.setPage("main.jsp");
			view.setSendRedirect(true);
			// 세션 정보 최신화
			HttpSession session = request.getSession();
			session.setAttribute("name", name);
		} catch (IOException e2) {
			e2.printStackTrace();
		} catch (Exception e) {
			try {
				response.getWriter().append("<script>alert('정보수정 실패');history.back();</script>");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		
		return view;
	}

}
