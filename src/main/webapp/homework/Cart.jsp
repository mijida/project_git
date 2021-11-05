<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart.jsp</title>
</head>
<body>
	<fieldset>
		<legend>웹스토리지를 이용한 장바구니 예제</legend>	

			<input type="checkbox" name="cart" value="P21001"/> 상품1 
			<input type="checkbox" name="cart" value="P21002"/> 상품2 
			<input type="checkbox" name="cart" value="P21003"/> 상품3 
			<input type="checkbox" name="cart" value="P21004"/> 상품4 
			<input type="checkbox" name="cart" value="P21005"/> 상품5 
			<input type="checkbox" name="cart" value="P21006"/> 상품6 
			<input type="checkbox" name="cart" value="P21007"/> 상품7 
			<input type="checkbox" name="cart" value="P21008"/> 상품8 
			<input type="checkbox" name="cart" value="P21009"/> 상품9 
			<input type="checkbox" name="cart" value="P21010"/> 상품10
				
	</fieldset>
	<hr/>
	<fieldset>
		<input type="button" onclick="addCart()" value="장바구니 담기" />	
		<input type="button" onclick="emptyCart()" value="장바구니 비우기" />
		<input type="button" onclick="cartList()" value="장바구니 보기" />	
	</fieldset>
	<ul>
	<!--장바구니 보기 버튼 클릭시 여기에 상품 목록을 뿌려줘라 -->
		<li id="result"></li>
	</ul>
	
	<script>
		var item = document.getElementsByName("cart");
		var resultText = document.getElementById("result");	
	   	console.log(item);

		//추가
		function addCart() {
			for(var i=0; i<item.length; i++) {
				if (item[i].checked)
					sessionStorage.setItem(item[i].value);
			}
		}//
		
		//보기
		function cartList(){
			resultText.innerHTML="";
			if(sessionStorage.length!=0){
			for(var i=0;i<sessionStorage.length; i++){
				var key = sessionStorage.key(i);
				if(key.substr(0,4)=="cart")
				resultText.innerHTML+=sessionStorage.getItem(key)+"<br/>";
				}	
			}	
		}//
		
		//비우기
		function emptyCart(){
			if(sessionStorage.length==0){
				alert("삭제할 상품이 없어요.");
				return;
			}
			sessionStorage.clear();
				alert("삭제 완료");							
		}//
		
		//보기
		function cartList(){
			resultText.value="";
			for(var i=0;i<cartItem.length; i++){
				var value = sessionStorage.getItem(cartItem[i].value);
				resultText.value+=value+"\r\n";
			}			
		}//
	</script>	

</body>
</html>