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
    <title>Grid04.jsp</title>

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
    	}
    </style>
  </head>
  <body>
    <div class="container">
    	<h2>반응형 유틸리티:visible-*-*</h2>
    	<h3>행에 적용하기</h3>
    	<hr/>
    	<h5>visible-*-* 미 적용</h5>
    	<div class="row">
    		<div class="col-xs-4">col-xs-4</div>
    		<div class="col-xs-4">col-xs-4</div>
    		<div class="col-xs-4">col-xs-4</div>
    	</div>
    	<h5>visible-*-* 적용</h5>
    	<!-- 
			아래 행은 기기의 해상도가 992~1119px(md)와
    	     768~991px(sm) 사이의 기기에서만 보인다
    	 -->
    	<div class="row visible-md-block visible-sm-block">
    		<div class="col-xs-4">col-xs-4</div>
    		<div class="col-xs-4">col-xs-4</div>
    		<div class="col-xs-4">col-xs-4</div>
    	</div>
    	<h3>컬럼에 적용하기</h3>
    	<div class="row">
    		<!-- md모드일때만  2번 컨텐츠 보이기-->
    		<div class="col-xs-4">1번 컨텐츠.</div>  
    		<!--    		
    		<div class="col-xs-4 visible-md-block">2번 컨텐츠</div>   
    		-->
    		<!-- 위를 hidden으로  --> 
    		<div class="col-xs-4 hidden-xs hidden-sm hidden-lg">2번 컨텐츠</div> 		
    		<div class="col-xs-4">3번 컨텐츠</div>
    	</div>
    	<h1>반응형 컬럼 초기화 하기</h1>
    	<div class="row">
    		<div class="col-xs-6 col-sm-3">1번째 컬럼</div>
    		<div class="col-xs-6 col-sm-3">2번째 컬럼</div>
    		<div class="col-xs-6 col-sm-3">3번째 컬럼</div>
    		<div class="col-xs-6 col-sm-3">4번째 컬럼</div>
    	</div>
    	<h2>clearfix와 반응형 유티리티 조합 전</h2>
    	<div class="row">
    		<div class="col-xs-6 col-sm-3">1번째 컬럼..col-xs-6 .col-sm-3
Resize your viewport or check it out on your phone for an example.</div>
    		<div class="col-xs-6 col-sm-3">2번째 컬럼</div>
    		<div class="col-xs-6 col-sm-3">3번째 컬럼</div>
    		<div class="col-xs-6 col-sm-3">4번째 컬럼</div>
    	</div>
    	<h2>clearfix와 반응형 유티리티 조합 후</h2>
    	<div class="row">
    		<div class="col-xs-6 col-sm-3">1번째 컬럼..col-xs-6 .col-sm-3
Resize your viewport or check it out on your phone for an example.</div>
    		<div class="col-xs-6 col-sm-3">2번째 컬럼</div>
    		<!-- 
		  	
		  	아래 div는 xs모드일때만 나타난다(visible-xs-block때문에)
		  	아래 div는 컨텐츠를 표시하기위한 div가 아니라
		  	첫번째 컬럼의 내용이 많아서 xs모드가 될때 세번째 컬럼이
		  	첫번째 컬럼의 행으로 들어가는 현상이 발생한다
		  	이를 제거하기 위해서 clearfix 와 visible-xs-block를
		  	조합했다		  
		    -->
    		<!--  xs모들일때만 clearfix가 적용되도록  visible-xs-block추가-->
    		<div class="clearfix visible-xs-block"></div>
    		<div class="col-xs-6 col-sm-3">3번째 컬럼</div>
    		<div class="col-xs-6 col-sm-3">4번째 컬럼</div>
    	</div>
    	<h2>응용문제</h2>
    	<!-- 
			왼쪽에 4칸을 비우고(offset) 뒤에 8칸을 차지하는 div만들고
			위의 8칸짜리 div안에 컬럼 중첩을 사용해서
			4칸짜리 div 하나를 만들어라 단,그 4칸짜리가
			가운데 배치되도록 하여라
			md모드 적용하여라.
		-->
		<div class="row">
			<div class="col-md-offset-4 col-md-8">
				col-md-offset-4 col-md-8
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							col-md-4 col-md-offset-4
						</div>
					</div>
			</div>
		</div>
    </div>

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
  </body>
</html>