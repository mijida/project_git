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
    <title>Dropdown.jsp</title>

    <!-- 부트스트랩 -->

    <link href="<c:url value="/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="container">
      <div class="page-header">
         <h1>Dropdown Example<small>서브제목</small></h1>
      </div>
      <h2>드랍다운 메뉴</h2>
      <div class="row">
      	<div class="col-xs-offset-1 col-md-offset-1 col-md-5">
      	<div class="dropdown">
			  <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			    드랍다운메뉴
			    <span class="glyphicon glyphicon-triangle-bottom"></span>
			  </button>
			  <ul class="dropdown-menu">
			    <li><a href="#">메뉴1</a></li>
			    <li><a href="#">메뉴2</a></li>
			    <li><a href="#">메뉴3</a></li>
			    <li><a href="#">메뉴4</a></li>
			  </ul>
			</div>
			<div class="dropup">
			  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-expanded="true">
			    Dropdown
			    <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
			  </ul>
			</div>
      	</div>
      </div>
      <h2>드랍업 메뉴</h2>
      <div class="row">
      	<div class="col-xs-offset-1 col-md-offset-1 col-md-5">
      	<div class="dropup">
			  <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			    드랍업 메뉴
			    <span class="glyphicon glyphicon-triangle-top"></span>
			  </button>
			  <ul class="dropdown-menu">
			    <li><a href="#">메뉴1</a></li>
			    <li><a href="#">메뉴2</a></li>
			    <li><a href="#">메뉴3</a></li>
			    <li><a href="#">메뉴4</a></li>
			  </ul>
			</div>
			<div class="dropup">
			  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-expanded="true">
			    Dropdown
			    <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
			  </ul>
			</div>
      	</div>
      </div>
      <h2>버튼 그룹</h2>
            <div class="row">
     			<div class="col-xs-offset-1 col-md-offset-1 col-md-4">
     				<div class="btn-group btn-group sm">
					  <button class="btn btn-default">첫번째 버튼</button>
					  <button class="btn btn-default">두번째버튼</button>
					  <button class="btn btn-default">세번째버튼</button>
					</div>
	      		</div>
     			<div class="col-xs-offset-1 col-md-offset-1 col-md-4">
     				<div class="btn-group btn-group sm">
					  <button class="btn btn-default">첫번째 버튼</button>
					  <button class="btn btn-default">두번째버튼</button>
					  <button class="btn btn-default">세번째버튼</button>
					</div>
	      		</div>
	    	</div>
	    	<h2>중첩하기</h2>
	    	 <div class="row">
     			<div class="col-xs-offset-1 col-md-offset-1 col-md-5">
     			    <div class="btn-group">
					  <button class="btn btn-default">메뉴1</button>
					  <button class="btn btn-default">메뉴2</button>
     			    	<div class="btn-group dropdown">
	    				  <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						    드랍다운메뉴
						    <span class="glyphicon glyphicon-triangle-bottom"></span>
						  </button>
						  <ul class="dropdown-menu">
						    <li><a href="#">메뉴1</a></li>
						    <li><a href="#">메뉴2</a></li>
						    <li><a href="#">메뉴3</a></li>
						    <li><a href="#">메뉴4</a></li>
						  </ul>
     			    	
     			    	</div>
					</div>
     			</div>
   			</div>
   			<h2>분할된 버튼 그룹</h2>
   		<div class="row">
     		<div class="col-xs-offset-1 col-md-offset-1 col-md-5">
   			<!-- Split button -->
				<div class="btn-group">
				  <button type="button" class="btn btn-danger">메뉴</button>
				  <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
				    <span class="caret"></span>
				  </button>
				  <ul class="dropdown-menu" role="menu">
				    <li><a href="#">서브메뉴1</a></li>
				    <li><a href="#">서브메뉴2</a></li>
				    <li><a href="#">서브메뉴3</a></li>
				    <li class="divider"></li>
				    <li><a href="#">서브메뉴4</a></li>
				  </ul>
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