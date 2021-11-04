<%@page import="data.dao.CartDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
//(아린 메모) 11/04 15:04
//장바구니 수량드롭박스로 수정할 때 Cart DB의 cnt도 수정하는 메소드 실행

//product_id,cnt 읽어오기
int cnt = Integer.parseInt(request.getParameter("cnt"));
String user_id = request.getParameter("user_id");
int product_id = Integer.parseInt(request.getParameter("product_id"));
String color = request.getParameter("color");
String insurance = request.getParameter("insurance");
 
//CartDao의 장바구니 제품 수량 수정하는 메소드에 값 넣기
CartDao dao = new CartDao();
dao.updateCart(cnt, user_id, product_id, color, insurance);
%>