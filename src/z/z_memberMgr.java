package z;

import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class z_memberMgr {
	private DBConnectionMgr pool = null;

	public z_memberMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("error : 커넥션 가져오기 실패");
		}
	}

	public boolean check_name(String name) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean checkCon = false;

		try {
			con = pool.getConnection();
			String strquery = "select name from z_member where id = ?";
			pstmt = con.prepareStatement(strquery);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			checkCon = rs.next();
		} catch (Exception e) {
			System.out.println("exception : " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return checkCon;
	}

	public boolean z_memberInsert(signupBean signBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;

		try {
			con = pool.getConnection();
			String strquery = "insert into z_member values(?,?,?,?)";
			pstmt = con.prepareStatement(strquery);
			pstmt.setString(1, signBean.getMem_id());
			pstmt.setString(2, signBean.getMem_email());
			pstmt.setString(3, signBean.getMem_pw());
			pstmt.setString(4, signBean.getMem_type());

			int count = pstmt.executeUpdate();

			if (count > 0) {
				flag = true;
			}

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	public boolean logincheck(String email, String password) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean logincon = false;
		try {
			con = pool.getConnection();
			String query = "select email, password from z_member where email=? and password=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			logincon = rs.next();
		} catch (Exception e) {
			System.out.println("exception : " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return logincon;
	}

	public String idselect(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id = null;
		try {
			con = pool.getConnection();
			String query = "select id from z_member where email=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				id = rs.getString("id");
			}
		} catch (Exception e) {
			System.out.println("exception : " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return id;
	}
	
	public String admin(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String type = null;
		try {
			con = pool.getConnection();
			String query = "select type from z_member where email= ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				type = rs.getString("type");
			}
		} catch (Exception e) {
			System.out.println("exception : " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return type;
	}

}
