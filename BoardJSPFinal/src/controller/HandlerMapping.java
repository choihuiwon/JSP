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
		case "findPass.do":
			controller = new FindPassController();
			break;
		case "updatePass.do":
			controller = new UpdatePassController();
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
		case "nextQnAList.do":
			controller = new NextQnAListController();
			break;
		case "responseQnA.do":
			controller = new ResponseQnAController();
			break;
		case "readQnA.do":
			controller = new ReadQnAController();
			break;
		case "boardWrite.do":
			controller = new BoardWriteController();
			break;
		case "boardView.do":
			controller = new BoardViewController();
			break;
		case "boardListView.do":
			controller = new BoardListViewController();
			break;
		case "boardLikeHate.do":
			controller = new BoardLikeHateController();
			break;
		case "deleteBoard.do":
			controller = new DeleteBoardController();
			break;
		case "commentInsert.do":
			controller = new CommentInsertController();
			break;
		case "imageLoad.do":
			controller = new ImageLoadController();
			break;
		case "adminManageMember.do":
			controller = new AdminManageMemberController();
			break;
		case "adminSearchMember.do":
			controller = new AdminSearchMemberController();
			break;
		case "adminUpdateMember.do":
			controller = new AdminUpdateMemberController();
			break;
		case "adminDeleteMember.do":
			controller = new AdminDeleteMemberController();
			break;
		}
		return controller;
	}
}
