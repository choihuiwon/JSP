<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 메뉴부분 -->
<style>
	nav {
		width:1200px;
		margin:0 auto;/* 가운데 정렬  */
		border:1px solid black;
		text-align: center;
	}
	ul{
		list-style-type: none;
		height: auto;
		display: inline-block;
	}
	li{
		display: inline-block;
	}
	#menu_bar a:link,#menu_bar a:visited {
		color:black;
		text-decoration: none;
		font-size: 17px;
		text-align: center;
		padding: 20px 30px;
	}
</style>
<nav id="menu_bar">
	<ul>
		<li><a href="main.jsp">HOME</a></li>
		<li><a href="register.jsp">회원가입</a></li>
		<li><a href="login.jsp">로그인</a></li>
		<li><a href="#">회원관리</a></li>
		<li><a href="#">문의하기</a></li>
	</ul>
</nav>





