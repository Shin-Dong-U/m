console.log("payments Module.........");

var paymentService=(function(){
	
	
	function paymentCheck(){
			console.log("payment................");
			
		$.ajax({ //자바스크립트 객체 시작
			type:'POST',						//전송유형
			url:'/orders/payments/complete',		//컨트롤러 메소드 호출 URL
			//JSON.stringify()자바스크립트 객체를 JSON형식의 문자열로 변환해주는 웹브라우저 내부 메소드
			data:JSON.stringify({
				imp_uid : "ho"
			}),			//data키에 설정되는 값은 컨트롤러 메소드의 consumes속성 설정 값의 데이터 유형과 일치
			contentType: "application/json; charset=utf-8", //서버에게 보내는 데이터 유형(MIME타입)
			success:()=>{console.log("장바구니 리스트",basketList),
				callback(basketList)},
/*			success:(basketList)=>{console.log("장바구니 리스트",basketList),
				callback(basketList)},*/	
			error:(log)=>{console.log("실패 "+log)}
		})
	}
	return {
			paymentCheck:paymentCheck
		
	};

})();


