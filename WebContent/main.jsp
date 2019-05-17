<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="java.util.*, z.*"%>
<jsp:useBean id="proMgr" class="z.productMgr" />
<%
	request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메인화면</title>
<link rel="short icon" href="/z/setting/box.png">
</head>
<body>
	<%@ include file="/top.jsp"%><p>
		<br> <br>
	<h1 align="center">메인화면입니다</h1>
	<table class="pro">
		<tr>
			<td align="center">제품번호</td>
			<td align="center">제품사진</td>
			<td align="center">이름</td>
			<td align="center">가격</td>
			<td align="center">상품정보</td>
			<td align="center">등록날짜</td>
			<td align="center">재고수량</td>
			<td align="center"></td>
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
			<td align="center"><img src="/z/shop/data/<%=product.getImage()%>" width="150px" height="150px"></td>
			<td align="center"><%=product.getName()%></td>
			<td align="center"><%=product.getPrice()%></td>
			<td align="center"><%=product.getDetail()%></td>
			<td align="center"><%=product.getDate()%></td>
			<td align="center"><%=product.getStock()%></td>
			<td align="center"><a href="/z/shop/buy.jsp">구매하기</a></td>
		</tr>
		<%
				}
			}
		%>
	</table>
	<jsp:include page="/shop/productAdmin.jsp" /><p> <!-- 각각 컴파일해서 결과를 합침 -->
</body>
</html>