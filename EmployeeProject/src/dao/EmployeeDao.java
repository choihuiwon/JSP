package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import config.DBManager;
import dto.EmployeeDto;

public class EmployeeDao {
	// 싱글톤 패턴 적용
	private static EmployeeDao instance = new EmployeeDao();
	private DBManager manager;
	private EmployeeDao() {
		manager = DBManager.getInstance();
	}
	public static EmployeeDao getInstance() {
		if(instance == null)
			instance = new EmployeeDao();
		return instance;
	}
	
	// 로그인
	public EmployeeDto loginEmp(String name, String eno) {
		EmployeeDto dto = null;
		String sql = "select * from employee where name like ? and eno like ?";
		Connection conn = manager.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, eno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new EmployeeDto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			manager.close(rs, pstmt);
		}
		return dto;
	}
	
	// 직급 이름 확인
	public String selectPositionName(int position) {
		String position_name = "";
		String sql = "select name from POSITION_LIST where pno = ?";
		Connection conn = manager.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, position);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				position_name = rs.getString(1);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			manager.close(rs, pstmt);
		}
		return position_name;
	}
	
	// 사원 정보 리스트
	public ArrayList<EmployeeDto> getEmpList() {
		ArrayList<EmployeeDto> list = new ArrayList<EmployeeDto>();
		String sql = "select e.eno, e.name, e.department, e.position, s.salary from employee e, EMPLOYEE_SALARY s where e.eno like s.eno";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = DBManager.getInstance().getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(new EmployeeDto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5)));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstance().close(rs, pstmt);
		}

		return list;
	}
	
	// 사원 검색
	public ArrayList<EmployeeDto> searchEmp(String kind, String search) {
		ArrayList<EmployeeDto> list = new ArrayList<EmployeeDto>();
		String sql = "select e.eno, e.name, e.department, e.position, s.salary from employee e, EMPLOYEE_SALARY s where e.eno like s.eno and e." + kind + " like ?";
		System.out.println(sql);
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
//			pstmt = manager.getSource().getConnection().prepareStatement(sql);
			pstmt = manager.getConnection().prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new EmployeeDto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5)));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstance().close(rs, pstmt);
		}

		return list;
	}
	
	
	//정보 수정
	public int updateEmp(EmployeeDto dto) {
		int count = 0;
		String sql = "update employee set name = ?, department=?, position=? where eno like ?";
		PreparedStatement pstmt = null;

		try {
//			pstmt = manager.getSource().getConnection().prepareStatement(sql);
			pstmt = manager.getConnection().prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getDepartment());
			pstmt.setInt(3, dto.getPosition());
			pstmt.setString(4, dto.getEno());
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			manager.close(null, pstmt);
		}
		
		return count;
	}
	
	// 정보수정 연봉
	public int updateEmpSalary(String eno, int salary) {
		int count = 0;
		String sql = "update employee_salary set salary = ? where eno like ?";
		PreparedStatement pstmt = null;

		try {
//			pstmt = manager.getSource().getConnection().prepareStatement(sql);
			pstmt = manager.getConnection().prepareStatement(sql);
			pstmt.setInt(1, salary);
			pstmt.setString(2, eno);
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			manager.close(null, pstmt);
		}
		
		return count;
	}
	
	// 정보 삭제
	public int deleteEmp(String eno) {
		int count = 0;
		String sql = "delete from employee where eno like ?";
		PreparedStatement pstmt = null;

		try {
//			pstmt = manager.getSource().getConnection().prepareStatement(sql);
			pstmt = manager.getConnection().prepareStatement(sql);
			pstmt.setString(1, eno);
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			manager.close(null, pstmt);
		}
		
		return count;
	}
	
	// 연봉 정보 삭제
	public void deleteEmpSalary(String eno) {
		String sql = "delete from employee_salary where eno like ?";
		PreparedStatement pstmt = null;

		try {
//			pstmt = manager.getSource().getConnection().prepareStatement(sql);
			pstmt = manager.getConnection().prepareStatement(sql);
			pstmt.setString(1, eno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			manager.close(null, pstmt);
		}
		
	}
	
	
}
