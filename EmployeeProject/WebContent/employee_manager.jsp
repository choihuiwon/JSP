<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	li{
		width: 230px;
		font-size:16px;
		display: inline-block;
		text-align: center;
		font-weight: bold;
		padding:10px;
		box-sizing: border-box;
	}
	td {
		font-size:16px;
		width:220px;
		text-align: center;
		font-weight: bold;
		padding:10px;
	}
	#search_bar{
		width: 900px;
		margin:20px auto;
		text-align: center;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
//수정
function update_employee(obj){
	var parent = $(obj).parent().parent();
	var data = "";
	$.each(parent.find("input"),function(i, o){
		data += $(o).attr("name") + "=" + $(o).val() + "&"; 
	});
	data += "position=" + parent.find("select").val();
	$.ajax({
		url : "emp_update.brd",
		data : data,
		method : 'get'
	});
}

// 삭제
function delete_employee(obj){
	var parent = $(obj).parent().parent();
	var data = "eno=" + parent.find("input").first().val();
	$.ajax({
		url : "emp_delete.brd",
		data : data,
		method : 'get'
	});
}

$(function(){
	// 수정 버튼 클릭시
	$(".update").click(function(){
		update_employee($(this));
	});
	
	// 삭제 버튼 클릭시
	$(".delete").click(function(){
		delete_employee($(this));
	});
});
</script>
</head>
<body>
	<c:choose>
	<c:when test="${sessionScope.department eq '인사' && sessionScope.position > 3}">
		<h3>인사관리 시스템에 로그인 하셨습니다.</h3><br>
		로그인 정보 : ${sessionScope.name } ${sessionScope.position_name } <a href="emp_logout.brd">로그아웃</a> <br>
		<hr>
		
		<div class="container">
			<div id="search_bar">
				<form action="emp_search.brd" method="get">
					<select name="kind">
						<option value="name">이름</option>
						<option value="eno">사번</option>
						<option value="department">부서</option>
					</select>
					<input type="text" name="search">
					<button id="btn_search">검색</button>
				</form>
				<form action="emp_listView.brd">
					<button>조건 초기화</button>
				</form>
			</div>
			<hr>
			<div id="content">
				<ul id="title">
					<li>사번</li>
					<li>이름</li>
					<li>부서</li>
					<li>직급</li>
					<li>연봉</li>
					<li>비고</li>
				</ul>
				<hr>
				<form action="emp_insert.brd" method="post">
					<ul>
						<li><input type="text" name="eno"></li>
						<li><input type="text" name="name"></li>
						<li><input type="text" name="department"></li>
						<li>
							<select name="position">
								<option value="1">사원</option>
								<option value="2">주임</option>
								<option value="3">대리</option>
								<option value="4">과장</option>
								<option value="5">차장</option>
								<option value="6">부장</option>
								<option value="7">사장</option>
							</select>
						</li>
						<li><input type="text" name="salary"></li>
						<li><button>사원 등록</button></li>
					</ul>
				</form>
				<hr>
				<div id="content_area">
					<table>
						<c:forEach var="dto" items="${requestScope.list }">
							<tr>
								<td>${dto.eno }<input type="hidden" name="eno" value="${dto.eno }"></td>
								<td><input type="text" name="name" value="${dto.name }"></td>
								<td><input type="text" name="department" value="${dto.department }"></td>
								<td>
									<select name="position">
										<option value="1" <c:if test="${dto.position == 1 }">selected</c:if>>사원</option>
										<option value="2" <c:if test="${dto.position == 2 }">selected</c:if>>주임</option>
										<option value="3" <c:if test="${dto.position == 3 }">selected</c:if>>대리</option>
										<option value="4" <c:if test="${dto.position == 4 }">selected</c:if>>과장</option>
										<option value="5" <c:if test="${dto.position == 5 }">selected</c:if>>차장</option>
										<option value="6" <c:if test="${dto.position == 6 }">selected</c:if>>부장</option>
										<option value="7" <c:if test="${dto.position == 7 }">selected</c:if>>사장</option>
									</select>
								</td>
								<td><input type="text" name="salary" value="${dto.salary }"></td>
								<td><a href="" class="update">수정</a>/<a href="" class="delete">삭제</a></td>
							</tr>
							
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		권한이 없습니다. <a href="emp_logout.brd">로그아웃</a> <br>
		관리자 모드는 인사과 과장 이상들만 접근하실 수 있습니다.
	</c:otherwise>
</c:choose>
</body>
</html>