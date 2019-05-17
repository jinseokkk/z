package z;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class productMgr {
	private DBConnectionMgr pool = null;

	public productMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("error : 커넥션 가져오기 실패");
		}
	}
	
	public boolean insertproduct(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		try {
			String uploadfile = "D:\\JavaBigData2th\\mywork_jsp\\z\\WebContent\\shop\\data\\";
			MultipartRequest multi = new MultipartRequest(req, uploadfile, 5 * 1024 * 1024, "euc-kr",new DefaultFileRenamePolicy());
			con = pool.getConnection();
			String q = "insert into z_product(name, price, detail, date, stock, image) values(?, ?, ?, curdate(), ?, ?)";
			pstmt = con.prepareStatement(q);
			pstmt.setString(1, multi.getParameter("name"));
			pstmt.setString(2, multi.getParameter("price"));
			pstmt.setString(3, multi.getParameter("detail").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(4, multi.getParameter("stock"));
			
			if(multi.getFilesystemName("image") == null) {
				pstmt.setString(5, "ready.gif");
			} else {
				pstmt.setString(5, multi.getFilesystemName("image"));
			}
			
			int count = pstmt.executeUpdate();
			if(count == 1) result = true;
			
		}catch (Exception e) {
			System.out.println("insertproduct exception : " + e);
		}finally {
			pool.freeConnection(con, pstmt);
		}
		return result;
	}
	
	public Vector<productBean> getProductList() throws SQLException { // 

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector<productBean> vProduct = new Vector<productBean>();
		try {
			con = pool.getConnection();
			String q = "select * from z_product order by no asc";
			stmt = con.createStatement();
			rs = stmt.executeQuery(q);
			
			while (rs.next()) {
				productBean product = new productBean();
				product.setNo(rs.getInt("no"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getString("Price"));
				product.setDetail(rs.getString("detail"));
				product.setDate(rs.getString("date"));
				product.setStock(rs.getString("stock"));
				product.setImage(rs.getString("image"));
				vProduct.add(product);
			}
		}catch (Exception e) {
			System.out.println("exception : " + e);
		}finally {
			pool.freeConnection(con, stmt, rs);
		}
		return vProduct; 
	}
	
	public boolean updateproduct(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		String uploadfile = "D:\\JavaBigData2th\\mywork_jsp\\z\\WebContent\\shop\\data\\";
		
		try {
			con = pool.getConnection();
			MultipartRequest multi = new MultipartRequest(req, uploadfile, 5 * 1024 * 1024, "euc-kr",new DefaultFileRenamePolicy());
			if(multi.getFilesystemName("image") == null) {
				String q = "update z_product set name=?, price=?, detail=?, stock=? where no=?";
				pstmt = con.prepareStatement(q);
				pstmt.setString(1, multi.getParameter("name"));
				pstmt.setString(2, multi.getParameter("price"));
				pstmt.setString(3, multi.getParameter("detail").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
				pstmt.setString(4, multi.getParameter("stock"));
				pstmt.setString(5, multi.getParameter("no"));
				
			} else {
				String q = "update z_product set name=?, price=?, detail=?, stock=?, image=? where no=?";
				pstmt = con.prepareStatement(q);
				pstmt.setString(1, multi.getParameter("name"));
				pstmt.setString(2, multi.getParameter("price"));
				pstmt.setString(3, multi.getParameter("detail").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
				pstmt.setString(4, multi.getParameter("stock"));
				pstmt.setString(5, multi.getFilesystemName("image"));
				pstmt.setString(6, multi.getParameter("no"));
			}
			int count = pstmt.executeUpdate();
			System.out.println(count);
			if(count == 1) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateproduct exception" + e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return result;
	}
	
	public boolean deleteproduct(String no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		try {
			con = pool.getConnection();
			String q = "delete from z_product where no = ?";
			pstmt = con.prepareStatement(q);
			pstmt.setString(1, no);
			int count = pstmt.executeUpdate();
			if(count == 1) {
				result = true;
			}
		} catch (Exception e) {
			System.out.println("deleteproduct exception" + e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return result;
	}
	
	public productBean getProduct (String no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		productBean product = null;
		
		try {
			con = pool.getConnection();
			String q = "select * from z_product where no=?";
			pstmt = con.prepareStatement(q);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				product = new productBean();
				product.setNo(rs.getInt("no"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getString("price"));
				product.setDetail(rs.getString("detail"));
				product.setDate(rs.getString("date"));
				product.setStock(rs.getString("stock"));
				product.setImage(rs.getString("image"));
			}
		}catch (Exception e) {
			System.out.println("exception : " + e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return product; 
		
	}
}
