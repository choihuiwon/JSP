package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dto.BoardDto;
import model.ModelAndView;
import service.BoardService;
import vo.PaggingVo;

public class BoardListViewController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = null;
		if(request.getParameter("flag") == "true") {
			// 글쓰고 목록보기 누른 경우 
			view = new ModelAndView("board_list_view.jsp", false);
		}else {
			view = new ModelAndView("/board/board_list_view.jsp", false);
		}
		// 페이징
		int pageNo = 1;
		if(request.getParameter("pageNo") != null)		
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		
		// 페이징 정보를 읽어옴
		int count = BoardDao.getInstance().getCount();	// 전체 글 개수
		PaggingVo pageVo = new PaggingVo(count, pageNo);
		
		
		// mode
		String mode = "bno";
		if(request.getParameter("mode") != null) 
			mode = request.getParameter("mode");
		
		// 리스트 받아오기 + 페이징 처리 + mode 처리
		ArrayList<BoardDto> list = BoardService.getInstance().getBoardDtoList(pageNo, mode);

		// 댓글 수
		BoardDao dao = BoardDao.getInstance();
		
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("list", list);
		request.setAttribute("dao", dao);
		request.setAttribute("pageVo", pageVo);
		request.setAttribute("mode", mode);
		return view;
	}

}
