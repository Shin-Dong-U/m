console.log("delivery Module.........");



var deliveryService=(function(){
	
	
	//전체 배송리스트
	function getallDeliveryList(callback){
		console.log("allDeliveryList................");
		
		$.ajax({ 
			type:'get',					
			url:'/delivery/list3/allDeliveryList',	
			data:JSON.stringify(),			
			contentType: "application/json; charset=utf-8", 
			success:(allDeliveryList)=>{console.log("전체 배송리스트",allDeliveryList),
				callback(allDeliveryList)},
			error:(log)=>{console.log("실패 "+log)}
		})
	}

	
	//특정송장번호의 배송 조회 
	function getdeliveryList(invoice_no,callback){
			console.log("delivery List................");
			
		$.ajax({ 
			type:'get',					
			url:'/delivery/list1/'+invoice_no,	
			data:JSON.stringify(),			
			contentType: "application/json; charset=utf-8", 
			success:(deliveryList)=>{console.log("배송 리스트",deliveryList),
				callback(deliveryList)},
			error:(log)=>{console.log("실패 "+log)}
		})
	}


    //결제완료된(3) 주문 리스트(업체)
	function getPaidGoodsList(callback){
			console.log("PaidGoods List................");
			
		$.ajax({ 
			type:'get',					
			url:'/delivery/list4/paid',	
			data:JSON.stringify(),			
			contentType: "application/json; charset=utf-8", 
			success:(paidGoodsList)=>{console.log("결제된 주문리스트",paidGoodsList),
				callback(paidGoodsList)},
			error:(log)=>{console.log("실패 "+log)}
		})
	}
	

	//배송조회(회원)	
	function getmyDeliveryList(cust_id,callback){
		console.log("myDeliveryList................");
		
	$.ajax({ 
		type:'get',					
		url:'/delivery/list2/'+cust_id,	
		data:JSON.stringify(),			
		contentType: "application/json; charset=utf-8", 
		success:(myDeliveryList)=>{console.log("나의 배송리스트",myDeliveryList),
			callback(myDeliveryList)},
		error:(log)=>{console.log("실패 "+log)}
	})
}
	
	
	
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
	
		getallDeliveryList:getallDeliveryList,
		getdeliveryList:getdeliveryList,
		getPaidGoodsList:getPaidGoodsList,
		getmyDeliveryList:getmyDeliveryList,
		displayTime:displayTime
	};
	
})();
