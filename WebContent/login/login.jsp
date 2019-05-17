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
<title>로그인</title>
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
				<%=mem_id%>님 환영합니다.<p>
				로그인 되었습니다.<p>
				<jsp:include page="/shop/productAdmin.jsp" /><p>
		<%
			} else {
		%>
	</div>
	<form name="login" method="post" action="/z/login/loginproc.jsp">
		<table class="ct">
			<tr>
				<td>로그인</td>
			</tr>
			<tr>
				<td><input type="text" name="mem_email"
					placeholder="이메일을 입력하세요"></td>
			</tr>
			<tr>
				<td><input type="password" name="mem_pw"
					placeholder="비밀번호를 입력하세요"></td>
			</tr>
			<tr>
				<td align="center">
				<input type="button" value="로그인" onclick="logincheck()">
				<input type="button" value="회원가입" onclick="signup_go()"></td>
			</tr>
		</table>
	</form>
	<%
		}
	%>

</body>
</html>