<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*, z.*"%>
<jsp:useBean id="proMgr" class="z.productMgr" />
<jsp:useBean id="z_memMgr" class="z.z_memberMgr" />
	
<%
	request.setCharacterEncoding("euc-kr");
	String mem_email = (String) session.getAttribute("emailkey");
	String admin = "1";
	if(mem_email != null) {
		admin = z_memMgr.admin(mem_email);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품목록</title>
<link href="/z/setting/style.css" rel="stylesheet" type="text/css">
<link rel="short icon" href="/z/setting/box.png">
<script type="text/javascript" src="/z/setting/script.js" charset="utf-8"></script>
</head>
<body>
	<%@ include file="/top.jsp"%><br>
	<br>
	<br>

	<table class="pro">
		<tr>
			<td align="center">제품번호</td>
			<td align="center">제품사진</td>
			<td align="center">이름</td>
			<td align="center">가격</td>
			<td align="center">상품정보</td>
			<td align="center">등록날짜</td>
			<td align="center">재고수량</td>
			<td colspan="2" align="center">수정/삭제</td>
		</tr>
		
		<%	
			
			Vector<productBean> vResult = proMgr.getProductList(); //productMgr의 getProductList를 호출해서 결과값을 벡터에 넣음
			if (vResult.size() == 0) {
		%>
		<tr>
			<td align="center" colspan="5">등록된 제품이 없습니다.</td>
		</tr>
		<% 
			} else {
				for (int i = 0; i < vResult.size(); i++) {
					productBean product = vResult.get(i);		
		%>
		<tr>
			<td align="center"><%=product.getNo()%></td>
			<td align="center"><a href="javascript:productdetail('<%=product.getNo() %>')">
								<img src="data/<%=product.getImage() %>" width="150px" height="150px"></a></td>
			<td align="center"><%=product.getName()%></td>
			<td align="center"><%=product.getPrice()%></td>
			<td align="center"><%=product.getDetail()%></td>
			<td align="center"><%=product.getDate()%></td>
			<td align="center"><%=product.getStock()%></td>
			<%
				if (admin.equals("3")) { //관리자계정만 보이는 영역
			%>	
					<td align="center"><a href="javascript:productUpdate('<%=product.getNo() %>')">수정하기</a></td>
					<td align="center"><a href="javascript:productDelete('<%=product.getNo() %>')">삭제하기</a></td>
			<%
				} else if(!admin.equals("3")) { 
			%>
					<td align="center">권한이 없습니다.</td>
			<%
				}
			%>
		</tr>
		<tr>
			<td colspan="8" align="center"><a href="/z/shop/"></a></td>
		</tr>
		<%
				}
			}
		%>
	</table>
	<form name="update" method="post" action="productUpdate.jsp">
		<input name="no" type="hidden">
	</form>
	<form name="del" method="post" action="productProc.jsp?flag=delete">
		<input name="no" type="hidden">
	</form>
	<form name="detail" method="post" action="productdetail.jsp">
		<input name="no" type="hidden">
	</form>

</body>
</html>