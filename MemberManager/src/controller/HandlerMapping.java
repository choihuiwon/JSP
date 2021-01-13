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
		case "login.do":
			controller = new LoginController();
			break;
		case "logout.do":
			controller = new LogoutController();
			break;
		case "register.do":
			controller = new MemberInsertController();
			break;
		case "update_view.do":
			controller = new MemberUpdateViewController();
			break;
		case "updateAction.do":
			controller = new MemberUpdateController();
			break;
		case "sendQnA.do":
			controller = new SendQnAController();
			break;
		case "qnaView.do":
			controller = new QnAViewController();
			break;
			
		}
		return controller;
	}
}
