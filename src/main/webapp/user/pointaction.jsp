<?xml version="1.0" encoding="EUC-KR" ?>

<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"

    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />

<title>Insert title here</title>

</head>

<body>

 	<%
 	request.setCharacterEncoding("utf-8");
 	String myid=(String)session.getAttribute("myid");
 	UserDto dto=new UserDto();
 	String point1 = request.getParameter("point1");
	String point2 = request.getParameter("point2");


	int point3 = Integer.parseInt(point1);
	int point4 = Integer.parseInt(point2);
	int sum = point3+point4;

	dto.setUser_id(myid);
	dto.setUser_point(sum);
	
	UserDao dao=new UserDao();
	dao.updatePont(dto);
	
	//메인창으로
	response.sendRedirect("../index.jsp?main=login/loginmain.jsp");
	%>
	
	
<%-- 	<%out.println("합 : " + (sum));%> --%>
	
	
</body>

</html>