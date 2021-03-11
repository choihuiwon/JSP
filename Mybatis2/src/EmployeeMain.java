import java.util.List;
import java.util.Scanner;

import dao.EmployeeDao;
import dto.EmployeeDto;

public class EmployeeMain {
	public static void main(String[] args) {
		EmployeeDao dao = EmployeeDao.getInstance();
		EmployeeDto dto = null;
		List<EmployeeDto> list = null;
		Scanner sc = new Scanner(System.in);
		String eno = "";
		String name = "";
		String department = "";
		int position = 0;
		int count = 0;
		
		list = dao.selectAllEmployee();
		for(EmployeeDto l : list)
			System.out.println(l.toString());
		
		System.out.println("총 사원 수 : " + EmployeeDao.getInstance().selectEmployeeCount());
		
		System.out.println("=======================");
		System.out.print("검색할 사원이름을 입력하세요. : ");
		name = sc.nextLine();
		list = dao.selectSearchEmployee(name);
		for(EmployeeDto l : list)
			System.out.println(l.toString());
		if(list.size() == 0)
			System.out.println("해당하는 사원이 없습니다.");
		
		System.out.println("=======================");
		System.out.println("삭제할 사원정보를 입력하세요.");
		System.out.print("사번 : ");
		eno = sc.nextLine();
		dto = dao.selectEmployee(eno);
		if(dto != null) {
			System.out.println("사원 삭제를 시작합니다.");
			count = dao.deleteEmployee(eno);
			if(count == 0)
				System.out.println("사원 삭제 실패");
			else
				System.out.println("사원 삭제 성공");
		}
		else
			System.out.println("등록되지않은 사원번호 입니다.");
		
		System.out.println("=======================");
		System.out.println("수정할 사원정보를 입력하세요.");
		System.out.print("사번 : ");
		eno = sc.nextLine();
		dto = dao.selectEmployee(eno);
		if(dto != null) {
			System.out.println("사원 수정을 시작합니다.");
			System.out.print("이름 : ");
			name = sc.nextLine();
			System.out.print("부서 : ");
			department = sc.nextLine();
			System.out.print("직급 : ");
			position = sc.nextInt();
			dto = new EmployeeDto(eno, name, department, position);
			count = dao.updateEmployee(dto);
			if(count == 0)
				System.out.println("사원 수정 실패");
			else
				System.out.println("사원 수정 성공");
		}
		else
			System.out.println("등록되지않은 사원번호 입니다.");
		
		System.out.println("=======================");
		System.out.println("사원 등록을 시작합니다. 사원정보를 입력하세요.");
		System.out.print("사번 : ");
		eno = sc.nextLine();
		dto = dao.selectEmployee(eno);
		if(dto == null) {
			System.out.print("이름 : ");
			name = sc.nextLine();
			System.out.print("부서 : ");
			department = sc.nextLine();
			System.out.print("직급 : ");
			position = sc.nextInt();
			dto = new EmployeeDto(eno, name, department, position);
			count = dao.insertEmployee(dto);
			if(count == 0)
				System.out.println("사원 등록 실패");
			else
				System.out.println("사원 등록 성공");
		}
		else
			System.out.println("이미 등록된 사원번호 입니다.");
		
		System.out.println("====================");
		System.out.println("특정 직급 이상/이하 사원 : ");
		System.out.print("이상 : ");
		int start = sc.nextInt();
		System.out.print("이하 : ");
		int end = sc.nextInt();
		list = dao.selectPositionAreaEmployee(start, end);
		for(EmployeeDto l : list)
			System.out.println(l.toString());
		
		System.out.println("====================");
		System.out.print("특정 직급 이하 사원 : ");
		int pos = sc.nextInt();
		list = dao.selectPositionEmployee(pos);
		for(EmployeeDto l : list)
			System.out.println(l.toString());
		
	}
}
