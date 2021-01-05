<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#main{
		height: 600px;	
	}
</style>
</head>
<body>
	<jsp:include page="/template/header.jsp" flush="false"/>
	<div id="main">
		메인페이지
		
	</div>
	<jsp:include page="/template/footer.jsp" flush="false"/>
</body>
</html>