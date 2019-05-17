<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="java.util.*, z.*"%>
<jsp:useBean id="proMgr" class="z.productMgr" />
<%
	request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����ȭ��</title>
<link rel="short icon" href="/z/setting/box.png">
</head>
<body>
	<%@ include file="/top.jsp"%><p>
		<br> <br>
	<h1 align="center">����ȭ���Դϴ�</h1>
	<table class="pro">
		<tr>
			<td align="center">��ǰ��ȣ</td>
			<td align="center">��ǰ����</td>
			<td align="center">�̸�</td>
			<td align="center">����</td>
			<td align="center">��ǰ����</td>
			<td align="center">��ϳ�¥</td>
			<td align="center">������</td>
			<td align="center"></td>
		</tr>
		<%
			Vector<productBean> vResult = proMgr.getProductList(); //productMgr�� getProductList�� ȣ���ؼ� ������� ���Ϳ� ����
			if (vResult.size() == 0) {
		%>
		<tr>
			<td align="center" colspan="5">��ϵ� ��ǰ�� �����ϴ�.</td>
		</tr>
		<%
			} else {
				for (int i = 0; i < vResult.size(); i++) {
					productBean product = vResult.get(i);
		%>
		<tr>
			<td align="center"><%=product.getNo()%></td>
			<td align="center"><img src="/z/shop/data/<%=product.getImage()%>" width="150px" height="150px"></td>
			<td align="center"><%=product.getName()%></td>
			<td align="center"><%=product.getPrice()%></td>
			<td align="center"><%=product.getDetail()%></td>
			<td align="center"><%=product.getDate()%></td>
			<td align="center"><%=product.getStock()%></td>
			<td align="center"><a href="/z/shop/buy.jsp">�����ϱ�</a></td>
		</tr>
		<%
				}
			}
		%>
	</table>
	<jsp:include page="/shop/productAdmin.jsp" /><p> <!-- ���� �������ؼ� ����� ��ħ -->
</body>
</html>