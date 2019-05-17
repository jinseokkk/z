<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
<link href="/z/setting/style.css" rel="stylesheet" type="text/css">
<link rel="short icon" href="/z/setting/box.png">
<script type="text/javascript" src="/z/setting/script.js" charset="utf-8"></script>
</head>
<body>
<%@ include file = "/top.jsp" %><p>
	<form name="signup" method="post" action="signupproc.jsp">
		<table class="ct">
			<tr>
				<td colspan="2" align="center"><h1>회원가입</h1></td>
			</tr>
			<tr>
				<td align="right">이름 : </td>
				<td><input name="mem_id" type="text" placeholder="이름을 입력하세요"></td>
			</tr>
			<tr>
				<td align="right">이메일 : </td>
				<td><input name="mem_email" type="text" placeholder="이메일을 입력하세요">
					<input value="메일인증하기" type="button" onclick=""></td>
			</tr>
			<tr>
				<td align="right">비밀번호 : </td>
				<td><input name="mem_pw" type="password" placeholder="비밀번호를 입력하세요"></td>
			</tr>
			<tr>
				<td align="right">비밀번호 확인 : </td>
				<td><input name="mem_repw" type="password" placeholder="비밀번호를 한번 더 입력하세요"></td>
			</tr>
			<tr>
				<td align="right">가입유형 선택 : </td>
				<td>일반회원  <input name="mem_type" type="radio" value="1">&nbsp;
					법인회원  <input name="mem_type" type="radio" value="2"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input value="가입" type="button" onclick="signupcheck()">&nbsp;
					<input value="취소" type="button" onclick="history.back()"></td>
			</tr>
		</table>
	</form>
</body>
</html>