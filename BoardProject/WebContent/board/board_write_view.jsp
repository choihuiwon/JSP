<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 페이지</title>
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
</head>
<body>
<%
if(session.getAttribute("login") == null || !(boolean)session.getAttribute("login")){
	response.sendRedirect(request.getContextPath()+"/index.jsp");
	return;
}
%>
	<jsp:include page="/template/header.jsp" flush="false"/>
	<div id="main">
		<div id="board_write_area">
		<h2>글쓰기 페이지</h2>
			<form action="<%=request.getContextPath() %>/board/process/board_write_process.jsp" method="post">
				<table>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="hidden" name="writer" value="<%=session.getAttribute("id") %>"><%=session.getAttribute("id") %></td>
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
					<tr>
						<th></th>
						<td><a href="<%=request.getContextPath()%>/index.jsp" class="btn">목록보기</a>
							<button class="btn">글쓰기</button>
							<a href="javascript:history.back();" class="btn" style="margin-right:0px;">뒤로가기</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="/template/footer.jsp" flush="false"/>
</body>
</html>