<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,z.*" %>
<jsp:useBean id="proMgr" class="z.productMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품정보수정</title>
<link href="/z/setting/style.css" rel="stylesheet" type="text/css">
<link rel="short icon" href="/z/setting/box.png">
<script type="text/javascript" src="/z/setting/script.js" charset="utf-8"></script>
</head>
<body>
	<%@ include file="/top.jsp"%><br>
	<% productBean product = proMgr.getProduct(request.getParameter("no")); %>
	<form name="update" method="post" action="productProc.jsp?flag=update" enctype="multipart/form-data">
		<table class="pr">
			<tr>
				<td colspan="2" align="center"><h1>상품수정하기</h1></td>
			</tr>
			<tr>
				<td>상품이름 : </td>
				<td><input name="name" type="text" value="<%=product.getName() %>"></td>
			</tr>
			<tr>
				<td>상품가격 : </td>
				<td><input name="price" type="text" value="<%=product.getPrice() %>"></td>
			</tr>
			<tr>
				<td>상품설명 : </td>
				<td><textarea rows="10" cols="45" name="detail"><%=product.getDetail() %></textarea></td>
			</tr>
			<tr>
				<td>상품수량 : </td>
				<td><input name="stock" type="text" value="<%=product.getStock() %>"></td>
			</tr>
			<tr>
				<td>상품이미지 : </td>
				<td>
					<img src="data/<%=product.getImage() %>" width="100px" height="100px">
					<input name="image" type="file"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기">
					<input type="button" value="취소하기" onclick="history.back()"></td>
			</tr>
		</table>
		<input type="hidden" name="no" value="<%=product.getNo() %>">
	
	</form>

</body>
</html>