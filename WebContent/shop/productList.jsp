<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*, z.*"%>
<jsp:useBean id="proMgr" class="z.productMgr" />
<jsp:useBean id="z_memMgr" class="z.z_memberMgr" />
	
<%
	request.setCharacterEncoding("euc-kr");
	String mem_email = (String) session.getAttribute("emailkey");
	String admin = "1";
	if(mem_email != null) {
		admin = z_memMgr.admin(mem_email);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ǰ���</title>
<link href="/z/setting/style.css" rel="stylesheet" type="text/css">
<link rel="short icon" href="/z/setting/box.png">
<script type="text/javascript" src="/z/setting/script.js" charset="utf-8"></script>
</head>
<body>
	<%@ include file="/top.jsp"%><br>
	<br>
	<br>

	<table class="pro">
		<tr>
			<td align="center">��ǰ��ȣ</td>
			<td align="center">��ǰ����</td>
			<td align="center">�̸�</td>
			<td align="center">����</td>
			<td align="center">��ǰ����</td>
			<td align="center">��ϳ�¥</td>
			<td align="center">������</td>
			<td colspan="2" align="center">����/����</td>
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
			<td align="center"><a href="javascript:productdetail('<%=product.getNo() %>')">
								<img src="data/<%=product.getImage() %>" width="150px" height="150px"></a></td>
			<td align="center"><%=product.getName()%></td>
			<td align="center"><%=product.getPrice()%></td>
			<td align="center"><%=product.getDetail()%></td>
			<td align="center"><%=product.getDate()%></td>
			<td align="center"><%=product.getStock()%></td>
			<%
				if (admin.equals("3")) { //�����ڰ����� ���̴� ����
			%>	
					<td align="center"><a href="javascript:productUpdate('<%=product.getNo() %>')">�����ϱ�</a></td>
					<td align="center"><a href="javascript:productDelete('<%=product.getNo() %>')">�����ϱ�</a></td>
			<%
				} else if(!admin.equals("3")) { 
			%>
					<td align="center">������ �����ϴ�.</td>
			<%
				}
			%>
		</tr>
		<tr>
			<td colspan="8" align="center"><a href="/z/shop/"></a></td>
		</tr>
		<%
				}
			}
		%>
	</table>
	<form name="update" method="post" action="productUpdate.jsp">
		<input name="no" type="hidden">
	</form>
	<form name="del" method="post" action="productProc.jsp?flag=delete">
		<input name="no" type="hidden">
	</form>
	<form name="detail" method="post" action="productdetail.jsp">
		<input name="no" type="hidden">
	</form>

</body>
</html>