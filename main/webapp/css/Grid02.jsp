<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>Grid02.jsp</title>

    <!-- 부트스트랩 -->

    <link href="<c:url value="/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
     <style>
    	.row div{
    		background-color: gray;
    		border:2px red solid;
    		box-sizing: border-box;
    		height:100px;
    		line-height:100px;
    		text-align: center;
    	}
    </style>
  </head>
  <body>
    <div class="container">
    	<div class="row">
		  <div class="col-md-8">.col-md-8</div>
		  <div class="col-md-4">.col-md-4</div>
		</div>
		<div class="row">
		  <div class="col-xs-12 col-md-8">.col-xs-12 .col-md-8</div>
		  <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
		</div>
		<div class="row">
		  <div class="col-md-4">.col-md-4</div>
		  <div class="col-md-4">.col-md-4</div>
		  <div class="col-md-4">.col-md-4</div>
		</div>
		<div class="row">
		  <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
		  <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
		  <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
		</div>
		<!-- 해상도에 상관없이 항상 영역을 1:1(2등분)로 분할 -->
    	<div class="row">
		  <div class="col-xs-6">.col-xs-6</div>
		  <div class="col-xs-6">.col-xs-6</div>
		</div>
		<!-- 해상도에 상관없이 항상 영역을 1:1:1(3등분)로 분할 -->
    	<div class="row">
		  <div class="col-xs-4">.col-xs-4</div>
		  <div class="col-xs-4">.col-xs-4</div>
		  <div class="col-xs-4">.col-xs-4</div>
		</div>
		<!-- 응용하기:992px이상에서는 4칸씩 차지하여 가로배치
		            991px이하에서는 첫번째 div가 8칸 두번째 div가 4칸(하나의 행 구성)
		            세번째 div는 6칸(다음 행 구성)을 차지하는 레이아웃
		            (총 3개의 div사용)		
		 -->
		 <div class="row">
		  <div class="col-xs-8 col-md-4">컨텐츠1</div>
		  <div class="col-xs-4 col-md-4">컨텐츠2</div>
		  <div class="col-xs-6 col-md-4">컨텐츠3</div>
		</div>
    </div>

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
  </body>
</html>