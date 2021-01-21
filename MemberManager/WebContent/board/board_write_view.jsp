<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Write Page</title>
<style>
	#main{
		height: 600px;
	}
	#board_write_area{
		width: 1200px;
		margin: 0 auto;
		padding: 20px;
	}
	table{
		border-collapse: collapse;
		width: 700px;
	}
	th {
		width: 100px;
		text-align: right;
		padding-right: 15px;
	}
	td{
		width:600px;
	}
	input{
		width:600px;
	}
	textarea{
		width: 600px;
		height: 300px;	
		resize: none;
	}
	.btn{
		text-decoration: none;
		background-color: #e8e8e8;
		width: 100px;
		font-size: 22px;
		display: inline-block;
		padding: 5px 0px;
		box-sizing: border-box;
		border: none;
		color:black;
		margin-right:108px;
	}
	.btn:hover {
		background-color: #282828;
		color:#ffffff;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		var count = 3;//첨부파일 태그 개수
		$("#plus").click(function(){
			if(count == 5) return;
			count++;
			$("#file_form").append("<p><input type='file' name='file"+count+"'></p>");
		});
		$("#minus").click(function(){
			if(count == 1) return;
				$(this).parent().parent().children("p").last().remove();
			count--;
		});
	});
</script>
</head>
<body>
<c:if test="${sessionScope.login eq null || sessionScope.login == false }">
	<script>
		alert("로그인 후 이용하실 수 있습니다.");
		location.href="../member/login.jsp";
	</script>
</c:if>
	<jsp:include page="../template/header.jsp" flush="false"/>
	<div id="main">
		<div id="board_write_area">
		<h2>글쓰기 페이지</h2>
			<form action="boardWrite.do" enctype="multipart/form-data" method="post">
				<table>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="hidden" name="writer" value="${sessionScope.id }">${sessionScope.id }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<textarea name="content"></textarea>
						</td>
					</tr>
					<!-- 첨부 파일 -->
					<tr>
						<td colspan="2" id="file_form">
							<p><input type="file" name="file1"> 
							<button type="button" id="plus">+</button> <button type="button" id="minus">-</button></p>
							<p><input type="file" name="file2"></p>
							<p><input type="file" name="file3"></p>
						</td>
					</tr>
					<tr>
						<th></th>
						<td><a href="" class="btn">목록보기</a>
							<button class="btn">글쓰기</button>
							<a href="javascript:history.back();" class="btn" style="margin-right:0px;">뒤로가기</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="../template/footer.jsp" flush="false"/>
</body>
</html>