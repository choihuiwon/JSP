<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		int dan = Integer.parseInt(request.getParameter("dan"));
		
		// 웹에 출력
		response.getWriter().println(dan + "단<br>");
		for(int j=1; j<10; j++){
	%>
		<%=dan %> * <%=j %> = <%=dan*j %> <br>
	<%
		}
	%>
</body>
</html>