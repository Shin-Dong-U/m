console.log("restCust.ajax실행");

var custRest=(function(){
	
	
	/* 로그인 id와 password 처리 */
	function getCustLogin(customer, callback, error){
		console.log("getCust 실행");
		
		$.ajax({
			type:"post",
			url:"/cust/login",
			data:JSON.stringify(customer),
			contentType:"application/json; charset=UTF-8",

			success:function(data){
				if(callback){console.log(data["custVO"]);
				console.log("restCust.ajax실행중 getCustLogin 오류");
				}
				
			},
			error:function(xhr,status,err){
				if(error){
					error(err);
					console.log("restCust.ajax실행중 getCustLogin 오류");
				}
			}
		});	//end ajax
	}	//end function getCustLogin
	
	/* 특정 회원 정보 가져오기 */
	function getCust(memberId, callback, error){
		$.ajax({
			type:"get",
			url:"/cust/get/"+memberId,
			//data:JSON.stringify(),
			//contentType:"text/html; charset=utf-8",
			success:function(data){
				console.log("data: "+data);
				if(callback){
					console.log(data);
					//alert("data타입정의"+data["memberVO"]);
					callback(data["memberVO"]);
					
					console.log("restCust.ajax실행중 getCust 완료");
				}
			},
			error:function(xhr,status,err){
				if(error){
					error(err);
					console.log("restCust.ajax실행중 getCustLogin 오류");
				}
			}
		});	//end ajax
	}	//end function getCust
	
	
	/* 회원가입 */
	function joinMember(member, callback, error){
		console.log("joinCust 실행");
		
		$.ajax({
			type:"put",
			url:"/cust/join",
			data:JSON.stringify(member),
			contentType:"application/json; charset=UTF-8",
			
			success:function(data){
				if(callback){
					console.log("restCust.ajax실행중 joinCust 완료: "+data);
					callback(data);
					
				}
			},
			error:function(xhr,status,err){
				if(error){
					error(err);
					console.log("restCust.ajax실행중 joinCust 오류");
				}
			}
		});	//end ajax
	}//end function joinCust
	
	
	/* 회원 수정 */
	function modifyMember(member, callback, error){
		console.log("modifyMember 실행");
		
		$.ajax({
			type:"put",
			url:"/cust/modify",
			data:JSON.stringify(member),
			contentType:"application/json; charset=UTF-8",
			
			success:function(data){
				if(callback){
					callback(data);
					console.log("restCust.ajax실행중 modifyMember완료: "+data);
				}
			},
			error:function(xhr,status,err){
				if(error){
					error(err);
					console.log("restCust.ajax실행중 modifMember오류")
				}
			}
		});	//end ajax
	}	//end function modifyMember
	
	
	/* 회원 탈퇴  */
	function deleteMember(memberId, callback, error){
		console.log("modifyMember 실행");
		
		$.ajax({
			type:"put",
			url:"/cust/delete/"+memberId,
			data:JSON.stringify(memberId),
			contentType:"application/json; charset=UTF-8",
			
			success:function(data){
				if(callback){
					callback(data);
					console.log("restCust.ajax실행중 modifyMember완료");
				}
			},
			error:function(xhr,status,err){
				if(error){
					error(err);
					console.log("restCust.ajax실행중 modifMember오류")
				}
			}
		});	//end ajax
	}	//end function modifyMember
	
	
	
	
	
	
	
	return{
		getCustLogin:getCustLogin,
		getCust:getCust,
		joinMember:joinMember,
		modifyMember:modifyMember,
		deleteMember:deleteMember
	};
	
})();