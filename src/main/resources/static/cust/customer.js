//console.log("customer.ajax실행");


var customer=(function(){
	
	/* id 확인 */
	function idCheck(memberId, csrf, callback, error){	
		$.ajax({
			type:"get",
			url:"/cust/idCheck/"+memberId,
			contentType:"application/json; charset=UTF-8",
			
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrf.csrfHeaderName, csrf.csrfTokenValue);
			},
			
			success:function(data){
				callback(data);		
			},
			error:function(request,status,error){
       		}

		});	//end ajax
	}	//end function getCustLogin

	/* password 확인 */
	function passwordCheck(custVO, csrf, callback, error){
		
		$.ajax({
			type:"post",
			url:"/cust/pwCheck",
			data:JSON.stringify(custVO),
			contentType:"application/json; charset=UTF-8",
			
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrf.csrfHeaderName, csrf.csrfTokenValue);
			},
			
			success:function(data){
				callback(data);		
			},
			error:function(request,status,error){
       		}

		});	//end ajax
	}	//end function getCustLogin
	
	
	/* 회원가입 */
	function joinMember(memberVO, csrf, callback, error){
		//console.log("joinCust 실행");
		
		$.ajax({
			type:"post",
			url:"/cust/join",
			data:JSON.stringify(memberVO),
			contentType:"application/json; charset=UTF-8",
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrf.csrfHeaderName, csrf.csrfTokenValue);
			},
			success:function(data){
				callback(data);
				//console.log("restCust.ajax실행중 joinCust 완료: "+data);
			},
			
			error:function(xhr,status,err){
				error(err);
				//console.log("restCust.ajax실행중 joinCust 오류");
			}
		});	//end ajax
	}//end function joinCust
	
	
	/* 특정 회원 정보 가져오기 */
	function getCust(memberId, callback, error){
		$.ajax({
			type:"get",
			url:"/cust/get/"+memberId,
			
			success:function(data){
				if(callback){
					//console.log("restCust.ajax실행중 getCust 완료");
					//alert("data타입정의"+data["memberVO"]);
					callback(data["memberVO"]);
				}
			},
			
			error:function(xhr,status,err){
				//console.log("restCust.ajax실행중 getCustLogin 오류");
			}
		});	//end ajax
	}	//end function getCust
	
	
	/* 회원 수정 */
	function modifyMember(custVO, csrf, callback, error){
		//console.log("modifyMember 실행");
		
		$.ajax({
			type:"put",
			url:"/cust/modify",
			data:JSON.stringify(custVO),
			contentType:"application/json; charset=UTF-8",
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrf.csrfHeaderName, csrf.csrfTokenValue);
			},
			
			success:function(data){
				callback(data);
			},
			error:function(xhr,status,err){
				//console.log("restCust.ajax실행중 modifMember오류");
			}
		});	//end ajax
	}	//end function modifyMember
	
	
	/* 회원 탈퇴  */
	function deleteMember(memberId, csrf, callback, error){
		//console.log("modifyMember 실행");
		
		$.ajax({
			type:"put",
			url:"/cust/delete/"+memberId,
			data:JSON.stringify(memberId),
			contentType:"application/json; charset=UTF-8",
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrf.csrfHeaderName, csrf.csrfTokenValue);
			},
			
			success:function(data){
				callback(data);
				//console.log("restCust.ajax실행중 modifyMember완료");
			},
			error:function(xhr,status,err){
					//console.log("restCust.ajax실행중 modifMember오류")
			}
		});	//end ajax
	}	//end function modifyMember
	

	return{
		idCheck:idCheck,
		passwordCheck:passwordCheck,	//비밀번호확인
		joinMember:joinMember, 			//회원가입
		getCust:getCust,				//회원 정보 불러오기
		modifyMember:modifyMember,		//회원수정
		deleteMember:deleteMember		//회원탈퇴
	};
	
})();