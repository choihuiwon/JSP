package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import config.DBManager;
import exception.MemberException;
import vo.MemberVO;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();
	
	private MemberDAO() {

	}

	public static MemberDAO getInstance() {
		if(instance == null)
			instance = new MemberDAO();
		return instance;
	}

	public MemberVO selectMemberVO(String id) {
		MemberVO vo = null;
		String sql = "select * from member where id like ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = DBManager.getInstance().getConn().prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new MemberVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBManager.getInstance().close(pstmt, rs);
		}
		
		return vo;
	}
	
	public void insertMemberVO(MemberVO vo) throws MemberException {
		PreparedStatement pstmt = null;
		String sql = "insert into member(id,pass,name,age) values(?,?,?,?)";
		try {
			pstmt = DBManager.getInstance().getConn().prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getName());
			pstmt.setInt(4, vo.getAge());
			int count = pstmt.executeUpdate();
			if(count == 0)
				throw new MemberException("회원등록에 실패했습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updatePass(String id, String pass) throws MemberException {
		PreparedStatement pstmt = null;
		String sql = "update  member set pass = ? where id = ?";
		try {
			pstmt = DBManager.getInstance().getConn().prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setString(2,id);
			int count = pstmt.executeUpdate();
			if(count == 0)
				throw new MemberException("암호수정에 실패했습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public MemberVO login(String id, String pass) {
		MemberVO vo = null;
		String sql = "select * from member where id like ? and pass like ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = DBManager.getInstance().getConn().prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new MemberVO(rs.getString(1), null, rs.getString(3), rs.getInt(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBManager.getInstance().close(pstmt, rs);
		}
		
		return vo;
	}
	
	
	
	
	
	
	
}



















