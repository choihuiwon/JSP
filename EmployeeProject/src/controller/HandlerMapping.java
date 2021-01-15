package controller;

/*
 * 각종 컨트롤러를 찍어내는 클래스
 * 싱글톤 패턴, 팩토리 패턴이 적용
*/
public class HandlerMapping {
	private static HandlerMapping instance = new HandlerMapping();
	
	private HandlerMapping() {
		
	}
	
	public static HandlerMapping getInstance() {
		if(instance == null)
			instance = new HandlerMapping();
		return instance;
	}
	
	public Controller createController(String command) {
		Controller controller = null;
		switch(command) {
		case "emp_login.brd":
			controller = new EmpLoginController();
			break;
		case "emp_logout.brd":
			controller = new EmpLogoutController();
			break;
		case "emp_listView.brd":
			controller = new EmpListViewController();
			break;
		case "emp_search.brd":
			controller = new EmpSearchController();
			break;
		case "emp_update.brd":
			controller = new EmpUpdateController();
			break;
		case "emp_delete.brd":
			controller = new EmpdeleteController();
			break;
		case "emp_insert.brd":
			controller = new EmpInsertController();
			break;
		}
		return controller;
	}
}
