package service;

import java.util.ArrayList;

import dao.BoardDao;
import dto.BoardDto;
import dto.CommentDto;
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
	
	// 게시글 작성
	public BoardDto insertBoardDto(BoardDto dto) throws BoardException {
		int bno = dao.getBoardNo();	// 게시글 번호 뽑기
		dto.setBno(bno);	// 게시글 번호 셋팅
		dao.insertBoardDto(dto);
		return dao.selectBoardDto(bno);
	}
	
	// 게시글 보기
	public BoardDto viewBoardDto(int bno) throws BoardException {
		// 조회수 카운트
		dao.addCount(bno);
		return dao.selectBoardDto(bno);
	}
	
	// 게시글 목록 가져오기
	public ArrayList<BoardDto> getBoardDtoList(){
		return dao.getBoardDtoList();
	}
	
	// 게시글 좋아요/싫어요 업데이트
	public int adeLikeHate(int bno, int mode) {
		dao.addLikeHate(bno, mode);
		return dao.selectLikeHate(bno, mode);
	}
	
	// 게시글 댓글 등록
	public int insertBoardComment(CommentDto dto) {
		return dao.insertBoardComment(dto);
	}
	
	// 게시글 댓글 목록 읽어오기
	public ArrayList<CommentDto> getCommentDtoList(int bno){
		return dao.getCommentDtoList(bno);
	}
}
