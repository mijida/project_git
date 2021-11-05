<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Download.jsp -->
<% 
/*
다운로드 원리]
1]웹브라우저가 인식하지 못하는 컨텐트 타입을 
  응답헤더에 설정해주면 웹브라우저는 자체 다운로드 창을 띄운다.
2]서버에 저장된 파일을 출력스트림을 통해  웹브라우저에 출력한다.
*/		
//1]파라미터로 넘어오는 파일명 받기
String filename = request.getParameter("filename");
//2]파일이 저장된 서버의 물리적 경로 얻기]
String saveDirectory=application.getRealPath("/upload");
//3]파일 크기를 얻기 위한 파일 객체 생성(옵션)
//  -다운로드시 프로그래스바를 표시하기 위함.
File file = new File(saveDirectory+File.separator+filename);
long length=file.length();
/* 다운로드를 위한 응답 헤더 설정 */
//4-1]웹브라우저가 인식하지 못하는 컨텐츠타입(MIME)타입 설정.
response.setContentType("application/octet-stream");
//4-2]다운로드시 프로그래스바를 표시하기 위한 컨텐츠 길이 설정
response.setContentLengthLong(length);
//4-3] 응답헤더명: Content-Disposition
//     응답헤더명에 따른 값:attachment;filename=파일명
//     setHeader(응답헤더명,헤더값)으로 추가
//브라우저 종류에 따라 한글 파일명이 깨지는 경우가 있음으로
//브라우저별 인코딩 방식을 달리 하자(파일명을 인코딩)
boolean isIe = request.getHeader("user-agent").toUpperCase().indexOf("MSIE") !=-1 ||
		       request.getHeader("user-agent").indexOf("11.0") !=-1 ||
		       request.getHeader("user-agent").toUpperCase().indexOf("EDGE") !=-1;
if(isIe){//인터넷 익스플로러 혹은 엣지
	filename = URLEncoder.encode(filename,"UTF-8");
}
else{//기타 브라우저
	//new String(byte[] bytes, String charset)사용
		//1]파일명을 byte형 배열로 변환
		//2]String클래스의 생성자에  변환한 배열과 
		//  charset는 8859_1을 지정 
		filename = new String(filename.getBytes("UTF-8"),"8859_1"); 		
}
response.setHeader("Content-Disposition", "attachment;filename="+filename);
/* IO작업을 통해서 서버에 있는 파일을 웹브라우저에 바로 출력*/
/*
 데이타 소스:파일 -노드 스트림:FileInputStream
                필터 스트림:BufferedInputStream
                   
 데이타 목적지:웹브라우저-노드 스트림:response.getOutputStream()
                          필터 스트림:BufferedOutputStream
*/
//5]서버에 있는 파일에 연결할 입력 스트림 생성
BufferedInputStream bis =
	new BufferedInputStream(new FileInputStream(file));
/*	
jsp에서 servlet으로 변환될때 내부적으로 out 객체가 지역변수로 선언되어
    생성된다.out 내장객체 생성후에  response내장객체로 출력스트림을 
    얻으면 이미 생성된 out내장객체와 충돌이 나타나서 이미 호출되었다는 메세지가 나타난다
(getOutputStream() has already been called for this response)
단,서블릿에서는 상관없다
response객체로 출력스트림을 생성하기 전에
     다음과 같이 기존의 out 객체를 초기화하는 코드를 넣어주면 된다.
 out.clear();
 out=pageContext.pushBody();
*/
out.clear();
out = pageContext.pushBody();

//6]웹브라우저에 연결할 출력 스트림 생성
BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());

//7]bis로 읽고 bos로 웹브라우저에 출력
int data;
while((data=bis.read()) !=-1){
	bos.write(data);
	bos.flush();
}
//8]스트림 닫기
bis.close();
bos.close();
%>					