<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<style type="text/css">
	#container{
		height: 600px;
		/* background-color: lime; */
	}
</style>
</head>
<body>
	<!-- header.jsp를 현재 문서에 포함 -->
	<jsp:include page="template/header.jsp" flush="false"></jsp:include>
	<div id="container">
		메인페이지
	</div>
	<jsp:include page="template/footer.jsp" flush="false"></jsp:include>
	
</body>
</html>







