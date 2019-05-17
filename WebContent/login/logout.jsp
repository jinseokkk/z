<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	session.invalidate();
%>
<link rel="short icon" href="/z/setting/box.png">
<script>
	alert("로그아웃 되었습니다");
	location.href = "/z/main.jsp";
</script>