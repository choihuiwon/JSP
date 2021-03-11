package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import config.DBManager;
import config.SQLMapper;
import dto.EmployeeDto;

public class EmployeeDao {
	// 싱글톤 패턴 적용
	private static EmployeeDao instance = new EmployeeDao();
	private SqlSession session;
	private SQLMapper mapper;
	
	private EmployeeDao() {
		session = DBManager.getInstance().getSqlSession();
		mapper = session.getMapper(SQLMapper.class);
	}
	
	public static EmployeeDao getInstance() {
		if(instance == null)
			instance = new EmployeeDao();
		return instance;
	}
	
	public List<EmployeeDto> selectAllEmployee(){
		return mapper.selectAllEmployee();
	}
	
	public int selectEmployeeCount() {
		return mapper.selectEmployeeCount();
	}

	public List<EmployeeDto> selectPositionEmployee(int pos) {
		return mapper.selectPositionEmployee(pos);
	}

	public List<EmployeeDto> selectPositionAreaEmployee(int start, int end) {
		return mapper.selectPositionAreaEmployee(start, end);
	}

	public EmployeeDto selectEmployee(String eno) {
		return mapper.selectEmployee(eno);
	}

	public int insertEmployee(EmployeeDto dto) {
		int count = 0;
		count = mapper.insertEmployee(dto);
		return count;
	}

	public int updateEmployee(EmployeeDto dto) {
		int count = 0;
		count = mapper.updateEmployee(dto);
		return count;
	}

	public int deleteEmployee(String eno) {
		int count = 0;
		count = mapper.deleteEmployee(eno);
		return count;
	}

	public List<EmployeeDto> selectSearchEmployee(String name) {
		return mapper.selectSearchEmployee(name);
	}
	
}