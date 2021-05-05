package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ImgBoardDAO {
	Connection con = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private Connection getCon() {
		try {
			Context initCTX;
			initCTX = new InitialContext();
			DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/mysqlDB");
			con = ds.getConnection();

			System.out.println("DB연결 성공!");
			System.out.println("DB" + con);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;

	}

	public void closeMyDB() {
		System.out.println("imgDAO:자원해제");

		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void insertIBoard(ImgBoardBean ibb){
		int bno=0;
		
		try {
			con=getCon();
			sql="select max(num) from market_imgboard";
			pstmt=con.prepareStatement(sql);
			
			if(rs.next()){
				bno=rs.getInt(1)+1;
			}
			System.out.println("글번호 : "+bno);
			
			////////글번호 + 글정보 조합하기
			sql="insert into market_imgboard (num, subject, savefilename) values (?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, ibb.getSubject());
			pstmt.setString(3, ibb.getSavefilename());
			
			pstmt.executeUpdate();
			pstmt.close();
			
			System.out.println("IDAO :글쓰기 성공! 글번호 :"+bno);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	
}
