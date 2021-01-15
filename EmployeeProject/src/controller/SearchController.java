package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import dto.EmployeeDto;
import model.ModelAndView;
import service.EmployeeService;

public class SearchController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		String kind = request.getParameter("kind");
		String search = request.getParameter("search");
		ArrayList<EmployeeDto> list = EmployeeService.getInstance().searchEmp(kind, search);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = new JSONArray(list);
		result.put("list", jsonArray);
		
		try {
			response.getWriter().write(result.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
