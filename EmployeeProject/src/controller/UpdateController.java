package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.EmployeeDto;
import model.ModelAndView;
import service.EmployeeService;

public class UpdateController implements Controller {

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
		
	
		try {
			if(count != 0 && count2 != 0)
				response.getWriter().write("수정 성공");
			else
				response.getWriter().write("수정 실패");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
