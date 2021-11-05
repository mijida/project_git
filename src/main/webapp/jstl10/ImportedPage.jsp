<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ImportedPage.jsp -->
<hr/>
<h4>포함된 페이지: ImportedPage.jsp</h4>
<h5>리퀘스트 영역에 저장된 속성</h5>
\${requestvar} : ${requestvar}
<h5>파라미터로 전달된 값</h5>
<ul>
	<li>아이디:${param.user}</li>
	<li>비번:${param.pass}</li>
</ul>