console.log("Game Module.........");

var gameService = (function(){
	
	
	
	//1. 고객게임상태 정보불러오기
	function getCustStatus(memberId,callback){
		console.log("gameCust List.............");
		//alert("받아온객체"+custStatus);
		//cust_id :처리할 값
		//callback:성공시 처리되는 함수
		//error   :실패시 처리되는함수
		
		$.ajax({ //자바스크립트 객체 시작
			type:'get',	//전송유형:post방식
			url:'/game/list/'+ memberId, //컨트롤러 메소드 호출URL
			data : JSON.stringify(), //JSON.stringify()자바스크립트 객체를 JSON형식의 문자열로 변환해주는 웹브라우저 내부 메소드,//data키에 설정되는 값은 컨트롤러 메소드의 consumes속성 설정 값의 데이터 유형과 일치
			contentType:"application/json; charset=utf-8",//브라우저가 서버에게 보내는 데이터유형(MIME타입)
			//success:(custStatus)=>{console.log("고객상태정보js단",custStatus,
			//		callback(custStatus))}
			success:(custStatus)=>{console.log("고객상태정보js단",custStatus),
					callback(custStatus)}
			,
			error:(log)=>{console.log("실패"+log)}
		})
	}
	//2. <재활용>아이템 ex.물,비료,씨앗에 대한 아이템 불러오기
	function getItem(item_seq,callback){
		console.log("getItem..........");
		
		$.ajax({
			type:'get',
			url:'/game/'+item_seq, //GameRestController의 매칭되는 Maping url과 맞는지 체크(내가지정)
			data : JSON.stringify(),
			contentType:"application/json; charset=utf-8",
			
			success:(gameItems)=>{console.log("아이템정보js단",gameItems),
					callback(gameItems)}
			,
			error:(log)=>{console.log("실패"+log)}
		})
		
	}
/* 	
	//3. 아이템선택버튼 클릭 -> 마일리지 히스토리에 저장()
	function updateWater(memberid){
		console.log("clickTtem nana에대한 insert.........");
		
		$.ajax({
			type:'post',
			url:'/game/'+memberid,
			data: JSON.stringify(memberid),
			contentType:"application/json; charset=utf-8",
			
			//success:(result)=>{console.log("마일리지가 차감, 상태바 변환결과 ",result)}
			success:(result)=>{console.log("custid, seq..등록",result)}
			,
			error:(log)=>{console.log("실패"+log)}
		});
	}
*/	
	//3-1,3-2
	//아이템 물 -> 마일리지가 차감 / 나무 체크,변화 / 상태바 체크, 변화 
	//function clickItem(myMil,myTree,bar_status){
	function clickItem(memberid){
		console.log("clickItem...........");
		
		$.ajax({
			type:'post', //get:조회
			url:'/game/'+memberid,//마일리지,나무,상태바
			data: JSON.stringify(),
			contentType:"application/json; charset=utf-8",
			
			success:(result)=>{console.log("마일리지가 차감 / 나무 체크,변화 / 상태바 체크, 변화 결과",result)}
			,
			error:(log)=>{console.log("실패"+log)}
		})
	}
	
	//4-1,4-2
	//아이템 비료 -> 마일리지가 차감 / 나무 체크,변화 / 상태바 체크, 변화 
	//function clickItem(myMil,myTree,bar_status){
	function clickItemCompost(memberid){
		console.log("clickItemCompost...........");
		
		$.ajax({
			type:'post', //get:조회
			url:'/game/compost/'+memberid,//마일리지,나무,상태바
			data: JSON.stringify(),
			contentType:"application/json; charset=utf-8",
			
			success:(result)=>{console.log("마일리지가 차감 / 나무 체크,변화 / 상태바 체크, 변화 결과",result)}
			,
			error:(log)=>{console.log("실패"+log)}
		})
	}
	
	
	//5-1,5-2
	//아이템 씨앗 -> 마일리지가 차감 / 나무 체크,변화 / 상태바 체크, 변화 
	//function clickItem(myMil,myTree,bar_status){
	function clickItemSeed(memberid){
		console.log("clickItemSeed..........");
		
		$.ajax({
			type:'post',//get:조회
			url:'/game/seed/'+memberid,
			data: JSON.stringify(),
			contentType:"application/json; charset=utf-8",
			
			success:(result)=>{console.log("마일리지가 차감 / 나무 체크,변화 / 상태바 체크, 변화 결과",result)}
			,
			error:(log)=>{console.log("실패"+log)}
			
		})
	}
	
	
	
	
	//Cust의 (1)Tree레벨 /(2)Status_Bar 에 따른 GameImage불러오기
	function getLvlImage(mil_level,callback){
	console.log("showImage..........");
	
		$.ajax({
			type:'get',
			url:'/game/lvl/'+mil_level, //(1)Tree레벨 /(2)Status_Bar
			data : JSON.stringify(),
			contentType:"application/json; charset=utf-8",
			
			success:(gameLvl)=>{console.log("(1)Tree레벨 /(2)Status_Bar 2개 Image가져오기",gameLvl),
					callback(gameLvl)}
			,
			error:(log)=>{console.log("실패"+log)}
		})
		
	}

	
	return {
		
		getCustStatus:getCustStatus, //cust조회 - getCustStatus는 getCustStatus함수를 쓰는 이름이다! 
		getItem:getItem,
		clickItem:clickItem,
		updateWater:updateWater,
		clickItemCompost:clickItemCompost,
		clickItemSeed:clickItemSeed,
		getLvlImage:getLvlImage
	}; 
	
	
})();