<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Delivery List Page</h1>

	<!-- 배송 리스트 -->
	<table class="table board">
		<thead>
		    <tr>
		      <th scope="col">송장번호</th>
		      <th scope="col">주문번호</th>
		      <th scope="col">배송상태</th>
		      <th scope="col">배송업체</th>
		      <th scope="col">등록일</th>
		      <th scope="col">등록자</th>
		      <th scope="col">수정일</th>
		      <th scope="col">수정자</th>
		      <th scope="col">발송자</th>
		      <th scope="col">발송자전화</th>
		      <th scope="col">발송자우편번호</th>
		      <th scope="col">발송자주소</th>
		      <th scope="col">발송자상세주소</th>
		      <th scope="col">수신인</th>
		      <th scope="col">수신번호</th>
		      <th scope="col">수신자우편번호</th>
		      <th scope="col">수신자주소</th>
		      <th scope="col">수신자상세주소</th>
		    </tr>
		  </thead>
			  <tbody class="allDeliveryList">
			  		    
			  </tbody>
			  
			  <tbody class="deliveryList">
			  		    
			  </tbody>
	
		</table>
	<!-- 배송 리스트 끝 -->

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/delivery/delivery.js?ver=2"></script> 

<script>
$(document).ready(function() {
	//showList1();
	//showList2();
	showList3();
	
	//전체 배송리스트
	function showList1(){		
		deliveryService.getallDeliveryList(function(allDeliveryList){
			var allDeliveryListTable=$(".allDeliveryList");
			var str="";
			for(var i=0,len=allDeliveryList.length||0;i<len;i++){
				console.log(allDeliveryList);
				str+="<tr>"
				
					+"	<th scope='row'>"+allDeliveryList[i].delivery_seq+"</th>"
					+"	<td><ul>"+allDeliveryList[i].invoice_no+"</ul></td>"
					+"	<td>"+allDeliveryList[i].order_seq+"</td>"
					+"	<td>"+allDeliveryList[i].delivery_status+"</td>"
					+"	<td>"+allDeliveryList[i].delivery_company+"</td>"
					+"	<td>"+deliveryService.displayTime(allDeliveryList[i].regDate)+"</td>"
					+"	<td>"+allDeliveryList[i].regUser+"</td>"
					+"	<td>"+allDeliveryList[i].editDate+"</td>"
					+"	<td>"+allDeliveryList[i].editUser+"</td>"
					+"	<td>"+allDeliveryList[i].sender_name+"</td>"
					+"	<td>"+allDeliveryList[i].sender_phone+"</td>"
					+"	<td>"+allDeliveryList[i].sender_addr_post+"</td>"
					+"	<td>"+allDeliveryList[i].sender_addr_city+"</td>"
					+"	<td>"+allDeliveryList[i].sender_addr_detail+"</td>"
					+"	<td>"+allDeliveryList[i].cust_name+"</td>"
					+"	<td>"+allDeliveryList[i].cust_phone+"</td>"
					+"	<td>"+allDeliveryList[i].cust_addr_post+"</td>"
					+"	<td>"+allDeliveryList[i].cust_addr_city+"</td>"
					+"	<td>"+allDeliveryList[i].cust_addr_detail+"</td>"
					+"</tr>"
					
			}
			allDeliveryListTable.html(str);
		})
}
	
	
	//특정송장번호의 배송 조회 
	function showList2(){		
		deliveryService.getdeliveryList(123123123,function(deliveryList){
			var deliveryListTable=$(".deliveryList");
			var str="";
			for(var i=0,len=deliveryList.length||0;i<len;i++){
				console.log(deliveryList);
				str+="<tr>"
					+"	<th scope='row'>"+deliveryList[i].invoice_no+"</th>"
					+"	<td><ul>"+deliveryList[i].order_seq+"</ul></td>"
					+"	<td>"+deliveryList[i].delivery_status+"</td>"
					+"	<td>"+deliveryList[i].delivery_company+"</td>"
					+"	<td>"+deliveryService.displayTime(deliveryList[i].regDate)+"</td>"
					+"	<td>"+deliveryList[i].regUser+"</td>"
					+"	<td>"+deliveryList[i].editDate+"</td>"
					+"	<td>"+deliveryList[i].editUser+"</td>"
					+"	<td>"+deliveryList[i].sender_name+"</td>"
					+"	<td>"+deliveryList[i].sender_phone+"</td>"
					+"	<td>"+deliveryList[i].sender_addr_post+"</td>"
					+"	<td>"+deliveryList[i].sender_addr_city+"</td>"
					+"	<td>"+deliveryList[i].sender_addr_detail+"</td>"
					+"	<td>"+deliveryList[i].cust_name+"</td>"
					+"	<td>"+deliveryList[i].cust_phone+"</td>"
					+"	<td>"+deliveryList[i].cust_addr_post+"</td>"
					+"	<td>"+deliveryList[i].cust_addr_city+"</td>"
					+"	<td>"+deliveryList[i].cust_addr_detail+"</td>"
					+"</tr>"

					
			}
			deliveryListTable.html(str);
		})
}
	
 	//배송조회(회원)
	function showList3(){		
		deliveryService.getmyDeliveryList('nana',function(myDeliveryList){
			var myDeliveryListTable=$(".myDeliveryList");
			var str="";
			for(var i=0,len=myDeliveryList.length||0;i<len;i++){
				console.log(myDeliveryList);
				str+="<tr>"
					+"	<th scope='row'>"+myDeliveryList[i].invoice_no+"</th>"
					+"	<td><ul>"+myDeliveryList[i].order_seq+"</ul></td>"
					+"	<td>"+myDeliveryList[i].delivery_status+"</td>"
					+"	<td>"+myDeliveryList[i].delivery_company+"</td>"
					+"	<td>"+myDeliveryList.displayTime(myDeliveryList[i].regDate)+"</td>"
					+"	<td>"+myDeliveryList[i].regUser+"</td>"
					+"	<td>"+myDeliveryList[i].editDate+"</td>"
					+"	<td>"+myDeliveryList[i].editUser+"</td>"
					+"	<td>"+myDeliveryList[i].sender_name+"</td>"
					+"	<td>"+myDeliveryList[i].sender_phone+"</td>"
					+"	<td>"+myDeliveryList[i].sender_addr_post+"</td>"
					+"	<td>"+myDeliveryList[i].sender_addr_city+"</td>"
					+"	<td>"+myDeliveryList[i].sender_addr_detail+"</td>"
					+"	<td>"+myDeliveryList[i].cust_name+"</td>"
					+"	<td>"+myDeliveryList[i].cust_phone+"</td>"
					+"	<td>"+myDeliveryList[i].cust_addr_post+"</td>"
					+"	<td>"+myDeliveryList[i].cust_addr_city+"</td>"
					+"	<td>"+myDeliveryList[i].cust_addr_detail+"</td>"
					+"</tr>"

					
			}
			myDeliveryListTable.html(str);
		})
}
	
	
	
	
	
	
	
		function displayTime(timeValue){
		var today = new Date();
		
		var gap = today.getTime() - timeValue;
		
		var dateObj = new Date(timeValue);
		var str="";
		
		if(gap<(1000*60*60*24)) {
			
			var yy= dateObj.getFullYear();
			var mm= dateObj.getMonth()+1; //getMonth() is zero-based
			var dd= dateObj.getDate();
			
			return[yy, '/', (mm>9 ? '':'0')+mm, '/',
					(dd>9 ? '':'0')+dd].join('');				
		}		
	};
	
	return {
	
		getallDeliveryList:getallDeliveryList,
		getdeliveryList:getdeliveryList,
		getmyDeliveryList:getmyDeliveryList,
		displayTime:displayTime
	};
	
}); 
	
	
</script>
</html>