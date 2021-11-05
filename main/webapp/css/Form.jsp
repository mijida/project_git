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
    <title>Form.jsp</title>

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
    <!--
	모든 텍스트 기반의 <input>, <textarea> 그리고 <select> 요소
	.form-control 부여시 (부모영역 다 차지) ->form 하위요소에 다 넣어라
	기본적으로 width: 100%;
	최적의 여백을 위해 .form-group 으로 라벨과 콘트롤을 감싸자
	인라인 폼:입력 콘트롤이나 셀렉트 콘트롤은 부트스트랩에서 기본적으로 width: 100%;다.
	인라인 폼내에서  그것을 width: auto; 로 초기화했다
	
	수평 폼:그리드행 역할은 .form-group 한다(row와 같은 역할)
	
	체크박스나 라디오버튼 수평배치: 레이블에 checkbox-inline이나 radio-inline부여
	폼에서 텍스트를 넣고 싶을때는 <p> 에 .form-control-static(정적 컨트롤)
	
	폼컨트롤 크기 조정
	세로폭:input-*
	가로폭:col-*-* 그리드계열 클래스
	한꺼번에 적용할때는 form-group 클래스 위치에 form-group-*를 적용
	-->
    <div class="container">
      <div class="page-header">
         <h1>Form Example <small>폼 연습입니다</small></h1>
      </div>
      <h3>기본(Basic) 폼</h3>
      <div class="row">
      	<div class="col-md-offset-1 col-md-10">
      	<!-- 기본폼의 가로폭은 col-*-* 이 적용이 안됨 (폼의 하위 요소에 지정시)
		     div의 form-group과 함께 줄시에는 적용는 되나(부모인 div를 줄이니까) 레이아웃이 어긋난다
	 		 input-*은(세로폭) 적용됨(폼의 하위 요소에 직접 적용)
	 			    
	         ※폼요소와 그 요소의 설명 텍스트를 div로 감싸서 form-group 클래스 적용하자
	         또한 폼요소에는 form-control 클래스 지정
		     단,input type="file"에는 적용하면 어색하다
		-->
	      	<form>
			  <div class="form-group col-md-4" style="padding-left: 0" >
			    <label for="exampleInputEmail1">이메일 주소</label>
			    <!-- col-md-4:가로폭 조정하는 CLASS는 적용 안됨 -->
			    <input type="email" class="form-control input-lg" id="exampleInputEmail1" placeholder="이메일을 입력하세요">
			  </div>
			  <div class="clearfix"></div>
			  <div class="form-group col-md-4" style="padding-left: 0">
			    <label for="password">암호</label>
			    <input type="password" class="form-control" id="password" placeholder="암호">
			    <!-- id값: 텍스트 클릭시 id로 커서 가기 위한 효과 (레이아웃 영향은 없음) -->
			  </div>
			  <div class="clearfix"></div>
			  <div class="form-group">
			    <label>파일 업로드</label>
			    <!-- form-control 부여하지 않는다.(텍스트박스계열만 적용) -->
			    <input type="file" >
			    <p class="help-block">반드시 파일을 첨부하세요</p>
			  </div>
			  <!-- checkbox: form-group으로 감싸면 강조표시됨 -->
			  <div class="checkbox">
			    <label>
			      <input type="checkbox"> 입력을 기억합니다
			    </label>
			  </div>
			  <!-- form-group으로 감싸면 제출버튼 아래 15px 여백이 생긴다 -->
			  <div class="form-group">
			  <button type="submit" class="btn btn-default">제출</button>
			  </div>
			</form>
      	</div>
      </div><!-- row -->
      <!-- 인라인폼 width는 auto -->
      <h3>인라인 폼</h3>
      	<div class="row">
      		<div class="col-md-offset-1 col-md-10">
      			<form class="form-inline">
				  <div class="form-group">
				    <label >Name</label>
				    <input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe">
				  </div>
				  <div class="form-group">
				    <label >Email</label>
				    <input type="email" class="form-control" id="exampleInputEmail2" placeholder="jane.doe@example.com">
				  </div>
				  <div class="form-group">
				  <button type="submit" class="btn btn-default">Send invitation</button>
				  </div>
				</form>
      		</div>
      	</div>
      	<h3>수평 폼</h3>
      	<!--
			라벨들과 폼요소(콘트롤)들의 그룹들을 정렬하기 위해 부트스트랩의 미리 정의된
			그리드 클래스(col-*-*)들을 사용.
			그리드행(row) 역할은 .form-group 가 하기 때문에 .row 는 필요 없다
			
			레이블과 폼 요소에 col-*-*을 지정해야 수평폼이 완성된다
			미지정시 기본폼 배치가 된다		
		 -->
       	<div class="row">
      		<div class="col-md-offset-1 col-md-10">
      		<form class="form-horizontal">
				  <div class="form-group">
				  <!-- 레이블 수평폼에서 control-label필수: 안그러면 텍스트가 영역 맨왼쪽으로 -->
				    <label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
				    <div class="col-sm-4">
				      <input type="email" class="form-control" id="inputEmail3" placeholder="아이디">
				    </div>
				  </div>
				  <div class="form-group">
				  <!-- 레이블 수평폼에서 control-label필수: 안그러면 텍스트가 영역 맨왼쪽으로 -->
				    <label for="inputEmail3" class="col-sm-2 control-label">비밀번호</label>
				    <div class="col-sm-4">
				      <input type="password" class="form-control" placeholder="비밀번호">
				    </div>
				  </div>
  				  <div class="form-group">
				  <!-- 레이블 수평폼에서 control-label필수: 안그러면 텍스트가 영역 맨왼쪽으로 -->
				    <label class="col-sm-2 control-label">제목</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control">
				    </div>
				  </div>
   				  <div class="form-group">
				  <!-- 레이블 수평폼에서 control-label필수: 안그러면 텍스트가 영역 맨왼쪽으로 -->
				    <label class="col-sm-2 control-label">파일 업로드</label>
				    <div class="col-sm-8">
				      <input type="file">
				      <p class="help-block">이미지 파일만 업로드</p>
				    </div>
				  </div>
   				  <div class="form-group">
				  <!-- 레이블 수평폼에서 control-label필수: 안그러면 텍스트가 영역 맨왼쪽으로 -->
				    <label class="col-sm-2 control-label">관심사항</label>
				    <div class="col-sm-4">
				    <!-- 가로배치 -->
				    <!--  
				      <div class="checkbox">
				        <label><input type="checkbox">정치</label>
				        <label><input type="checkbox">경제</label>
				        <label><input type="checkbox">연예</label>				        
				    </div>
				    -->
				    <!-- 세로배치 -->
				      <div class="checkbox">
				        <label><input type="checkbox">정치</label>
				        </div>
				      <div class="checkbox">
				        <label><input type="checkbox">경제</label>
				        </div>
				      <div class="checkbox">
				        <label><input type="checkbox">연예</label>	
				        </div>			        				        				    
				  	</div>
			     </div> 
				    <div class="form-group">
				    <label class="col-sm-2 control-label">성별</label>
  				      <div class="radio">
				        <label><input type="radio">남자</label>
				        <label><input type="radio">여자</label>
				        <label><input type="radio">선택안함</label>				        
				    	</div>
				    </div>
			  <div class="form-group">
				  <!-- 레이블 수평폼에서 control-label필수: 안그러면 텍스트가 영역 맨왼쪽으로 -->
			    <label class="col-sm-2 control-label">학력</label>
				    <div class="col-sm-2">
					    <select class="form-control">
					 	  <option>학력을 선택하세요</option>
						  <option>1</option>
						  <option>2</option>
						  <option>3</option>
						  <option>4</option>
						  <option>5</option>
						</select>
					</div>
				</div>
			  <div class="form-group">
				  <!-- 레이블 수평폼에서 control-label필수: 안그러면 텍스트가 영역 맨왼쪽으로 -->
			    <label class="col-sm-2 control-label">자기소개</label>
				    <div class="col-sm-8">
					    <textarea rows="10" class="form-control"></textarea>
						    <div class="row">
						    	<div class="col-sm-8">
									<textarea rows="5" class="form-control"></textarea>							    	
						    	</div>
						    </div>
					</div>
				</div>
				   
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <div class="checkbox">
				        <label>
				          <input type="checkbox"> 아이디저장 체크
				        </label>
				      </div>
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="submit" class="btn btn-default">확인</button>
				    </div>
				  </div>
				</form>
      		</div>
   		</div>
	</div><!-- container -->

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
  </body>
</html>