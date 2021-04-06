var wishService=(function(){
	
	
	function getWishList(cust_id,callback){

		$.ajax({ //자바스크립트 객체 시작
			type:'get',						//전송유형
			url:'/wish/list/'+cust_id,		//컨트롤러 메소드 호출 URL
			//JSON.stringify()자바스크립트 객체를 JSON형식의 문자열로 변환해주는 웹브라우저 내부 메소드
			data:JSON.stringify(),			//data키에 설정되는 값은 컨트롤러 메소드의 consumes속성 설정 값의 데이터 유형과 일치
			contentType: "application/json; charset=utf-8", //서버에게 보내는 데이터 유형(MIME타입)
			success:(wishtList)=>{
				callback(wishtList)},	
			error:(log)=>{console.log("실패 "+log)}
		})
	}
	
	
//	function getBasketGoods(goods_seq){		
//			
//			
//		$.ajax({ 
//			type:'get',						
//			url:'/basket/'+goods_seq,					
//			data:JSON.stringify(),			
//			contentType: "application/json; charset=utf-8", 
//			success:(basketGoods)=>{
//				location.href = "/goods/"+goods_seq},
//			error:(log)=>{console.log("실패 "+log)}
//		})
//	}
//	
	
	function delWishGoods(cust_id,goods_seq,csrf,callback){		
		
		
		$.ajax({ 
			type:'get',						
			url:'/wish/'+cust_id+'/'+goods_seq,					
			data:JSON.stringify(),			
			contentType: "application/json; charset=utf-8",
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrf.csrfHeaderName, csrf.csrfTokenValue);
			},
			success:(result)=>{callback(), heartCnt(cust_id)},
			error:(log)=>{console.log("실패 "+log)}
		
		})
	}
	
	function purGoodsAtWish(csrf){		
		
		
		$.ajax({ 
			type:'get',						
			url:'/wish/pur/nana/6',					
			data:JSON.stringify(),			
			contentType: "application/json; charset=utf-8", 
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrf.csrfHeaderName, csrf.csrfTokenValue);
			},
			success:(result)=>{},
			error:(log)=>{console.log("실패 "+log)}
				
		})
	}
	
	function changeQtyAtWish(cust_id,goods_seq,qty,callback){		
		
		
		$.ajax({ 
			type:'get',						
			url:'/wish/'+cust_id+'/'+goods_seq+'/'+qty,					
			data:JSON.stringify(),			
			contentType: "application/json; charset=utf-8", 
			
			success:(result)=>{},
			error:(log)=>{console.log("실패 "+log)}
			
		})
	}
	
	//장바구니에 상품넣기
	function addGoodsAtWish(orderinfo,csrf,callback){		
		$.ajax({ 
			type:'post',						
			url:'/wish/new',					
			data:JSON.stringify(orderinfo),			
			contentType: "application/json; charset=utf-8", 
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrf.csrfHeaderName, csrf.csrfTokenValue);
			},
			success:(result)=>{callback(result)},
			error:(log)=>{console.log("실패 "+log)}
			
		})
	}
	
	//장바구니 상품 갯수
	function countWishGoods(cust_id,callback){		
		
		
		$.ajax({ 
			type:'get',						
			url:'/wish/count/'+cust_id,					
			data:JSON.stringify(),			
			contentType: "application/json; charset=utf-8", 
			success:(result)=>{
				callback(result)},
			error:(log)=>{console.log("실패 "+log)}
			
		})
	}
	
	
	

	
	return {
		getWishList:getWishList,
		delWishGoods:delWishGoods,
		purGoodsAtWish:purGoodsAtWish,
		changeQtyAtWish:changeQtyAtWish,
		addGoodsAtWish:addGoodsAtWish,
		countWishGoods:countWishGoods
		
	};
	
})()


