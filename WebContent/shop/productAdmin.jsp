<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,z.*" %>
<jsp:useBean id="z_memMgr" class="z.z_memberMgr" />
<%
	String mem_email = (String) session.getAttribute("emailkey");
	String admin = "1";
	if(mem_email != null) {
		admin = z_memMgr.admin(mem_email);
	}
%>
<table>
	<ul>
		<%
			if (admin.equals("3")) {
				out.println("관리자계정입니다.");
		%>
				<p>
				<li><a href="/z/shop/productList.jsp">상품목록</a></li>
				<li><a href="/z/shop/productinsert.jsp">상품추가</a></li>
		<% } else if(!admin.equals("3")){ 
				out.println();
			}
		%>
	</ul>
</table>