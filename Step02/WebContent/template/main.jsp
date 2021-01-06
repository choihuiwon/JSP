<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* #main{
		width: 100%;
		height: 600px;	
	} => header에 넣어놨음 */
</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="false"/>
	<div id="main">
		메인페이지
	</div>
	<jsp:include page="footer.jsp" flush="false"/>
</body>
</html>