package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.concurrent.BlockingDeque;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	// 공통 변수 선언
	Connection con = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public Connection getCon() throws Exception {
		Context initCTX = new InitialContext();
		DataSource ds = (DataSource) initCTX.lookup("java:com/env/jdbc/funwebDB");
		con = ds.getConnection();

		System.out.println("디비 연결 성공!");

		return con;

	}

	public void closeMyDB() {
		try {
			if (rs != null) {
				rs.close();

				if (pstmt != null) {
					pstmt.close();

				}
				if (con != null) {
					con.close();
				}
			}
		} catch ( Exception e) {
			
			e.printStackTrace();
		}

	}
	
	public void insertBoard(BoardBean bb){

		
	}
	
	
}
