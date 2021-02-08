package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sun.org.apache.bcel.internal.generic.RETURN;

public class BoardDAO {

	// 공통 변수 선언
	Connection con = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public Connection getCon() throws Exception {
		Context initCTX = new InitialContext();
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/mysqlDB");
		con = ds.getConnection();

		System.out.println("DB 연결 성공!");

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
		int bno=0;
		try {
			//1.2 디비연결
			con=getCon();
			//3.sql 구문 & pstmt 연결
			
			//number가 없음.
			//////////////////////////////////
			//글번호 num 계산하기
			// 3.sql 쿼리 & pstmt 
			
			//글번호 계산
			sql="select max(num) from sharemarket_board";
			
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				bno=rs.getInt(1)+1;
			}
			System.out.println("글번호:"+bno);
			
			///////////글번호+글정보 조합해주기
			
			sql="insert into sharemarket_board (num,name,pass,subject,content,"
					+ "readcount, re_ref, re_lev, re_seq, date, ip, file) "
					+ "values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0);
			pstmt.setInt(7, bno);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());
			
			pstmt.executeUpdate();
			
			System.out.println("Dao: 글쓰기 성공! 글번호 :"+bno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int getBoardCount(){
		int cnt=0;
		try {
			
			//1.2 디비연결
			con=getCon();
			//3.4 sql&pstmt 
			sql="select count(*) from sharemarket_board ";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				cnt=rs.getInt(1);
			}
			
			System.out.println("DAO: 원글 개수 조회"+cnt);
					
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		
		return cnt;

	}//getBoardCount();
	
	//getBoardList();
	public ArrayList getBoardList(){
		ArrayList boardList=new ArrayList();
		
		try {
			//1.2디비연결
			con=getCon();
			
			//3.4
			sql="select * from sharemarket_board";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				BoardBean bb=new BoardBean();
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
				
				boardList.add(bb);
			}
			
			System.out.println("DAO : 게시판 글 저장완료!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		
		return boardList;
	}
	//getBoardList();
	
	//getBoardList(startRow, pageSize);
	public ArrayList getBoardList(int startRow, int pageSize){
		
		ArrayList boardList =new ArrayList();
		
		try {
			//1.2 디비연결
			con=getCon();
			
			//3.sql & pstmt 객체 생성
			sql="select * from sharemarket_board"
					+ " order by re_ref desc, re_seq asc"
					+ " limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			//4.실행
			rs=pstmt.executeQuery();
			//5.데이터처리
			while(rs.next()){
				BoardBean bb=new BoardBean();
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
				
				boardList.add(bb);
				
			}
			
			System.out.println("DAO : 게시판 글 저장 완료! ");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		
		return boardList;
	}
	//getBoardList(startRow, pageSize);
	
	//bdao.updateReadCount(num);
	public void updateReadCount(int num){
		try {
			//1.2디비연결
			con=getCon();
			//3 sql & pstmt 생성
			sql="update sharemarket_board set readcount=readcount+1 where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
			System.out.println("DAO:조회수 1 증가!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		
				
	}
	//bdao.updateReadCount(num);
	
	//getBoard(num)
	public BoardBean getBoard(int num){
		BoardBean bb=null;
		try {
			//1.2디비 연결
			con=getCon();
			//3 sql & pstmt 생성
			sql="select * from sharemarket_board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			// 4.실행
			rs=pstmt.executeQuery();
			
			//5.데이터처리
			if(rs.next()){
				bb=new BoardBean();
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
			
				
				
			}
			
			System.out.println();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeMyDB();
		}
		return bb;
		
	}
	
	//getBoard(num)
	

	// updateBoard(bb)
	public int updateBoard(BoardBean bb){
		int result = -1;
		// -1 : 아이디없음, 0 : 비밀번호 오류, 1 : 정상처리
		
		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. sql 작성 (select-글이 있는지 판단)& pstmt 객체
			sql ="select pass from sharemarket_board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()){
				if(bb.getPass().equals(rs.getString("pass"))){
					//3. sql 작성  (update-해당글 수정) & pstmt 객체 
					sql ="update sharemarket_board set name=?,subject=?,"
							+ "content=? where num=?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, bb.getName());
					pstmt.setString(2, bb.getSubject());
					pstmt.setString(3, bb.getContent());
					pstmt.setInt(4, bb.getNum());
					//4. sql 실행
					result = pstmt.executeUpdate();
					
					//result = 1;				
					System.out.println("DAO : 글 수정- 정상 수정");
					
				}else{
					// 비밀번호 오류
					System.out.println("DAO : 글 수정- 비밀번호 오류");
					result = 0;
				}
			}else{
				// 글없음
				System.out.println("DAO : 글 수정- 글 없음");
				result = -1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		
		
		return result;
	}
	// updateBoard(bb)
	
	//deleteBoard(bb)
	public int deleteBoard(BoardBean bb){
		int result=-1;
		try {
			
			con=getCon();
			sql="select pass from sharemarket_board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				if(bb.getPass().equals(rs.getString("pass"))){
					sql = "delete from sharemarket_board where num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, bb.getNum());
					
					result=pstmt.executeUpdate();
				}else{
					result=0;
					
				}
			}else{
				result=-1;
			}
			
			System.out.println("DAO: 글 삭제 처리->"+result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeMyDB();
		}
		return result;
	}
	//deleteBoard(bb)
	
	
	//reInsertBoard(bb)
	public void reInsertBoard(BoardBean bb){
		int num=0;
		//1.2.디비연결
		try {
			con=getCon();
			
			sql="select max(num) from sharemarket_board";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				num=rs.getInt(1)+1;
			}
			
			System.out.println("DAO: 답글번호 확인 ->"+num);
			//답글순서 재배치
			sql="update sharemarket_board set re_seq=re_seq+1 "
					+ "where re_ref=? and re_seq>?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bb.getRe_ref());
			pstmt.setInt(2, bb.getRe_seq());
			
			pstmt.executeUpdate();
			
			System.out.println("DAO : 답글순서 재배치");
			
			sql="insert into sharemarket_board (num, name, pass, subject, content, "
					+ "readcount, re_ref, re_lev, re_seq, date, ip, file) "
					+ "values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0);
			pstmt.setInt(7, bb.getRe_ref());
			pstmt.setInt(8, bb.getRe_lev()+1);
			pstmt.setInt(9, bb.getRe_seq()+1);
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());
			
			pstmt.executeUpdate();
			
			System.out.println("pro (답글):"+bb);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
	}
	//reInsertBoard(bb)
}
