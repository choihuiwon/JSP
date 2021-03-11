package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import config.DBManager;
import exception.MemberException;
import vo.MemberVo;

public class MemberDao {
	private static MemberDao instance = new MemberDao();

	private DBManager manager;

	private MemberDao() {
		manager = DBManager.getInstance();
	}

	public static MemberDao getInstance() {
		if (instance == null)
			instance = new MemberDao();
		return instance;
	}

	public void insertMemberVo(MemberVo vo) throws Exception {
		String sql = "insert into member (id, passwd, name, age) values(?,?,?,?)";

		Connection conn = manager.getConnection();
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPasswd());
			pstmt.setString(3, vo.getName());
			pstmt.setInt(4, vo.getAge());
			int count = pstmt.executeUpdate();
			if (count == 0)
				throw new MemberException("회원 등록에 실패했습니다.");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} /*
			 * finally { manager.close(null, pstmt); }
			 */

	}

	public MemberVo selectMemberVo(String id) throws Exception {
		MemberVo vo = null;
		String sql = "select * from member where id like ?";
		Connection conn = manager.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new MemberVo(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4));
			}
			if (vo == null)
				throw new MemberException("회원 정보가 없습니다.");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} /*
			 * finally { manager.close(rs, pstmt); }
			 */
		return vo;
	}

	public void updatePass(String id, String pass) throws MemberException {
		// TODO Auto-generated method stub
		String sql = "update member set passwd = ? where id like ?";
		Connection conn = manager.getConnection();
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setString(2, id);
			int count = pstmt.executeUpdate();
			if (count == 0)
				throw new MemberException("암호수정에 실패했습니다.");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} /*
			 * finally { manager.close(rs, pstmt); }
			 */
	}

	public MemberVo checkLogin(String id, String pass) throws MemberException {
		MemberVo vo = null;
		String sql = "select * from member where id like ? and passwd like ?";
		Connection conn = manager.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// 암호는 왔다갔다 하는거 비추
				vo = new MemberVo(rs.getString(1), null, rs.getString(3), rs.getInt(4));
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} /*
			 * finally { manager.close(rs, pstmt); }
			 */
		return vo;
	}

	public void updateMember(MemberVo vo) throws MemberException {
		String sql = "update member set passwd = ?, name=?, age=? where id like ?";
		Connection conn = manager.getConnection();
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPasswd());
			pstmt.setString(2, vo.getName());
			pstmt.setInt(3, vo.getAge());
			pstmt.setString(4, vo.getId());
			int count = pstmt.executeUpdate();
			if (count == 0)
				throw new MemberException("정보수정에 실패했습니다.");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} /*
			 * finally { manager.close(rs, pstmt); }
			 */
	}

	// 회원 등급을 반환하는 메서드
	public String memberGradeName(String id) {
		String grade_name = "";
		String sql = "select grade_name from member m, grade_list g where m.id like ? and m.grade = g.grade_no";
		Connection conn = manager.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				grade_name = rs.getString(1);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} /*
			 * finally { manager.close(rs, pstmt); }
			 */
		return grade_name;
	}

	// 회원 정보 리스트를 반환하는 메서드
	public ArrayList<MemberVo> getMemberVoList() {
		ArrayList<MemberVo> list = new ArrayList<MemberVo>();
		String sql = "select id, name, passwd, age, grade_name " + "from member, grade_list where grade_no = grade  order by grade desc";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = DBManager.getInstance().getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(new MemberVo(rs.getString(1), null, rs.getString(2), rs.getInt(4), rs.getString(5)));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstance().close(rs, pstmt);
		}

		return list;
	}

	// 검색할 종류와 검색어를 받아 정보 리스트를 반환하는 메서드
	public ArrayList<MemberVo> searchMember(String kind, String search) {
		ArrayList<MemberVo> list = new ArrayList<MemberVo>();
		String sql = "select id, name, passwd, age, grade_name " + "from member, grade_list where grade_no = grade and "
				+ kind + " like ?  order by grade desc";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = DBManager.getInstance().getConnection().prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new MemberVo(rs.getString(1), null, rs.getString(2), rs.getInt(4), rs.getString(5)));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstance().close(rs, pstmt);
		}

		return list;
	}

	// 회원 수정(관리자용)
	public boolean modifyManageMemberVo(MemberVo vo) {
		String sql = "update member set name=?, age=?, grade=(select grade_no from grade_list where grade_name like ?) where id like ?";
		Connection conn = manager.getConnection();
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getAge());
			pstmt.setString(3, vo.getGrade());
			pstmt.setString(4, vo.getId());
			int count = pstmt.executeUpdate();
			if (count == 0)
				return false;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			manager.close(null, pstmt);
		}
		return true;
	}

	// 회원 삭제(관리자용)
	public boolean deleteManageMemberVo(String id) {
		String sql = "delete from member where id like ?";
		Connection conn = manager.getConnection();
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			int count = pstmt.executeUpdate();
			if (count == 0)
				return false;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			manager.close(null, pstmt);
		}
		return false;
	}

}
