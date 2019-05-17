<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*, z.*"%>
<jsp:useBean id="proMgr" class="z.productMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상세보기</title>
<link href="/z/setting/style.css" rel="stylesheet" type="text/css">
<link rel="short icon" href="/z/setting/box.png">
<script type="text/javascript" src="/z/setting/script.js" charset="utf-8"></script>
</head>
<body>
<%@ include file="/top.jsp"%><br>
<%
	productBean product = proMgr.getProduct(request.getParameter("no"));
%>
	<table class="pr">
		<tr>
			<td colspan="2" align="center"><h1>상세보기</h1></td>
		</tr>
		<tr>
			<td>상품이름 :</td>
			<td><%=product.getName() %></td>
		</tr>
		<tr>
			<td>상품가격 :</td>
			<td><%=product.getPrice() %></td>
		</tr>
		<tr>
			<td>상품설명 :</td>
			<td><%=product.getDetail() %></td>
		</tr>
		<tr>
			<td>상품수량 :</td>
			<td><%=product.getStock() %></td>
		</tr>
		<tr>
			<td>상품이미지 :</td>
			<td><img src="data/<%=product.getImage() %>" width="100px" height="100px"></td>
		</tr>
</body>
</html>