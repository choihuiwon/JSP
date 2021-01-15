package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.EmployeeDto;
import model.ModelAndView;
import service.EmployeeService;

public class EmpUpdateController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		String eno = request.getParameter("eno");
		String name = request.getParameter("name");
		String department = request.getParameter("department");
		int position = Integer.parseInt(request.getParameter("position"));
		int salary = Integer.parseInt(request.getParameter("salary"));
		EmployeeDto dto = new EmployeeDto(eno, name, department, position);
		int count = EmployeeService.getInstance().updateEmp(dto);
		int count2 = EmployeeService.getInstance().updateEmpSalary(eno, salary);

		if(count != 0 && count2 != 0)
			request.setAttribute("result", "사원 정보 수정 성공");
		else {
			try {
				response.getWriter().append("<script>alert('사원 정보 수정 실패');history.back();</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		ModelAndView view = new ModelAndView("emp_listView.brd", false);
		return view;
	}

}
