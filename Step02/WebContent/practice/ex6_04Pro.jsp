<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, td{
		border:1px solid black;
	}
</style>
</head>
<body>
	<%
		int set = Integer.parseInt(request.getParameter("set"));
	
		String html = "";
		for(int i=set; i>0; i--){
			html += "<tr><td>" + i + "</td>"
				  + "<td>제목 " + i + "</td>"
				  + "<td>내용 " + i + "</td></tr>";
		}
	%>
	
	<h2>입력한 숫자만큼 반복수행</h2>
	<table>
		<tr>
			<td>글번호</td>
			<td>글제목</td>
			<td>글내용</td>
		</tr>
		<%=html %>
	</table>
</body>
</html>