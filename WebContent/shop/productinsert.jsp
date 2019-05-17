<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품등록</title>
<link href="/z/setting/style.css" rel="stylesheet" type="text/css">
<link rel="short icon" href="/z/setting/box.png">
<script type="text/javascript" src="/z/setting/script.js" charset="utf-8"></script>
</head>
<body>
<%@ include file="/top.jsp" %><br><br><br>
	<form name="ist" method="post" action="/z/shop/productProc.jsp?flag=insert" enctype="multipart/form-data">
		<table class="pr">
			<tr>
				<td colspan="2" align="center"><h1>상품등록하기</h1></td>
			</tr>
			<tr>
				<td>상품이름 : </td>
				<td><input name="name" type="text"></td>
			</tr>
			<tr>
				<td>상품가격 : </td>
				<td><input name="price" type="text"></td>
			</tr>
			<tr>
				<td>상품설명 : </td>
				<td><textarea rows="10" cols="45" name="detail"></textarea></td>
			</tr>
			<tr>
				<td>상품수량 : </td>
				<td><input name="stock" type="text"></td>
			</tr>
			<tr>
				<td>상품이미지 : </td>
				<td><input name="image" type="file"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록">
					<input type="button" value="취소" onclick="history.back()"></td>
			</tr>
		</table>
	</form>

</body>
</html>