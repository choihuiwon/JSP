package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelAndView;
import service.MemberService;
import vo.MemberVo;

public class AdminUpdateMemberController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String grade = request.getParameter("grade").toUpperCase();
		
		MemberVo vo = new MemberVo(id, null, name, age, grade);
	
		try {
			if(MemberService.getInstance().modifyManageMemberVo(vo) != 0)
				response.getWriter().print("true");
			else
				response.getWriter().print("false");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
