<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

   <%
    // 다운로드할 파일의 이름 저장 (파라미터)
    String filename = request.getParameter("filename");
    
    System.out.println("다운로드할 파일명 : "+filename);
    
    // 파일이 업로드된 폴더명
    String savePath = "/upload";
    
    // 다운로드 경로 계산
    // 프로젝트 정보 저장
    ServletContext context = getServletContext();
    
    // 프로젝트에 업로드 폴더의 실제 경로 
    String sDownloadPath = context.getRealPath(savePath);
    System.out.println("sDownloadPath : "+sDownloadPath);
   
   
    // 다운로드 할 파일의 경로를 저장
    String sFilePath = sDownloadPath+"\\"+filename;
    System.out.println("sFilePath : "+sFilePath);
    
   
    // 파일 다운로드 - 파일 출력
    
    // 파일을 한번에 저장하는 배열 (버퍼)
    byte[] b = new byte[4096];
    
    // 파일 입력스트림 객체 생성
   //FileInputStream fis = new FileInputStream(File f);
   // FileInputStream fis = new FileInputStream(String path);
  FileInputStream fis = new FileInputStream(sFilePath);
  
  // MIME 타입을 확인 및 설정
  String sMimeType = getServletContext().getMimeType(sFilePath);
  System.out.println("sMimeType >> "+sMimeType);
  // MIME 타입 : 클라이언트에게 전송된 문서의 다양성을 알려주기 위한 메커니즘(기술)
  // 웹 환경에서는 파일의 확장자는 의미가 없음. 각 문서와 해당 MIME 타입을 정확하게
  // 전송하는것이 서버의 역활 중 한가지. => 정보를 브라우저가 리소스를 받아서 가장먼저 해야할 일을 알려줌.
  
  /* https://developer.mozilla.org/ko/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Common_types */

  //MIME 타입을 기본값 지정
		if (sMimeType == null) {
			sMimeType = "application/octet-stream";
			// application/octet-stream -> 이진타입의 파일의 기본값
			// => "잘 알려지지 않은 이진파일", 브라우저에서 자동실행 x, 실행여부 묻기도 함
		}

		//내가 응답할 페이지의 MIME 타입을 지정
		response.setContentType(sMimeType);

		//사용자의 브라우저를 구분(IE인지 판단)
		String agent = request.getHeader("User-Agent");
		System.out.println("agent : " + agent);

		boolean ieBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1);
		
		if(ieBrowser){	//true-인터넷 익스플로러
			filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
			//IE 일 경우 한글 파일이 깨짐
			//IE 일 경우 공백문자 : "+" -> 공백문자 "%20" 변경
			
		}else{
			
			filename=new String(filename.getBytes("UTF-8"), "iso-8859-1");
			
		}
		
		//다운로드 파일 출력
		response.setHeader("Content-Disposition", "attachment; filename="+filename);
		// => 브라우저에서 사용할 수 있는 파일(해석 가능한 파일)도 다운로드 형태로 변경하기 위함
		
// 		out.close();
// 		out = pageContext.pushBody();
				
				
		ServletOutputStream out2=response.getOutputStream();
		
		int numRead;
		while((numRead = fis.read(b,0,b.length)) != -1){ // -1 파일의 끝 (EOF, ctrl+z)
			out2.write(b,0,numRead);
		}
		out2.flush(); 	//버퍼(배열)의 빈공간을 공백으로 채워서 전달
		out2.close();
		fis.close();
   
   
   %>

</body>
</html>