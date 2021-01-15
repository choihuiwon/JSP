package service;

import java.util.ArrayList;

import dao.EmployeeDao;
import dto.EmployeeDto;

public class EmployeeService {
	// 싱글톤 적용
	private static EmployeeService instance = new EmployeeService();
	private EmployeeDao dao;
	private EmployeeService() {
		dao = EmployeeDao.getInstance();
	}
	public static EmployeeService getInstance() {
		if(instance == null)
			instance = new EmployeeService();
		return instance;
	}
	
	// 로그인
	public EmployeeDto loginEmp(String name, String eno) {
		return dao.loginEmp(name, eno);
	}
	
	// 직급 이름 확인
	public String selectPositionName(int position) {
		return dao.selectPositionName(position);
	}
	
	// 사원정보 리스트
	public ArrayList<EmployeeDto> getEmpList() {
		return dao.getEmpList();
	}
	
	// 사원 검색
	public ArrayList<EmployeeDto> searchEmp(String kind, String search) {
		return dao.searchEmp(kind, search);
	}
	
	// 정보 수정
	public int updateEmp(EmployeeDto dto) {
		return dao.updateEmp(dto);
	}
	
	// 정보수정 연봉
	public int updateEmpSalary(String eno, int salary) {
		return dao.updateEmpSalary(eno, salary);
	}
	
	// 정보 삭제
	public int deleteEmp(String eno) {
		dao.deleteEmpSalary(eno);
		return dao.deleteEmp(eno);
	}
}
