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
				alert("처리하였습니다.");
				location.href = "/z/shop/productList.jsp";
			</script>
	<%
		} else {
	%>
			<script>
				alert("다시 입력해주세요.");
				history.back();
			</script>
	<%
			
		}
	%>

</body>
</html>