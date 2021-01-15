package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.EmployeeDto;
import model.ModelAndView;
import service.EmployeeService;

public class EmpInsertController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		String eno = request.getParameter("eno");
		String name = request.getParameter("name");
		String department = request.getParameter("department");
		int position = Integer.parseInt(request.getParameter("position"));
		int salary = Integer.parseInt(request.getParameter("salary"));
		
		EmployeeDto dto = new EmployeeDto(eno, name, department, position, salary);
		int count = EmployeeService.getInstance().insertEmp(dto);
		try {
			if(count == 0)
				response.getWriter().append("<script>alert('사원 등록 실패');history.back();</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("result", "사원 등록 성공");
		return new ModelAndView("emp_listView.brd", false);
	}

}
