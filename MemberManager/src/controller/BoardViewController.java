package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.BoardDto;
import dto.CommentDto;
import dto.FileDTO;
import model.ModelAndView;
import service.BoardService;

public class BoardViewController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = 0;
		boolean flag = false;
		if(request.getParameter("bno") != null) {
			// 글목록에서 왔을때
			flag = false;
			bno = Integer.parseInt(request.getParameter("bno"));
		}
		else {
			flag = true;
			bno = (int) request.getSession().getAttribute("bno");
			request.getSession().removeAttribute("bno");
		}
		ModelAndView view = null;
		
		try {
			BoardDto dto = BoardService.getInstance().viewBoardDto(bno);
			
			// 댓글 목록 조회
			ArrayList<CommentDto> list = BoardService.getInstance().getCommentDtoList(bno);
			
			// 파일 목록 조회
			ArrayList<FileDTO> fList = BoardService.getInstance().selectFileList(bno);
			
			request.setAttribute("dto", dto);
			request.setAttribute("list", list);
			request.setAttribute("fList", fList);
			
			if(flag)
				view = new ModelAndView("board_view.jsp", false);
			else
				view = new ModelAndView("board/board_view.jsp", false);
				
		} catch (Exception e) {
			try {
				response.getWriter().append("<script>alert('게시글 불러오기 실패');history.back();</script>");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}

		
		return view;
	}

}
