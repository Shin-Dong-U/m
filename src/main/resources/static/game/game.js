console.log("game Module.........");

var gameService=(function(){
	
	
	//유저 포인트 정보 가져오기
	function getCustPointSum(cust_id,callback){
			console.log("................getCustPointSum");
			
		$.ajax({ 
			type:'get',						
			url:'/game/info/'+cust_id,				
			data:JSON.stringify(),			
			contentType: "application/json; charset=utf-8",
			success:(gameInfo)=>{console.log("유저 게임 정보",gameInfo),
				callback(gameInfo)},	
			error:(log)=>{console.log("실패 "+log)}
		})
	}
	
	//아이템 사용
	function useItem(item_seq,cust_id,callback){
			console.log("................useItem");
			
		$.ajax({ 
			type:'get',						
			url:'/game/item/'+item_seq+'/'+cust_id,				
			data:JSON.stringify(),			
			contentType: "application/json; charset=utf-8",
			success:(result)=>{console.log("아이템 사용",result)},	
			error:(log)=>{console.log("실패 "+log)}
		})
	}
	
	
	return {
		getCustPointSum:getCustPointSum,
		useItem:useItem
	};
	
})()


