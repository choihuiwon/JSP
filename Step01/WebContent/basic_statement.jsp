<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 
	스크립트릿(Scriptlet) - <% %>
	표현식(Expression) - <%= %>
	선언문(Declaration) - <%! %>

 -->
<!-- 선언문 -->
<%!
	// 필드와 메서드를 작성하는 부분
	String message = "선언문 메세지";
	public String getMessage(){
		return message + " 메서드!";
	}
%>
<!-- 표현식 -->
선언문 필드 테스트 : <%=message %><br>
선언문 메서드 테스트 : <%=getMessage() %>


<!-- 스크립트릿, 사용자가 서버에 데이터를 전달하는 수단 -->
<!-- 실제 jsp가 일처리하는 코드 -->
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String msg = request.getParameter("msg");
%>

<!-- 주소 뒤에 ?num=10&msg=안녕 넣고 실행 -->
스크립트릿 테스트 : <%=num %>
스크립트릿 테스트 : <%=msg %>
</body>
</html>