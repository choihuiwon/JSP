package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelAndView;
import service.EmployeeService;

public class DeleteController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		String eno = request.getParameter("eno");
		int count = EmployeeService.getInstance().deleteEmp(eno);
		try {
			if(count != 0)
				response.getWriter().write("삭제 성공");
			else
				response.getWriter().write("삭제 실패");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
