console.log("goodsDetail Module.........");

var goodsDetailService=(function(){
	
	
	//상품상세 조회데이터 Get
	function getGoodsDetailInfo(goods_seq,callback){
			console.log("................getGoodsDetailInfo");
		$.ajax({ //자바스크립트 객체 시작
			type:'get',						//전송유형
			url:'/goods/info/'+goods_seq,	//컨트롤러 메소드 호출 URL
			data:JSON.stringify(),			//data키에 설정되는 값은 컨트롤러 메소드의 consumes속성 설정 값의 데이터 유형과 일치
			contentType: "application/json; charset=utf-8", //서버에게 보내는 데이터 유형(MIME타입)
			success:(result)=>{console.log("상품상세 정보",result),
				callback(result)},	
			error:(log)=>{console.log("실패 "+log)}
		})
	}
	
	 //1.기존댓글정보가져오기 2. 댓글 insert 3.페이징처리
	function replyGoodsComment(goodsSeq,start,callback){
		console.log("..............replyGoodsComment");
		$.ajax({//자바스크립트 객체 시작
		 type:'get',
		  url:'/goods/reply/'+goodsSeq+'/'+start,
		 data:JSON.stringify(),
	     contentType: "application/json; chaset",
		 success:(result)=>{console.log("댓글정보:",result),
			callback(result)},
		 error:(log)=>{console.log("실패"+log)}	
		})
	}
	
	return {
		getGoodsDetailInfo:getGoodsDetailInfo,
		replyGoodsComment:replyGoodsComment
	};
	
})()


