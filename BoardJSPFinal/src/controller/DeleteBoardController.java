package controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.FileDTO;
import model.ModelAndView;
import service.BoardService;

public class DeleteBoardController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		List<FileDTO> list = BoardService.getInstance().selectFileList(bno);
		for(int i=0; i<list.size(); i++) {
			File file = new File("c:\\fileupload\\"+list.get(i).getWriter()+"\\"+list.get(i).getFileName());
			file.delete();	// 현재 연결된 파일을 삭제
		}
		
		// db 처리
		if(list.size()>0)
			BoardService.getInstance().deleteFileList(bno);
		// 게시글 삭제
		BoardService.getInstance().deleteBoard(bno);
		
		return new ModelAndView("index.jsp",true);
	}

}
