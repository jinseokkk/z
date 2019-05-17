<%@page import="z.z_memberMgr"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" %>
<jsp:useBean id="signBean" class="z.signupBean"/>
<jsp:setProperty property="*" name="signBean"/>
<%	
	String mem_id = (String) session.getAttribute("idkey");
%>
<link href="setting/style.css" rel="stylesheet" type="text/css">
<table class="top_table">
	<ul class="top_ul">
		<li><a href="">목록</a></li>
		<li class="box"><a href="/z/main.jsp"><img src="/z/setting/box.png" width="50px" height="50px"></a></li>
		<%
			if (mem_id != null) {
		%>		
				<li><a href="/z/login/logout.jsp">로그아웃</a></li>
		<%
			} else {
		%>
				<li><a href="/z/login/login.jsp">로그인</a></li>
		<%
			}
		%>
	</ul>
</table>
