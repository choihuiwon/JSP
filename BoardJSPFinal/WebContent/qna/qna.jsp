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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
		var pageNo = 1;
        $(function() {
          // 목록 보기
          $("#qna_list").accordion();
          // 목록 더보기
          $("#btn_more").click(function(){
        	  pageNo++;
  			$.ajax({
  				url : "nextQnAList.do",
  				data : "pageNo="+pageNo,
  				method : "get",
  				success : function(result){
  					var json = JSON.parse(result);
  					if(json.nextPage == "0"){
  						$("#btn_more").text("더이상 불러올 내용이 없습니다.");
  						$("#btn_more").off("click");
  					}
  					arr = json.list;
					tag = "";
  					// 반복문 이용해서 qna_list부분에 append로 추가
  					for(i=0;i<arr.length;i++){
						tag += "<h3 class='qna_title'><ul>";
						tag += "<li>제목 : "+arr[i].title+"</li>";
						tag += "<li>작성자 : "+arr[i].writer+"</li>";
						tag += "<li>작성일 : "+arr[i].wdate+"</li>";
						switch(arr[i].status){
						case 0:
							tag += "<li>않읽음</li>";
							break;
						case 1:
							tag += "<li>읽음</li>";
							break;
						case 2:
							tag += "<li>답변완료</li>";
							break;
						}
						tag += "</ul></h3><div>";
						tag += "<p class='qna_content'>"+arr[i].content+"</p>";
						if(arr[i].status == 2)
							tag += "<p class='qna_response'>답변 : "+arr[i].response+"</p>";
						if(json.grade == 0 && arr[i].status != 2){
							tag += "<div class='qna_ans_res'>"
								+ "<textarea class='input_res' placeholder='답변을 입력하세요.'></textarea>"
								+ "<button class='btn_res'>답변 등록</button>"
								+ "<input type='hidden' class='hidden' value='"+arr[i].qno + "'></div>";
						}
						tag += "</div>";
					}
					$("#qna_list").append(tag);
					$("#qna_list").accordion("refresh");
		  			// 읽음 처리
		  	        $(".qna_title").click(function(){
		  	        	qna_click($(this));
		  	        });
  				}
  			});
  			
        });
        
        // 답변 입력
        $(".btn_res").click(function(){
        	//alert($(this).next().val());
        	//alert($(this).prev().val());
        	var qno = $(this).next().val();
        	var res = $(this).prev().val();
        	$.ajax({
  				url : "responseQnA.do",
  				data : "qno="+qno+"&res="+res,
  				method : "get",
  				success : function(result){
  					alert("답변 등록 성공");
  					location.reload();
  				}
  			});
        });
        
        // 읽음 처리
        $(".qna_title").click(function(){
        	qna_click($(this));
        });
	});
        
    // 읽음 처리 함수
    function qna_click(obj) {
        //alert($(obj).next().children(".qna_ans_res").children(".hidden").val());
        var qno = $(obj).next().children(".qna_ans_res").children(".hidden").val();
    	$.ajax({
				url : "readQnA.do",
				data : "qno="+qno,
				method : "get",
				success : function(result){
					alert("답변 읽기 성공");
  					location.reload();
				}
			});
    }
	
        
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
#qna_form input {
	width: 100%;
	height: 40px;
	border-radius: 5px;
	margin-top: 5px;
	padding: 10px;
	box-sizing: border-box;
}

#qna_form textarea {
	width: 100%;
	height: 140px;
	margin-top: 5px;
	padding: 10px;
	box-sizing: border-box;
	border-radius: 5px;
	resize: none;
}

#qna_form button {
	width: 100%;
	height: 180px;
	margin-left: 5px;
	background-color: #12bccf;
	border: none;
	border-radius: 5px;
	font-size: 38px;
	color: white;
}
	 .qna_title ul{
	 	font-size: 0px;
	 	padding:0;
	 }
	 .qna_title li{
	 	display: inline-block;
	 	font-size: 16px;
	 	margin-right:50px;
	 	box-sizing: border-box;
	 }
	 #btn_more{
	 	width: 100%;
	 	border:none;
	 	border-radius:5px;	 
	 	height: 50px;
	 	font-size:18px;	
	 }
	 .input_res{
	 	width:700px;
	 	height: 50px;
	 	float:left;
	 }
	 .btn_res{
	 	width:100px;
	 	height: 50px;
	 	margin-left: 5px;
		background-color: #12bccf;
		border: none;
		border-radius: 5px;
		font-size: 38px;
		color: white;
		clear:both;
	 }
</style>
</head>
<body>
<%
if(session.getAttribute("login") == null || !(boolean)session.getAttribute("login")){
	%>
	<script>
		alert("로그인 후 이용하실 수 있습니다.");
		location.href="qnaView.do";
	</script>
	<%
}
%>
	<jsp:include page="../template/header.jsp" flush="false" />
	<div id="main">
		<div id="container">
			<div id="qna_form">
				<form action="sendQnA.do">
					<table>
						<tr>
							<td><input type="text" name="title" placeholder="제목을 입력하세요"></td>
							<td rowspan="2"><button>작성완료</button></td>
						</tr>
						<tr>
							<td>
								<textarea name="content" placeholder="문의 내용을 입력해 주세요"></textarea>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<hr>
			<div id="qna_list">
				<!-- 질문 답변 목록 -->
				<c:forEach var="dto" items="${requestScope.list }">
					<h3 class="qna_title">
						<ul>
						<li>제목 : ${dto.title }</li>
						<li>작성자 : ${dto.writer }</li>
						<li>작성일 : ${dto.wdate }  </li>
					<c:choose>
						<c:when test="${dto.status==0}"><li>않읽음</li></c:when>
						<c:when test="${dto.status==1}"><li>읽음</li>	</c:when>
						<c:otherwise><li>답변완료</li></c:otherwise>
					</c:choose>
						</ul>
					</h3>
					<div>
						<p class="qna_content">${dto.content }</p>
						<c:if test="${dto.status == 2 }">
						<p class="qna_response">답변 : ${dto.response }</p>
						</c:if>
						<c:if test="${sessionScope.grade eq '0' && dto.status != 2}">
						<div class="qna_ans_res">
							<textarea class="input_res" placeholder="답변을 입력하세요."></textarea>
							<button class="btn_res">답변 등록</button>
							<input type="hidden" class="hidden" value="${dto.qno }">
						</div>	
						</c:if>
					</div>
				</c:forEach>
			</div>
			<button id="btn_more">더보기</button>
		</div>
	</div>
	<jsp:include page="../template/footer.jsp" flush="false" />
</body>
</html>