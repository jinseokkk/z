<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
<link href="/z/setting/style.css" rel="stylesheet" type="text/css">
<link rel="short icon" href="/z/setting/box.png">
<script type="text/javascript" src="/z/setting/script.js" charset="utf-8"></script>
</head>
<body>
<%@ include file = "/top.jsp" %><p>
	<form name="signup" method="post" action="signupproc.jsp">
		<table class="ct">
			<tr>
				<td colspan="2" align="center"><h1>ȸ������</h1></td>
			</tr>
			<tr>
				<td align="right">�̸� : </td>
				<td><input name="mem_id" type="text" placeholder="�̸��� �Է��ϼ���"></td>
			</tr>
			<tr>
				<td align="right">�̸��� : </td>
				<td><input name="mem_email" type="text" placeholder="�̸����� �Է��ϼ���">
					<input value="���������ϱ�" type="button" onclick=""></td>
			</tr>
			<tr>
				<td align="right">��й�ȣ : </td>
				<td><input name="mem_pw" type="password" placeholder="��й�ȣ�� �Է��ϼ���"></td>
			</tr>
			<tr>
				<td align="right">��й�ȣ Ȯ�� : </td>
				<td><input name="mem_repw" type="password" placeholder="��й�ȣ�� �ѹ� �� �Է��ϼ���"></td>
			</tr>
			<tr>
				<td align="right">�������� ���� : </td>
				<td>�Ϲ�ȸ��  <input name="mem_type" type="radio" value="1">&nbsp;
					����ȸ��  <input name="mem_type" type="radio" value="2"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input value="����" type="button" onclick="signupcheck()">&nbsp;
					<input value="���" type="button" onclick="history.back()"></td>
			</tr>
		</table>
	</form>
</body>
</html>