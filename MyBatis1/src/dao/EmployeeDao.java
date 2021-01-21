package dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dto.EmployeeDto;

public class EmployeeDao {
	// 싱글톤 패턴 적용
	private static EmployeeDao instance = new EmployeeDao();
	private SqlSessionFactory factory;
	private SqlSession session;
	private EmployeeDao() {
		String resource = "db/mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			factory = new SqlSessionFactoryBuilder().build(inputStream);
			session = factory.openSession(true);	// true : autoCommit
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static EmployeeDao getInstance() {
		if(instance == null)
			instance = new EmployeeDao();
		return instance;
	}
	
	public int selectAllCountEmployee() {
		int count =0;
		count = session.selectOne("db.sqlmapper.selectAllCountEmployee");
		return count;
	}
	
	public List<EmployeeDto> selectAllEmployee() {
		return session.selectList("db.sqlmapper.selectAllEmployee");
	}
	
	public List<EmployeeDto> selectPositionEmployee(int pos) {
		return session.selectList("db.sqlmapper.selectPositionEmployee",pos);
	}
	
	public List<EmployeeDto> selectBetweenPositionEmployee(int start, int end) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		return session.selectList("db.sqlmapper.selectBetweenPositionEmployee", map);
	}
	public int insertEmployee(EmployeeDto dto) {
		int count = 0;
		count = session.insert("db.sqlmapper.insertEmployee", dto);
		return count;
	}
	
	public EmployeeDto selectEmployee(String eno) {
		EmployeeDto dto = null;
		dto = session.selectOne("db.sqlmapper.selectEmployee",eno);
		return dto;
	}
	public int updateEmployee(EmployeeDto dto) {
		int count = 0;
		count = session.update("db.sqlmapper.updateEmployee", dto);
		return count;
	}
	public List<EmployeeDto> selectSearchEmployee(String name) {
		return session.selectList("db.sqlmapper.selectSearchEmployee", name);
	}
	public int deleteEmployee(String eno) {
		int count = 0;
		count = session.delete("db.sqlmapper.deleteEmployee", eno);
		return count;
	}
	
}