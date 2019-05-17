<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="z_member" class="z.z_memberMgr" />
<%
	request.setCharacterEncoding("euc-kr");
	String email = request.getParameter("mem_email");
	String password = request.getParameter("mem_pw");
	boolean logincheck = z_member.logincheck(email, password);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="short icon" href="/z/setting/box.png">
</head>
<body>
<%
	if(logincheck) {
		session.setAttribute("emailkey", email);
		session.setAttribute("idkey", z_member.idselect(email));
%>
<%		response.sendRedirect("/z/login/login.jsp");
	} else {
		response.sendRedirect("/z/login/loginerror.jsp");
	}
%>
</body>
</html>