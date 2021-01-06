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
	세션(Session)
		웹브라우저 - 서버에 저장되어 있는 데이터
		웹브라우저가 닫히면 세션 데이터는 전부 날아감
		(사용자 데이터가 서버에 저장됨)
	쿠키(Cookie)
		사용자 데이터 -> 사용자 디바이스에 저장
		민감한 개인정보 저장 x
		유출되고 문제없는 데이터 저장
 -->
 
 <%
 	boolean flag = false;
 	if(session.getAttribute("login") != null)
 		flag = (boolean)session.getAttribute("login");
 	if(flag){
 		// 로그인 상태
 		%>
 		<%=session.getAttribute("name") %>님 로그인 하셨습니다.<br>
 		<a href="logout.jsp">로그아웃</a> | 정보수정
 		
 		<%
 	}
 	else{
 		%>
			<form action="login_process.jsp" method="post">
				<input type="text" name="id"><br>
				<input type="password" name="pass"><br>
				<button>로그인</button>
			</form>
 		
 		<%
 	}
 %>
</body>
</html>