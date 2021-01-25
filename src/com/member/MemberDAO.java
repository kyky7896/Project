package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mysql.fabric.xmlrpc.base.Member;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

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
	public int idCheck(String id, String pw) {
		int result = -1;

		try {
			// 1.2 드라이브 연결
			con = getCon();
			// 3.sql쿼리 & pstmt
			sql = "select pw from sharemarket_member where id=?";
			pstmt = con.prepareStatement(sql);

			// ?
			pstmt.setString(1, id);

			// 4.실행
			rs = pstmt.executeQuery();

			// 5.데이터 처리
			if (rs.next()) {
				// 회원인 경우(아이디 있는 경우)
				if (pw.equals(rs.getString("pw"))) {
					// 아이디 있고, 비밀번호 일치
					result = 1;
				} else {
					// 아이디 있지만 비밀번호 불일치
					result = 0;
				}
			} else {
				// 회원정보 없음(아이디 없음)
				result = -1;
			}
			System.out.println("DAO:sql 구문 실행 성공");
			System.out.println("DAO:로그인 체크 완료=>" + result);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return result;

	}
	// idCheck(mb)

	// getMember(mb)
	public MemberBean getMember(String id) {

		MemberBean mb = null;

		try {
			// 1.2디비연결
			con = getCon();

			// 3.sql구문 & pstmt객체
			sql = "select * from sharemarket_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			// 4.실행
			rs = pstmt.executeQuery();

			// 5.구문
			if (rs.next()) {
				// 데이터를 저장할 객체 생성
				mb = new MemberBean();

				mb.setAddress1(rs.getString("address1"));
				mb.setAddress2(rs.getString("address2"));
				mb.setEmail(rs.getString("email"));
				mb.setGender(rs.getString("gender"));
				mb.setId(rs.getString("id"));
				mb.setName(rs.getString("name"));
				mb.setPhonenumber(rs.getString("phonenumber"));
				mb.setPw(rs.getString("pw"));
				mb.setReg_date(rs.getTimestamp("reg_date"));

			}
			System.out.println("DAO : 회원정보 조회완료");
			System.out.println("DAO :" + mb);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return mb;

	}
	// getMember(mb)

	// updateMember(umb)
	public int updateMember(MemberBean umb) {
		int result = -1;
		// 패스워드 확인(pw와 id일치하는지)
		// => 멤버빈 패스워드(update.jsp파일에서 usebean 받아와 넣은 pw)와 DB패스워드 일치 여부
		// 1.2 디비연결
		con = getCon();
		try {
			// 3.sql&pstmt
			sql = "select pw from sharemarket_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, umb.getId());

			// 4.pstmt실행
			ResultSet rs = pstmt.executeQuery();

			// 5.데이터 처리
			if (rs.next()) { // 회원

				if (umb.getPw().equals(rs.getString("pw"))) {
					// pw일치하면 수정함
					// 3.sql쿼리(update) &pstmt객체
					sql = "update sharemarket_member "
							+ "set name=?, gender=?, phonenumber=?, email=?, address1=?, address2=? " 
							+ "where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, umb.getName());
					pstmt.setString(2, umb.getGender());
					pstmt.setString(3, umb.getPhonenumber());
					pstmt.setString(4, umb.getEmail());
					pstmt.setString(5, umb.getAddress1());
					pstmt.setString(6, umb.getAddress2());
					pstmt.setString(7, umb.getId());

					// 4.sql실행
					pstmt.executeUpdate();

					result = 1;
				} else { // 회원이지만 pw일치X
					result = 0;

				}

			}else{	//회원아님
				
				result=-1;
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}
	// updateMember(umb)
	
	//deleteMember(id,pw)
	public int deleteMember(String id,String pw){
		int result=-1;
		try {
			//1.2.DB불러오기
			con=getCon();
			//3.SQL & PSTMT 구문
			sql="select pw from sharemarket_member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			//4.실행
			rs=pstmt.executeQuery();
			
			//5.데이터처리
			if(rs.next()){ //pw가 나올때
				if(pw.equals(rs.getString("pw"))){
					//회원일때
					//sql&pstmt
					sql="delete from sharemarket_member where id=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1,id);
					
					//실행
					pstmt.executeUpdate();
					result=1;
				}else{	//비밀번호 오류
					result=0;
					
				}
				
			}else{	//비회원일때
				result=-1;
				
			}
			System.out.println("DAO:회원 삭제 처리 완료"+result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return result;
		
	}
	//deleteMember(id,pw)
}
