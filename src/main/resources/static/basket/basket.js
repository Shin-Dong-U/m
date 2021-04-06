var basketService=(function(){
	
	
	function getBasketList(cust_id,callback){
			
			
		$.ajax({ //자바스크립트 객체 시작
			type:'get',						//전송유형
			url:'/basket/list/'+cust_id,		//컨트롤러 메소드 호출 URL
			//JSON.stringify()자바스크립트 객체를 JSON형식의 문자열로 변환해주는 웹브라우저 내부 메소드
			data:JSON.stringify(),			//data키에 설정되는 값은 컨트롤러 메소드의 consumes속성 설정 값의 데이터 유형과 일치
			contentType: "application/json; charset=utf-8", //서버에게 보내는 데이터 유형(MIME타입)
			success:(basketList)=>{
				callback(basketList)},	
			error:(log)=>{console.log("실패 "+log)}
		})
	}
	
	
	function getBasketGoods(goods_seq){		
			
			
		$.ajax({ 
			type:'get',						
			url:'/basket/'+goods_seq,					
			data:JSON.stringify(),			
			contentType: "application/json; charset=utf-8", 
			success:(basketGoods)=>{
				location.href = "/goods/"+goods_seq},
			error:(log)=>{console.log("실패 "+log)}
		})
	}
	
	
	function delBasketGoods(cust_id,goods_seq,csrf,callback){		
		
		
		$.ajax({ 
			type:'get',						
			url:'/basket/'+cust_id+'/'+goods_seq,					
			data:JSON.stringify(),			
			contentType: "application/json; charset=utf-8",
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrf.csrfHeaderName, csrf.csrfTokenValue);
			},
			success:(result)=>{callback()},
			error:(log)=>{console.log("실패 "+log)}
		
		})
	}
	
	function purGoodsAtBasket(csrf){		
		
		
		$.ajax({ 
			type:'get',						
			url:'/basket/pur/nana/6',					
			data:JSON.stringify(),			
			contentType: "application/json; charset=utf-8", 
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrf.csrfHeaderName, csrf.csrfTokenValue);
			},
			success:(result)=>{},
			error:(log)=>{console.log("실패 "+log)}
				
		})
	}
	
	function changeQtyAtBasket(cust_id,goods_seq,qty,callback){		
		
		
		$.ajax({ 
			type:'get',						
			url:'/basket/'+cust_id+'/'+goods_seq+'/'+qty,					
			data:JSON.stringify(),			
			contentType: "application/json; charset=utf-8", 
			
			success:(result)=>{},
			error:(log)=>{console.log("실패 "+log)}
			
		})
	}
	
	//장바구니에 상품넣기
	function addGoodsAtBasket(orderinfo,csrf,callback){		
		$.ajax({ 
			type:'post',						
			url:'/basket/new',					
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
	function countBasketGoods(cust_id,callback){		
		
		
		$.ajax({ 
			type:'get',						
			url:'/basket/count/'+cust_id,					
			data:JSON.stringify(),			
			contentType: "application/json; charset=utf-8", 
			success:(result)=>{
				callback(result)},
			error:(log)=>{console.log("실패 "+log)}
			
		})
	}
	
	
	
//날짜시간 표시형식 설정: 날짜시간 형식 지정(서버와 상관 없음)
//오늘 지금시간을 기준으로 하루를 넘어가면, 날짜가 표시, 하루가 지나지 않았으면, 시간으로 표시됩니다.
	function displayTime(timeValue){
		var today = new Date();
		
		var gap = today.getTime() - timeValue;
		
		var dateObj = new Date(timeValue);
		var str="";
		
		if(gap<(1000*60*60*24)) {
			
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [(hh>9 ?'':'0')+hh, ':', (mi>9 ? '':'0')+mi,
					':',(ss>9 ?'':'0')+ss ].join('');			
		}else{
			var yy= dateObj.getFullYear();
			var mm= dateObj.getMonth()+1; //getMonth() is zero-based
			var dd= dateObj.getDate();
			
			return[yy, '/', (mm>9 ? '':'0')+mm, '/',
					(dd>9 ? '':'0')+dd].join('');				
		}		
	};
	
	
	return {
		addGoodsAtBasket:addGoodsAtBasket,
		changeQtyAtBasket:changeQtyAtBasket,
		purGoodsAtBasket:purGoodsAtBasket,
		getBasketList:getBasketList,
		getBasketGoods:getBasketGoods,
		delBasketGoods:delBasketGoods,
		countBasketGoods:countBasketGoods,
		displayTime:displayTime
	};
	
})()


