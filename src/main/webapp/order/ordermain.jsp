<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.dto.CartDto"%>
<%@page import="data.dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
<title>Insert title here</title>
</head>
<body>
<%
String myid=(String)session.getAttribute("myid");
String root=request.getContextPath();

/* 장바구니가 비어있을 때 */
CartDao cdao=new CartDao();
List<CartDto>list=cdao.readCart(myid);

if(list.size()!=0)
{%>
 <jsp:include page="orderinfoform.jsp"/>
<%}else
{%>
	<script type="text/javascript">
	alert("장바구니가 비었습니다");
	history.back();
	</script>		
<%}
%>

</body>
</html>