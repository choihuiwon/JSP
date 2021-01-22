package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import model.ModelAndView;
import service.MemberService;
import vo.MemberVo;

public class AdminSearchMemberController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		String kind = request.getParameter("kind");
		String search = "%" + request.getParameter("search") + "%";
		if(kind.equals("grade"))
			kind = "grade_name";
		search = search.toUpperCase();
		
		List<MemberVo> list = MemberService.getInstance().searchMember(kind,search);
		
		//JSON 객체 생성
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for(int i=0; i<list.size(); i++){
			JSONObject temp = new JSONObject();
			temp.put("id",list.get(i).getId());
			temp.put("name",list.get(i).getName());
			temp.put("age",list.get(i).getAge());
			temp.put("grade",list.get(i).getGrade());
			jsonArray.put(temp);
		}
		jsonObject.put("result",jsonArray);
		try {
			response.getWriter().print(jsonObject);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
