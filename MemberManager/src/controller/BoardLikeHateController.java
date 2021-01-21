package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import model.ModelAndView;
import service.BoardService;

public class BoardLikeHateController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		int mode = Integer.parseInt(request.getParameter("mode"));
		int result = BoardService.getInstance().adeLikeHate(bno, mode);
		
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		try {
			response.getWriter().print(obj);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
