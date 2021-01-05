<%@page import="vo.MemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 검색할 종류
	String kind = request.getParameter("kind");
	// 검색어
	String search = request.getParameter("search");
	
	// 검색 결과를 받아서 클라이언트에게 출력
	if(kind.equals("grade"))
		kind = "grade_name";
	search = search.toUpperCase();
	ArrayList<MemberVo> list = MemberService.getInstance().searchMember(kind,search);
	String result = "";
	for(int i=0;i<list.size();i++){
		result += list.get(i).getId() + " " + list.get(i).getName()
				+ " " + list.get(i).getAge() + " " + list.get(i).getGrade()+",";
		
	}
	out.write(result);	

	// 검색할 종류 Dao객체까지 전달
	// Dao에서는 검색할때 sql문을 직접 조립
	// select * from member where like name '%검색어%'
	// select * from member where like id '%검색어%'
	// select * from member where like grade '%검색어%'
	
%>