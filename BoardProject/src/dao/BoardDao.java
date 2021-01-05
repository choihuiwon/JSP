package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import config.DBManager;
import dto.BoardDto;
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
		Connection conn = manager.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				result = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			manager.close(null, pstmt);
		}
		return result;
	}
	
	// 게시글 등록
	public void insertBoardDto(BoardDto dto) throws BoardException {
		String sql = "insert into board (bno,title, writer,content) values(?,?,?,?)";
		Connection conn = manager.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
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
		Connection conn = manager.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
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
			manager.close(null, pstmt);
		}
		return dto;
	}
	
}
