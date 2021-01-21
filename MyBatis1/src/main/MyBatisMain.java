package main;

import java.util.List;
import java.util.Scanner;

import dao.EmployeeDao;
import dto.EmployeeDto;


public class MyBatisMain {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String eno = "";
		String name = "";
		String department = "";
		int position = 0;
		int count = 0;
		
		EmployeeDao dao = EmployeeDao.getInstance();
		List<EmployeeDto> list = null;
		EmployeeDto dto = null; 
		
		count = dao.selectAllCountEmployee();
		System.out.println("현재 사원 수 : " + count);
		
		System.out.println("=======================");
		list = dao.selectAllEmployee();
		for(EmployeeDto l : list)
			System.out.println(l.toString());
		
		System.out.println("=======================");
		list = dao.selectPositionEmployee(4);
		for(EmployeeDto l : list)
			System.out.println(l.toString());

		System.out.println("=======================");
		list = dao.selectBetweenPositionEmployee(2, 5);
		for(EmployeeDto l : list)
			System.out.println(l.toString());
		
		System.out.println("=======================");
		System.out.print("삭제할 사원번호를 입력하세요. : ");
		eno = sc.nextLine();
		dto = dao.selectEmployee(eno);
		if(dto==null)
			System.out.println("해당하는 사원이 없습니다.");
		else {
			System.out.println("수정 시작");
			System.out.println(dto.toString());
			count = dao.deleteEmployee(eno);
			if(count == 0)
				System.out.println("삭제 실패");
			else
				System.out.println("삭제 성공");
		}
		
		System.out.println("=======================");
		System.out.print("검색할 사원 이름을 입력하세요. : ");
		name = sc.nextLine();
		list = dao.selectSearchEmployee(name);
		for(EmployeeDto l : list)
			System.out.println(l.toString());
		if(list.size() == 0)
			System.out.println("해당하는 사원이 없습니다.");
		
		System.out.println("=======================");
		System.out.print("수정할 사원 번호를 입력하세요. : ");
		eno = sc.nextLine();
		dto = dao.selectEmployee(eno);
		if(dto==null)
			System.out.println("해당하는 사원이 없습니다.");
		else {
			System.out.println("수정 시작");
			System.out.println(dto.toString());
			System.out.print("이름 : ");
			name = sc.nextLine();
			System.out.print("부서 : ");
			department = sc.nextLine();
			System.out.print("직급 : ");
			position = sc.nextInt();
			
			dto = new EmployeeDto(eno, name, department, position);
			count = dao.updateEmployee(dto);
			if(count == 0)
				System.out.println("수정 실패");
			else
				System.out.println("수정 성공");
		}
		
		
		System.out.println("=======================");
		System.out.println("사원 정보를 입력하세요.");
		System.out.print("사번 : ");
		eno = sc.nextLine();
		System.out.print("이름 : ");
		name = sc.nextLine();
		System.out.print("부서 : ");
		department = sc.nextLine();
		System.out.print("직급 : ");
		position = sc.nextInt();
		
		count = dao.insertEmployee(new EmployeeDto(eno, name, department, position));
		if(count == 0)
			System.out.println("등록 실패");
		else
			System.out.println("등록 성공");
		
		
	}

}
