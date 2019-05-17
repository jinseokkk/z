<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,z.*" %>
<jsp:useBean id="proMgr" class="z.productMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ǰ��������</title>
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
				<td colspan="2" align="center"><h1>��ǰ�����ϱ�</h1></td>
			</tr>
			<tr>
				<td>��ǰ�̸� : </td>
				<td><input name="name" type="text" value="<%=product.getName() %>"></td>
			</tr>
			<tr>
				<td>��ǰ���� : </td>
				<td><input name="price" type="text" value="<%=product.getPrice() %>"></td>
			</tr>
			<tr>
				<td>��ǰ���� : </td>
				<td><textarea rows="10" cols="45" name="detail"><%=product.getDetail() %></textarea></td>
			</tr>
			<tr>
				<td>��ǰ���� : </td>
				<td><input name="stock" type="text" value="<%=product.getStock() %>"></td>
			</tr>
			<tr>
				<td>��ǰ�̹��� : </td>
				<td>
					<img src="data/<%=product.getImage() %>" width="100px" height="100px">
					<input name="image" type="file"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="�����ϱ�">
					<input type="button" value="����ϱ�" onclick="history.back()"></td>
			</tr>
		</table>
		<input type="hidden" name="no" value="<%=product.getNo() %>">
	
	</form>

</body>
</html>