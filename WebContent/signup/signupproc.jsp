<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");	
%>
<jsp:useBean id="z_memMgr" class="z.z_memberMgr" />
<jsp:useBean id="signBean" class="z.signupBean" />
<jsp:setProperty property="*" name="signBean"/>
<%
	/* <jsp:setProperty property="mem_email" name="signBean"/>
	 == signBean.setMem_email(request.getParameter("mem_email")); */
	boolean flag = z_memMgr.z_memberInsert(signBean);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
<link rel="short icon" href="/z/setting/box.png">
</head>
<body>

	<%
		if (flag) {
			out.println("회원가입을 축하드립니다.<p>");
			out.println("<a href=/z/login/login.jsp>로그인</a>");
		} else {
			out.println("다시 입력해주세요.<p>");
			out.println("<a href=/z/signup/signup.jsp>다시 가입</a>");
		}
	%>
</body>
</html>