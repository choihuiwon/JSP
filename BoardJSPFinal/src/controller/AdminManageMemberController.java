package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.ModelAndView;
import service.MemberService;
import vo.MemberVo;

public class AdminManageMemberController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		List<MemberVo> list = MemberService.getInstance().getMemberVoList();
		request.setAttribute("list", list);
		return new ModelAndView("admin/manage_member_view.jsp", false);
	}

}
