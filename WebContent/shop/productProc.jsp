<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="proMgr" class="z.productMgr" />
<%
	String flag = request.getParameter("flag");
	boolean result = false;
	
	if(flag.equals("insert")) {
		result = proMgr.insertproduct(request);
	} else if (flag.equals("update")){
		result = proMgr.updateproduct(request);
	} else if (flag.equals("delete")){
		result = proMgr.deleteproduct(request.getParameter("no"));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		if (result) {
	%>
			<script>
				alert("ó���Ͽ����ϴ�.");
				location.href = "/z/shop/productList.jsp";
			</script>
	<%
		} else {
	%>
			<script>
				alert("�ٽ� �Է����ּ���.");
				history.back();
			</script>
	<%
			
		}
	%>

</body>
</html>