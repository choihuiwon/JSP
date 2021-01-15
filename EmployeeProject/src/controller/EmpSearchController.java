package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.EmployeeDto;
import model.ModelAndView;
import service.EmployeeService;

public class EmpSearchController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		String kind = request.getParameter("kind");
		String search = request.getParameter("search");
		ArrayList<EmployeeDto> list = EmployeeService.getInstance().searchEmp(kind, search);
		
		request.setAttribute("list", list);
		return new ModelAndView("emp_listView.brd", false);
	}

}
