package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.ModelAndView;
import vo.MemberVo;

public class MemberUpdateViewController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		
		MemberVo vo = MemberDao.getInstance().selectMemberVo((String)request.getSession().getAttribute("id"));
		request.setAttribute("vo", vo);
		return new ModelAndView("member/member_update_view.jsp", false);
	}

}
