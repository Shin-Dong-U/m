<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>myDeliveryList</h1>

	<!-- 결제된 주문리스트 -->
	<table class="table board">
		<thead>
		    <tr>
		      <th scope="col">상품번호</th>
		      <th scope="col">업체번호</th>
		      <th scope="col">상품명</th>
		      <th scope="col">상품설명</th>
		      <th scope="col">가격</th>
		      <th scope="col">갯수</th>
		      <th scope="col">재원</th>
		      <th scope="col">카테고리</th>
		      <th scope="col">환경지수</th>
		      <th scope="col">등록일</th>
		      <th scope="col">등록자</th>
		      <th scope="col">수정자</th>
		      <th scope="col">수정일</th>
		      <th scope="col">유해요소포함여부</th>
		      <th scope="col">판매여부</th>
		    </tr>
		  </thead>
			  <tbody class="PaidGoodsList">
			  		    
			  </tbody>
	
		</table>
	<!--결제된 주문리스트 끝 -->

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/delivery/delivery.js?ver=1"></script> 

<script>
$(document).ready(function() {
	showList();
	
	//selectPaidGoodsList();

	
	//결제된 주문리스트
/* 	function selectPaidGoodsList() {
		deliveryService.getPaidGoodsList(function(){}) */
	
	
	//결제된 주문리스트
		function showList(){		
			deliveryService.getPaidGoodsList(function(PaidGoodsList){
				var PaidGoodsListTable=$(".PaidGoodsList");
				var str="";
		    	for(var i=0,len=PaidGoodsList.length||0;i<len;i++){
					console.log(PaidGoodsList);
					str+="<tr>"
						+"	<th scope='row'>"+PaidGoodsList[i].goods_seq+"</th>"
						+"	<td><ul>"+PaidGoodsList[i].comp_seq+"</ul></td>"
						+"	<td>"+PaidGoodsList[i].goods_name+"</td>"
						+"	<td>"+PaidGoodsList[i].goods_detail+"</td>"
						+"	<td>"+PaidGoodsList[i].price+"</td>"
						+"	<td>"+PaidGoodsList[i].qty+"</td>"
		   				+"	<td>"+PaidGoodsList[i].material+"</td>"
						+"	<td>"+PaidGoodsList[i].category+"</td>"
						+"	<td>"+PaidGoodsList[i].eco_score+"</td>"
						+"	<td>"+PaidGoodsList[i].regdate+"</td>"
						+"	<td>"+PaidGoodsList[i].reguser+"</td>"
						+"	<td>"+PaidGoodsList[i].edituser+"</td>"
						+"	<td>"+PaidGoodsList[i].editdate+"</td>"
						+"	<td>"+PaidGoodsList[i].danger_yn+"</td>"
						+"	<td>"+PaidGoodsList[i].sale_yn+"</td>"
						+"</tr>"
						
				}
				PaidGoodsListTable.html(str);
			});
		}
});	
</script>
</html>