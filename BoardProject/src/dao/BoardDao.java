package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import config.DBManager;
import dto.BoardDto;
import dto.CommentDto;
import exception.BoardException;

public class BoardDao {
	private static BoardDao instance = new BoardDao();
	private DBManager manager;

	public BoardDao() {
		manager = DBManager.getInstance();
	}

	public static BoardDao getInstance() {
		if (instance == null)
			instance = new BoardDao();
		return instance;
	}


	// 게시글 번호를 뽑음
	public int getBoardNo() {
		int result=0;
		String sql = "select bno_seq.nextval from dual";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
//			pstmt = manager.getSource().getConnection().prepareStatement(sql);
			pstmt = manager.getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				result = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			manager.close(rs, pstmt);
		}
		return result;
	}
	
	// 게시글 등록
	public void insertBoardDto(BoardDto dto) throws BoardException {
		String sql = "insert into board (bno,title, writer,content) values(?,?,?,?)";
		PreparedStatement pstmt = null;
		try {
//			pstmt = manager.getSource().getConnection().prepareStatement(sql);
			pstmt = manager.getConnection().prepareStatement(sql);
			pstmt.setInt(1, dto.getBno());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getWriter());
			pstmt.setString(4, dto.getContent());
			int count = pstmt.executeUpdate();
			if (count == 0)
				throw new BoardException("게시글 등록에 실패했습니다.");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			manager.close(null, pstmt);
		}
	}

	// 게시글번호로 게시글 정보 반환
	public BoardDto selectBoardDto(int bno) {
		BoardDto dto = null;
		String sql = "select * from board where bno = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
//			pstmt = manager.getSource().getConnection().prepareStatement(sql);
			pstmt = manager.getConnection().prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String title = rs.getString(2);
				String bdate = rs.getString(3);
				int bcount = rs.getInt(4);
				String writer = rs.getString(5);
				String content = rs.getString(6);
				int blike = rs.getInt(7);
				int bhate = rs.getInt(8);
				dto = new BoardDto(bno, title, bdate, bcount, writer, content, blike, bhate);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			manager.close(rs, pstmt);
		}
		return dto;
	}

	// 게시글 조회수 올리기
	public void addCount(int bno) throws BoardException {
		String sql = "update board set bcount = bcount +1 where bno = ?";
		PreparedStatement pstmt = null;
		try {
//			pstmt = manager.getSource().getConnection().prepareStatement(sql);
			pstmt = manager.getConnection().prepareStatement(sql);
			pstmt.setInt(1, bno);
			int count = pstmt.executeUpdate();
			if(count == 0)
				throw new BoardException("조회수 올리기 실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			manager.close(null, pstmt);
		}
	}
	
	// 게시글 목록 가져오기
	public ArrayList<BoardDto> getBoardDtoList(int pageNo) {
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		String sql = "select * from (select ceil(rownum/7) as pagenum, bno, title, bdate, bcount, writer, content, blike, bhate, comment_count "
					+ "from (select b.*, nvl(c.comment_count, 0) as comment_count "
					+ "from board b, (select bno, count(*) as comment_count "
					+ "from BOARD_COMMENT group by bno) c "
					+ "where b.bno = c.bno(+) order by b.bno desc)) " 
					+ "where pagenum = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
//			pstmt = manager.getSource().getConnection().prepareStatement(sql);
			pstmt = manager.getConnection().prepareStatement(sql);
			pstmt.setInt(1, pageNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new BoardDto(rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10)));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			manager.close(rs, pstmt);
		}
		return list;
	}

	// 좋아요 / 싫어요 업데이트
	public void addLikeHate(int bno, int mode){
		String sql="";
		if(mode == 0) sql = "update board set blike = blike + 1 where bno=?";
		else sql = "update board set bhate = bhate + 1 where bno=?";
		
		PreparedStatement pstmt = null;
		
		try {
//			pstmt = manager.getSource().getConnection().prepareStatement(sql);
			pstmt = manager.getConnection().prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			manager.close(null, pstmt);
		}
	}

	// 좋아요/ 싫어요 개수 반환
	public int selectLikeHate(int bno, int mode) {
		int result=0;
		String sql;
		if(mode == 0) 
			sql = "select blike from board where bno=?"; 
		else 
			sql = "select bhate from board where bno=?"; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
//			pstmt = manager.getSource().getConnection().prepareStatement(sql);
			pstmt = manager.getConnection().prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			if(rs.next())
				result = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			manager.close(rs, pstmt);
		}
		return result;
	}

	// 게시판 댓글 등록
	public int insertBoardComment(CommentDto dto) {
		int count = 0;
		String sql = "insert into board_comment(cno, bno, content, writer) values(cno_seq.nextval,?,?,?)";
		PreparedStatement pstmt = null;
		try {
//			pstmt = manager.getSource().getConnection().prepareStatement(sql);
			pstmt = manager.getConnection().prepareStatement(sql);
			pstmt.setInt(1, dto.getBno());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getWriter());
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			manager.close(null, pstmt);
		}
		return count;
	}

	// 게시판 댓글 목록 가져오기
	public ArrayList<CommentDto> getCommentDtoList(int bno) {
		ArrayList<CommentDto> list = new ArrayList<CommentDto>();
		String sql = "select cno, content, cdate, writer, blike, bhate from board_comment where bno = ? order by cdate desc";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = manager.getConnection().prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new CommentDto(rs.getInt(1), bno, rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 게시판 댓글 갯수 반환
	public int getBoardCommentCount(int bno) {
		int count = 0;
		String sql = "select count(*) from board_comment where bno = ? group by bno";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = manager.getConnection().prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			if(rs.next())
				count = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			manager.close(rs, pstmt);
		}
		return count;
	}
	
	// 전체 게시글 개수
	public int getCount() {
		int result = 0;
		String sql = "select count(*) from board";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = manager.getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				result = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			manager.close(rs, pstmt);
		}
		return result;
	}
}
