var checkoutService=(function(){
	
	
	//장바구니 상품 주문하기
	function addOrderBasket(cust_id,total_price,csrf,callback){
			
		$.ajax({ //자바스크립트 객체 시작
			type:'get',						//전송유형
			url:'/checkout/content/'+cust_id+'/'+total_price,		//컨트롤러 메소드 호출 URL
			data:JSON.stringify(),			//data키에 설정되는 값은 컨트롤러 메소드의 consumes속성 설정 값의 데이터 유형과 일치
			contentType: "application/json; charset=utf-8", //서버에게 보내는 데이터 유형(MIME타입)
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrf.csrfHeaderName, csrf.csrfTokenValue);
			},
			success:(result)=>{
				callback(result)
				,location.href = "/orders/order/checkout?order_seq="+result.order_seq;
					},	
			error:(log)=>{console.log("실패 "+log)}
		})
	}
	
	//상품 바로 주문하기
	function orderNow(orderinfo,csrf){
		
		$.ajax({ 
			type:'post',						
			url:'/checkout/now/',		
			data:JSON.stringify(orderinfo),			
			contentType: "application/json; charset=utf-8", 
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrf.csrfHeaderName, csrf.csrfTokenValue);
			},
			success:(order_seq)=>{location.href = "/orders/order/checkout?order_seq="+order_seq;
					},	
			error:(log)=>{console.log("실패 "+log)}
		})
	}
	
	
	//배송정보 가져오기
	function getShipInfo(cust_id,order_seq,callback){
		
		
	$.ajax({
		type:'get',					
		url:'/checkout/address/'+cust_id+'/'+order_seq,				
		data:JSON.stringify(),			
		contentType: "application/json; charset=utf-8", 
		success:(addressInfo)=>{
			callback(addressInfo)},	
		error:(log)=>{console.log("실패 "+log)}
		})
	}
	
	//주문정보리스트 가져오기
	function getOrderList(cust_id,callback){
		
	$.ajax({ 
		type:'get',						
		url:'/checkout/orderedlist/'+cust_id,
		data:JSON.stringify(),			
		contentType: "application/json; charset=utf-8", 
		success:(orderList)=>{
			callback(orderList)},	
		error:(log)=>{console.log("실패 "+log)}
		})
	}	
	
	//주문정보 업체 리스트 가져오기
	function getOrderAllList(callback){
		
	$.ajax({ 
		type:'get',						
		url:'/checkout/orderedlist',
		data:JSON.stringify(),			
		contentType: "application/json; charset=utf-8", 
		success:(orderList)=>{
			callback(orderList)},	
		error:(log)=>{console.log("실패 "+log)}
		})
	}	
	
	//주문상세정보리스트 가져오기
	function getOrderedDetail(cust_id,callback){
		
		
	$.ajax({ 
		type:'get',						
		url:'/checkout/paidlist/'+cust_id,
		data:JSON.stringify(),			
		contentType: "application/json; charset=utf-8", 
		success:(orderList)=>{
			callback(orderList)},	
		error:(log)=>{console.log("실패 "+log)}
		})
	}	
	
	//배송정보 입력
	function insertShipInfo(addressInfo,csrf){
	
	$.ajax({ //자바스크립트 객체 시작
		type:'post',	
		url:'/ship/new/',
		data:JSON.stringify(addressInfo),
		contentType: "application/json; charset=utf-8",
		beforeSend:function(xhr){
			xhr.setRequestHeader(csrf.csrfHeaderName, csrf.csrfTokenValue);
		},
		
		error:(log)=>{console.log("실패 "+log)}
		})
	}
	
	//배송정보 확인
	function getShipStatus(order_seq,callback){
			
	$.ajax({ 
		type:'get',	
		url:'/ship/user/'+order_seq,
		data:JSON.stringify(),
		contentType: "application/json; charset=utf-8",
		success:(shipStatus)=>{
			callback(shipStatus)},	
		error:(log)=>{console.log("실패 "+log)}
		})
	}
	
	//주문 취소
	function orderCancel(order_seq,csrf,callback){
		
	$.ajax({ 
		type:'post',	
		url:'/checkout/cancel/'+order_seq,
		data:JSON.stringify(),
		contentType: "application/json; charset=utf-8",
		beforeSend:function(xhr){
			xhr.setRequestHeader(csrf.csrfHeaderName, csrf.csrfTokenValue);
		},
		success:(result)=>{
			location.href = "/cust/my-account"},	
		error:(log)=>{console.log("실패 "+log)}
		})
	}
	
	//주문 확정 마일리지 적립
	function orderCommit(order_seq,point,cust_id,csrf){
	
		$.ajax({ 
			type:'PATCH',	
			url:'/checkout/commit/'+order_seq+'/'+point+'/'+cust_id,
			data:JSON.stringify(),
			contentType: "application/json; charset=utf-8",
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrf.csrfHeaderName, csrf.csrfTokenValue);
			},
			success:(result)=>{
				location.href = "/cust/my-account"},	
			error:(log)=>{console.log("실패 "+log)}
			})
	}
		
	//송장번호 입력 
	function insertShipInfoCom(shipInfo,csrf){
	

		$.ajax({ 
			type:'PATCH',	
			url:'/ship/company/info',
			data:JSON.stringify(shipInfo),
			contentType: "application/json; charset=utf-8",
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrf.csrfHeaderName, csrf.csrfTokenValue);
			},
			success:(result)=>{
				location.href = "/cust/my-account"},	
			error:(log)=>{console.log("실패 "+log)}
			})		
			
	}

	
	return {
		addOrderBasket:addOrderBasket,
		getOrderList:getOrderList,
		getOrderedDetail:getOrderedDetail,
		getShipInfo:getShipInfo,
		insertShipInfo:insertShipInfo,
		getShipStatus:getShipStatus,
		orderCancel:orderCancel,
		orderCommit:orderCommit,
		insertShipInfoCom:insertShipInfoCom,
		orderNow:orderNow,
		getOrderAllList:getOrderAllList
	};
	
})()


