<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	*{
		padding:0;
		margin:0;
	}
	nav{
		width: 1000px;
		margin: 0 auto;
		border: 1px solid black;
		text-align: center;
	}
	nav ul{
		list-style: none;
	}
	nav li {
		display: inline-block;
		margin: 15px 20px;
	}
	nav a:link, nav a:visited{
		text-decoration: none;
		color: black;
		font-size: 28px;
	}
	nav a:hover {
		font-weight: bold;
	}
}
	
</style>

<nav>
	<ul>
		<li><a href="#">HOME</a>
		<li><a href="#">회원가입</a>
		<li><a href="login.jsp">로그인</a>
		<li><a href="#">회원관리</a>
		<li><a href="#">문의하기</a>
	</ul>		
</nav>