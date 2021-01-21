package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import dto.QnADto;
import model.ModelAndView;
import service.MemberService;

public class NextQnAListController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		// 1. 조회할 페이지 번호 읽어옴
		int pageNo = 1;
		if(request.getParameter("pageNo") != null)
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		String id = (String) request.getSession().getAttribute("id");
		String grade= (String) request.getSession().getAttribute("grade");
		if(id == null)
			return new ModelAndView("member/login.jsp", true);
		// 2. 해당 페이지 목록을 읽어옴
		ArrayList<QnADto> list = MemberService.getInstance().selectQnAList(id, pageNo, grade);
		// 3. 다음 페이지 번호 다음페이지가 없으면 0
		if(MemberService.getInstance().selectQnAList(id, pageNo+1, grade).size() == 0) 
			pageNo = 0;
		else 
			pageNo++;
		
		// 4. json으로 변환(qnadto, 다음페이지 번호)
		JSONObject result = new JSONObject();
		JSONArray arr = new JSONArray(list);
		result.put("nextPage", pageNo);
		result.put("list", arr);
		result.put("grade", grade);
		// 5. writer로 출력
		try {
			response.getWriter().write(result.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 6. modelandview 필요 없다 return null
		return null;
	}

}
