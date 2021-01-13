<%@page import="dto.QnADto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
        $(function() {
          $("button").click(function(){
        	  if($("#tit").val().length < 5){
        		  alert("제목은 5글자 이상 입력하셔야 합니다.");
        		  $("#tit").focus();
        		  return false;
        	  }
        	  else if($("textarea").val().length < 10){
        		  alert("문의 내용은 10글자 이상 입력하셔야 합니다");
        		  $("textarea").focus();
        		  return false;
        	  }
          });
          $(".btn_qna_list").click(function(){
        	 $("#qna_list").slideDown(500);
          });
        });
    </script>
<style>
#main{
	height: 700px;
	overflow: scroll;
}
#container {
	width: 900px;
	margin: 0 auto;
}
td{
	width:700px;
}
.btn_row{
	width:200px;
}
input {
	width: 100%;
	height: 40px;
	border-radius: 5px;
	margin-top: 5px;
	padding: 10px;
	box-sizing: border-box;
}

textarea {
	width: 100%;
	height: 140px;
	margin-top: 5px;
	padding: 10px;
	box-sizing: border-box;
	border-radius: 5px;
	resize: none;
}

button {
	width: 100%;
	height: 180px;
	margin-left: 5px;
	background-color: #12bccf;
	border: none;
	border-radius: 5px;
	font-size: 38px;
	color: white;
}
#qna_list{
	display: none;
}
#qna_list table textarea{
	width:700px;
	height: 100px;
}
.btn_ans_res{
	width:200px;
	height: 100px;
}
</style>
</head>
<body>
<%
if(session.getAttribute("login") == null || !(boolean)session.getAttribute("login")){
	String queryString="";
	queryString = request.getQueryString() != null ? "?" + request.getQueryString() : "";
	session.setAttribute("result_url", request.getRequestURI()+ queryString);
	%>
	<script>
		alert("로그인 후 이용하실 수 있습니다.");
		location.href="<%=request.getContextPath()%>/login.jsp";
	</script>
	<%
}
%>
	<jsp:include page="template/header.jsp" flush="false" />
	<div id="main">
		<div id="container">
			<div id="qna_from">
				<h2>문의하기</h2>
				<form id="frm" action="sendQnA.do" method="get">
					<table>
						<tr>
							<td><input type="text" id="tit" name="title" placeholder="제목"></td>
							<td rowspan="2" class="btn_row"><button type="submit">입력</button></td>
						</tr>
						<tr>
							<td><textarea name="content" placeholder="문의 내용 입력"></textarea></td>
						</tr>
					</table>
				</form>
			</div>
			<input type="button" class="btn_qna_list" value="문의 목록 보기">
			<div id="qna_list">
				<h4>문의목록</h4>
				<table>
					<!-- 반복 -->
					<c:choose>
						<c:when test="${sessionScope.grade eq '0' }">
							<c:forEach var="item" items="${requestScope.list }">
								<tr>
									<td>문의 번호 : ${item.qno }</td>
									<td>작성자 : ${item.writer }</td>
									<td>작성일 : ${item.wdate }작성일</td>
									<td>
										<c:choose>
											<c:when test="${item.status == 0 }">
												[미확인]
											</c:when>
											<c:when test="${item.status == 1 }">
												[확인]
											</c:when>
											<c:when test="${item.status == 2 }">
												[답변완료]
											</c:when>
										</c:choose>
									</td>
								</tr>
								<tr>
									<td colspan="4">문의 제목 : ${item.title }</td>
								</tr>
								<tr>
									<td colspan="4">문의 내용 :${item.content }</td>
								</tr>
								<tr>
									<c:choose>
										<c:when test="${item.status == 2 }">
											<td>${item.response }</td>
										</c:when>
										<c:otherwise>
											<td colspan="3"><textarea placeholder="답변을 입력하세요."></textarea></td>
											<td><input type="button" class="btn_ans_res" value="답변 등록"></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
								<tr>
									<td colspan="4"><input type="button" value="더보기"></td>
								</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="item" items="${requestScope.list }">
								<tr>
									<td>문의 번호 : ${item.qno }</td>
									<td>작성자 : ${item.writer }</td>
									<td>작성일 : ${item.wdate }</td>
									<td>
										<c:choose>
											<c:when test="${item.status == 0 }">
												[미확인]
											</c:when>
											<c:when test="${item.status == 1 }">
												[확인]
											</c:when>
											<c:when test="${item.status == 2 }">
												[답변완료]
											</c:when>
										</c:choose>
									</td>
								</tr>
								<tr>
									<td colspan="4">문의 제목 : ${item.title }</td>
								</tr>
								<tr>
									<td colspan="4">문의 내용 :${item.content }</td>
								</tr>
							</c:forEach>
								<tr>
									<td colspan="4"><input type="button" value="더보기"></td>
								</tr>
						</c:otherwise>
					</c:choose>
					<c:if test="${sessionScope.grade == '0' }">
						
					</c:if>
					
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="template/footer.jsp" flush="false" />
</body>
</html>