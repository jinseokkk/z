<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	response.setCharacterEncoding("EUC-KR");
	String mem_email = (String) session.getAttribute("emailkey");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���</title>
<link href="/z/setting/style.css" rel="stylesheet" type="text/css">
<link rel="short icon" href="/z/setting/box.png">
<script type="text/javascript" src="/z/setting/script.js"
	charset="utf-8"></script>
</head>
<body>
	<%@ include file="/top.jsp"%><p>
		<br>
		<br>
		<br>
	<div>
		<%
			if (mem_email != null) {
		%>	
				<%=mem_id%>�� ȯ���մϴ�.<p>
				�α��� �Ǿ����ϴ�.<p>
				<jsp:include page="/shop/productAdmin.jsp" /><p>
		<%
			} else {
		%>
	</div>
	<form name="login" method="post" action="/z/login/loginproc.jsp">
		<table class="ct">
			<tr>
				<td>�α���</td>
			</tr>
			<tr>
				<td><input type="text" name="mem_email"
					placeholder="�̸����� �Է��ϼ���"></td>
			</tr>
			<tr>
				<td><input type="password" name="mem_pw"
					placeholder="��й�ȣ�� �Է��ϼ���"></td>
			</tr>
			<tr>
				<td align="center">
				<input type="button" value="�α���" onclick="logincheck()">
				<input type="button" value="ȸ������" onclick="signup_go()"></td>
			</tr>
		</table>
	</form>
	<%
		}
	%>

</body>
</html>