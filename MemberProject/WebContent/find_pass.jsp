<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Pass</title>
<style>
	#main{
		height:400px;
	}
	#find_pass_area{
		width:250px;
		margin: 0 auto;
		margin-top: 200px;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="false"/>
	<div id="main">
		<div id="find_pass_area">
			<form action="pass_update.jsp" method="post">
				아이디 : <input type="text" name="id"><br>
				이름 : <input type="text" name="name"><br>
				<button>찾기</button>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="false"/>
</body>
</html>