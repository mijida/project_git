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
    <title>Table.jsp</title>

    <!-- 부트스트랩 -->

    <link href="<c:url value="/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- 두번째 테이블의 테이블 헤더의 세로폭 설정 및 텍스트 수직으로 가운데 설정 -->
    <style>
    .table .table-bordered .table-striped tr:nth-child(1){
       height: 50px;
    }
     .table .table-bordered .table-striped tr:nth-child(1) th{
       vertical-align: middle;
    }
    </style>
  </head>
  <body>
   <div class="container">
      <div class="page-header">
         <h1>Table Example<small>테이블 연습입니다</small></h1>
      </div>
      <div class="row">
         <div class="col-md-offest-1 col-md-5">
         <table class="table table-bordered table-hover">
            <tr>
                <th class="text-center">번호</th><!-- 부트스트랩에 기능때문에 tr에 class="text-center"줘도 가운데 정렬x th에 각각 넣어줘야함 -->
                <th class="text-center">제목</th>
                <th class="text-center">작성자</th>
                <th class="text-center">조회수</th>                   
             </tr>
                <tr>
                   <td class="text-center">1</td>
                   <td>제목1</td>
                   <td>작성자1</td>
                   <td>20</td>
                </tr>
                <tr>
                   <td class="text-center">2</td>
                   <td>제목2</td>
                   <td>작성자2</td>
                   <td>20</td>
                </tr>
                <tr>
                   <td class="text-center">3</td>
                   <td>제목3</td>
                   <td>작성자3</td>
                   <td>20</td>
                </tr>
                <tr>
                   <td class="text-center">4</td>
                   <td>제목4</td>
                   <td>작성자4</td>
                   <td>20</td>
                </tr>
         </table>
         </div>
         <div class="col-md-offest-1 col-md-5">
         <table class="table table-bordered table-striped"> <!-- table-condensed 컨텍츠크기를 맞게 압축 -->
            <!-- 테이블의 컬럼폭은 col-*-*계열로 설정 --><!-- 즉 안에가 col5지만 안에는 다시 12로 생각해서 분할해서 적용해주기 -->
            <tr>
                <th class="text-center col-md-2" >번호</th><!-- 부트스트랩에 기능때문에 tr에 class="text-center"줘도 가운데 정렬x th에 각각 넣어줘야함 -->
                <th class="text-center">제목</th>
                <th class="text-center col-md-3">작성자</th>
                <th class="text-center col-md-2" >조회수</th>                   
             </tr>
                <tr>
                   <td class="text-center">1</td>
                   <td>제목1</td>
                   <td>작성자1</td>
                   <td>20</td>
                </tr>
                <tr>
                   <td class="text-center">2</td>
                   <td>제목2</td>
                   <td>작성자2</td>
                   <td>20</td>
                </tr>
                <tr>
                   <td class="text-center">3</td>
                   <td>제목3</td>
                   <td>작성자3</td>
                   <td>20</td>
                </tr>
                <tr>
                   <td class="text-center">4</td>
                   <td>제목4</td>
                   <td>작성자4</td>
                   <td>20</td>
                </tr>
         </table>
         </div>
      </div><!-- row -->
      <div class="row">
         <div class="col-md-12">
           <!-- <div class="table-responsive"> --> <!-- 반응형 테이블 만들기 위한 div -->
            <!-- 제목컬럼에 내용 많이 넣으면 모바일크기로 줄였을때 수평스크롤바 생성됨 -->
            <!-- 제목 내용 한줄로 표현됨. 단 반응형 테이블 미적용시에는 스크롤바가 안생기지만 제목의 내용들이 줄바꿈된다 -->
               <table class="table table-bordered table-hover">
               <tr>
                   <th class="text-center col-md-1">번호</th><!-- 부트스트랩에 기능때문에 tr에 class="text-center"줘도 가운데 정렬x th에 각각 넣어줘야함 -->
                   <th class="text-center">제목</th><!-- responsive-칼럼 6개이상 =>반응형테이블 =>수평스크롤바가 생긴다 -->
                   <th class="text-center col-md-2">작성자</th>
                   <th class="text-center col-md-2">작성일</th>
                   <th class="text-center col-md-1">좋아요</th>
                   <th class="text-center col-md-1">조회수</th>                   
                </tr>
                   <tr>
                      <td class="text-center">1</td>
                      <td>제목1</td>
                      <td>작성자1</td>
                      <td>2021-11-05</td>
                      <td>30</td>
                      <td>20</td>
                   </tr>
                   <tr>
                      <td class="text-center">2</td>
                      <td>제목2</td>
                      <td>작성자2</td>
                      <td>2021-11-05</td>
                      <td>30</td>
                      <td>20</td>
                   </tr>
                   <tr>
                      <td class="text-center">3</td>
                      <td>제목3</td>
                      <td>작성자3</td>
                      <td>2021-11-05</td>
                      <td>30</td>
                      <td>20</td>
                   </tr>
                   <tr>
                      <td class="text-center">4</td>
                      <td>제목4</td>
                      <td>작성자4</td>
                      <td>2021-11-05</td>
                      <td>30</td>
                      <td>20</td>
                   </tr>
            </table>
            </div>
      <!-- </div> -->  
      </div>
   </div><!-- container -->


    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
  </body>
</html>