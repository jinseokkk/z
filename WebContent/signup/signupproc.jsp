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
<title>ȸ������</title>
<link rel="short icon" href="/z/setting/box.png">
</head>
<body>

	<%
		if (flag) {
			out.println("ȸ�������� ���ϵ帳�ϴ�.<p>");
			out.println("<a href=/z/login/login.jsp>�α���</a>");
		} else {
			out.println("�ٽ� �Է����ּ���.<p>");
			out.println("<a href=/z/signup/signup.jsp>�ٽ� ����</a>");
		}
	%>
</body>
</html>