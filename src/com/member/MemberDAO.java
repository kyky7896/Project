package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

	// 레퍼런스 준비
	Connection con = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	///////////////////////////////////
	// 디비 연결 처리 메서드
	private Connection getCon() {

		// Context 객체 생성
		try {

			// InitialContext 클래스는 Context 인터페이스를 상속받았으므로
			// 오버라이딩해서 생성
			Context initCTX = new InitialContext(); // context.xml를 초기화해서
													// 불러오려고함.
			// context 사용해서 디비정보를 가져오기
			DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/mysqlDB");
			// 다운캐스팅
			// java:comp/env/ 무조건 고정 + context.xml의 이름 추가
			// context.xml파일의 정보를 불러오기
			// 연결정보를 사용해서 연결
			con = ds.getConnection();
			// con에 담아서 리턴하겠다.

			System.out.println("DAO: 디비 연결 성공!!");
			System.out.println("DAO: " + con);

		} catch (Exception e) {
			System.out.println("디비 연결 오류 발생!");
			e.printStackTrace();
		} // 초기화된 CONTEXT를 저장하겠다라는 의미

		return con;
	}

	//////////////////////////////////
	// 자원해제 메서드
	public void closeDB() {

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

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	//////////////////////////////////
	// InsertMember(mb)
	public void InsertMember(MemberBean mb) {
		// 회원가입 처리
		// 1.드라이버 로드
		// 2.디비 연결
		con = getCon();
		try {

			// 3.sql & pstmt

			String sql = "insert into sharemarket_member (id,pw,name,gender,phonenumber,email,address1,address2,reg_date) "
					+ "values(?,?,?,?,?,?,?,?,?) ";
			pstmt = con.prepareStatement(sql);

			// 4.?
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPw());
			pstmt.setString(3, mb.getName());
			pstmt.setString(4, mb.getGender());
			pstmt.setString(5, mb.getPhonenumber());
			pstmt.setString(6, mb.getEmail());
			pstmt.setString(7, mb.getAddress1());
			pstmt.setString(8, mb.getAddress2());
			pstmt.setTimestamp(9, mb.getReg_date());

			// 5.pstmt실행
			pstmt.executeUpdate();

			System.out.println("DAO:sql실행완료!+ 회원가입완료!");

		} catch (SQLException e) {
			System.out.println("DAO:sql 구문 실행 에러!+ 회원가입실패!");
			e.printStackTrace();
		} finally {
			closeDB();
		}

	}// InsertMember(mb)

	// idCheck(id,pw)
	public int idCheck(String id, String pw){
		int result=-1;
		
		
		try {
			//1.2 드라이브 연결
			con=getCon();
			//3.sql쿼리 & pstmt
			sql="select pw from sharemarket_member where id=?";
			pstmt=con.prepareStatement(sql);
			
			//?
			pstmt.setString(1, id);
			
			//4.실행
			rs=pstmt.executeQuery();
			
			//5.데이터 처리
			if(rs.next()){ 
				//회원인 경우(아이디 있는 경우)
				if(pw.equals(rs.getString("pw"))){
					//아이디 있고, 비밀번호 일치
					result=1;
				}else{
					//아이디 있지만 비밀번호 불일치
					result = 0;
				}
			}else{
					//회원정보 없음(아이디 없음)
					result= -1;
				}
				System.out.println("DAO:sql 구문 실행 성공");
				System.out.println("DAO:로그인 체크 완료=>"+result);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
				
	}

	// idCheck(mb)

}
