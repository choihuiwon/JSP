package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelAndView;
import service.MemberService;

public class AdminDeleteMemberController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		try {
			if(MemberService.getInstance().deleteManageMemberVo(id) != 0)
				response.getWriter().print("true");
			else
				response.getWriter().print("false");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
