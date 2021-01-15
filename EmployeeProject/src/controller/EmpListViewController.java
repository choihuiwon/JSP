package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.EmployeeDto;
import model.ModelAndView;
import service.EmployeeService;

public class EmpListViewController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		// 사원정보
		HttpSession session = request.getSession();
		int position = (int) session.getAttribute("position");
		String department = (String) session.getAttribute("department");
		if(request.getAttribute("result") != null)
			request.setAttribute("result", request.getAttribute("result"));
		
		if(position > 3 && department.equals("인사")) {
			ArrayList<EmployeeDto> list = null;
			if(request.getAttribute("list") != null)
				list = (ArrayList<EmployeeDto>) request.getAttribute("list");
			else
				list = EmployeeService.getInstance().getEmpList();
				
			request.setAttribute("list", list);
		} else
			try {
				response.getWriter().append("<script>alert('권한이 없습니다.<br>관리자 모드는 인사과 과장 이상만 접근할 수 있습니다.');history.back();</script>");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return new ModelAndView("employee_manager.jsp", false);
	}

}
