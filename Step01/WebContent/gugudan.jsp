<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--  jsp 파일은 실행되면 클래스로 바뀌어 자바 파일이 된다.
	 이때 <%! %> 이 부분은 메서드와 필드 부분으로 클래스에 제일 먼저 선언되고
	 <% %> 이 부분은 일하는 부분이다(메서드 내부)
	 따라서 밑에서는 <%!%> 부분이 맨앞에 선언되고 <% %>가 먼저 실행되어 출력되고 순서대로 나머지가 출력된다. 
 --%> 
	<h1>구구단 출력 1번째</h1>
	<%
		// 웹에 출력
		for(int i=2; i<6;i++){
			response.getWriter().println(i + "단<br>");
			for(int j=1; j<10; j++){
				response.getWriter().println(i + " * " + j + " = " + (i*j) + "<br>");
			}
		}
		
	%>
	<h1>구구단 출력 2번째</h1>
	<%!
		public String gugu(){
			String result = "";
			for(int i=6; i<10;i++){
				result += i + "단<br>";
				for(int j=1; j<10; j++){
					result += i + " * " + j + " = " + (i*j) + "<br>";
				}
			}
			return result;			
		}
	%>
	<%=gugu() %>
</body>
</html>