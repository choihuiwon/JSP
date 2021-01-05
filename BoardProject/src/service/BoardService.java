package service;

import dao.BoardDao;
import dto.BoardDto;
import exception.BoardException;

public class BoardService {
	private static BoardService instance = new BoardService();
	private BoardDao dao;
	public BoardService() {
		dao = BoardDao.getInstance();
	}
	
	public static BoardService getInstance() {
		if(instance == null)
			instance = new BoardService();
		return instance;
	}
	
	public BoardDto insertBoardDto(BoardDto dto) throws BoardException {
		int bno = dao.getBoardNo();	// 게시글 번호 뽑기
		dto.setBno(bno);	// 게시글 번호 셋팅
		dao.insertBoardDto(dto);
		return dao.selectBoardDto(bno);
	}
}
