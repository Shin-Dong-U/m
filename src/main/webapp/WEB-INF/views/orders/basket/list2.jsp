<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

</head>
<body>
<h1> kakaoPay api 이용하기 </h1>
 
<form method="post" action="/kakaoPay">
    <button>카카오페이로 결제하기</button>
</form>

	<h1>Basket List Page</h1>
	
	<!--장바구니 목록  -->
	<table class="table board">
		  <thead>
		    <tr>
		      <th scope="col">상품번호</th>
		      <th scope="col">수량</th>
		      <th scope="col">구매유무</th>
		      <th scope="col">삭제유무</th>
		      <th scope="col">등록일</th>
		      <th scope="col">등록자</th>
		      <th scope="col">수정일</th>
		      <th scope="col">수정자</th>
		      <th scope="col"><input type="checkbox">선택</th>
		    </tr>
		  </thead>
		
			  <tbody class="basketList">
			  		    
			  </tbody>
	
		</table>
		<!--장바구니 목록  끝-->
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<script src="/resources/basket/basket.js?ver=4"></script>
<script src="/resources/basket/transferTime.js"></script>

<script>
$(document).ready(function(){
	showList();
	//selectBasketGoods();
	//delBasketGoods();
	//purGoodsAtBasket();
	//changeQtyAtBasket();
	//addGoodsAtBasket();
	
	//선택상품 장바구니에 담기
	function addGoodsAtBasket(){
		basketService.addGoodsAtBasket(function(){})
	}
	
	//장바구니 수량변경
	function changeQtyAtBasket(){
		basketService.changeQtyAtBasket(function(){})
	}
	
	
	//장바구니에 구매된 상품 삭제
	function purGoodsAtBasket(){
		basketService.purGoodsAtBasket(function(result){})
	}
	
	//장바구니에서 상품 삭제
	function delBasketGoods(){
		basketService.delBasketGoods(function(result){})
	}
	
	//장바구니에서 특정상품 선택
	function selectBasketGoods(){
		basketService.getBasketGoods(function(){})
	}
	
	//장바구니 리스트 보기
	function showList(){		
		basketService.getBasketList("basic",function(basketList){
			var basketListTable=$(".basketList");
			var str="";
			for(var i=0,len=basketList.length||0;i<len;i++){
				console.log(basketList);
				str+="<tr>"
					+"	<th scope='row'>"+basketList[i].goods_seq+"</th>"
					+"	<td><ul>"+basketList[i].qty+"</ul></td>"
					+"	<td>"+basketList[i].purchase_YN+"</td>"
					+"	<td>"+basketList[i].delete_YN+"</td>"
					+"	<td>"+trnasferTime.displayTime(basketList[i].regDate)+"</td>"
					+"	<td>"+basketList[i].regUser+"</td>"
					+"	<td>"+basketList[i].editDate+"</td>"
					+"	<td>"+basketList[i].editUser+"</td>"
					+"  <td><input type='button' class='basketDelBtn"+[i]+"' value='취소'></td>"
					+"</tr>"
//					+"  <td><input type='checkbox'  checked></td>"
					
			}
			basketListTable.html(str);
		})
	}
	
	
	


	
	
});
</script>
</html>