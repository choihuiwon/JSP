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
		int set = Integer.parseInt(request.getParameter("set"));
		
		int[] arr = new int[set*6];
		for(int i=0; i<set*6; i++){
				arr[i] = (int)(Math.random()*45)+1;
		}
		
		String html = "";
		int cnt = 0;
		for(int i=0; i<arr.length/6; i++){
			html += "<tr><td>" + (i+1) + "set</td>";
			for(int j=0; j<6; j++){
				html += "<td>"+arr[cnt++]+"</td>";
			}
			html += "</tr>";
		}
		
		request.setAttribute("html", html);
		RequestDispatcher dispatcher = request.getRequestDispatcher("lotto_result.jsp");
		dispatcher.forward(request, response);
	%>
</body>
</html>