package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import db.DBManager;
import dto.BoardDto;
import dto.CommentDto;
import dto.FileDTO;

public class BoardDao {
	private static BoardDao instance = new BoardDao();
	private SqlSession session;
	private BoardDao() {
		session = DBManager.getInstance().getSession();
	}

	public static BoardDao getInstance() {
		if (instance == null)
			instance = new BoardDao();
		return instance;
	}


	// 게시글 번호를 뽑음
	public int getBoardNo() {
		int result=0;
		result = session.selectOne("board.getBoardNo");
		return result;
	}
	
	// 게시글 등록
	public int insertBoardDto(BoardDto dto) {
		int result=0;
		result = session.insert("board.insertBoardDto", dto);
		return result;
	}

	// 게시글번호로 게시글 정보 반환
	public BoardDto selectBoardDto(int bno) {
		return session.selectOne("board.selectBoardDto", bno);
	}

	// 게시글 조회수 올리기
	public void addCount(int bno) {
		session.update("board.addCount", bno);
	}
	
	// 게시글 목록 가져오기
	public List<BoardDto> getBoardDtoList(int pageNo, String mode) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", pageNo);
		map.put("mode", mode);
		return session.selectList("board.getBoardDtoList", map);
	}

	// 좋아요 / 싫어요 업데이트
	public void addLikeHate(int bno, int mode){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		if(mode == 0)
			map.put("mode", "blike");
		else 
			map.put("mode", "bhate");	
		session.update("board.addLikeHate", map);
	}

	// 좋아요/ 싫어요 개수 반환
	public int selectLikeHate(int bno, int mode) {
		int result=0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		if(mode == 0)
			map.put("mode", "blike");
		else 
			map.put("mode", "bhate");	
		result = session.selectOne("board.selectLikeHate", map);
		return result;
	}

	// 게시판 댓글 등록
	public int insertBoardComment(CommentDto dto) {
		int count = 0;
		count = session.insert("board.insertBoardComment", dto);
		return count;
	}

	// 게시판 댓글 목록 가져오기
	public List<CommentDto> getCommentDtoList(int bno) {
		return session.selectList("board.getCommentDtoList", bno);
	}

	// 게시판 댓글 갯수 반환
	public int getBoardCommentCount(int bno) {
		int count = 0;
		count = session.selectOne("board.getBoardCommentCount",bno);
		return count;
	}
	
	// 전체 게시글 개수
	public int getCount() {
		int result = 0;
		result = session.selectOne("board.getCount");
		return result;
	}
	
	// 파일 넣기
	public int insertFileList(List<FileDTO> fList) {
		int result = 0;
		for(int i=0; i<fList.size(); i++) {
			result = session.insert("board.insertFileList", fList.get(i));
		}
		return result;
	}
	
	// 파일 목록 출력
	public List<FileDTO> selectFileList(int bno){
		return session.selectList("board.selectFileList", bno);
	}

	// 파일 삭제
	public int deleteFileList(int bno) {
		int result = 0;
		result = session.delete("board.deleteFileList",bno);
		return result;
	}
	
	// 게시글 삭제
	public int deleteBoard(int bno) {
		int result = 0;
		result = session.delete("board.deleteBoard",bno);
		return result;
	}
}
