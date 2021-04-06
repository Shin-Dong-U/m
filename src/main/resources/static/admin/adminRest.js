//console.log("adminRest.js 실행");

var adminRest=(function(){

	/* 모든 일반 사용자 정보 가져오기 */
	function getCustList(cust, callback, error){
		//console.log("getCustList 실행");
		
		$.ajax({
			type:"get",
			url:"/admin/getCust/"+cust,
			//data:JSON.Stringfy(),
			contentType:"application/json; charset=UTF-8",
			
			success:function(data){
				//console.log("data: "+data);
				if(callback){
					callback(data);
					//console.log("adminRest.ajax실행중 getCustList 성공");
				}
			},
			error:function(xhr,status,err){
				if(error){
					error(err);
					//console.log("adminRest.ajax실행중 getCustList 오류");
				}
			}
		});	//end ajax
	}	//end function getCustLogin


	/* 모든 업체 정보 가져오기 */
	function getCompanyList(company, callback, error){
		//console.log("getCustList 실행");
		
		$.ajax({
			type:"get",
			url:"/admin/getCompany/"+company,
			//data:JSON.Stringfy(),
			contentType:"application/json; charset=UTF-8",
			
			success:function(data){
				//console.log("data: "+data);
				if(callback){
					callback(data);
					//console.log("adminRest.ajax실행중 getCompanyList 성공");
				}
			},
			error:function(xhr,status,err){
				if(error){
					error(err);
					//console.log("adminRest.ajax실행중 getCompanyList 오류");
				}
			}
		});	//end ajax
	}	//end function getCustLogin


	/* 일반 모든 관리자 정보 가져오기 */
	function getAdminList(admin, callback, error){
		//console.log("getCustList 실행");
		
		$.ajax({
			type:"get",
			url:"/admin/getAdmin/"+admin,
			//data:JSON.Stringfy(),
			contentType:"application/json; charset=UTF-8",
			
			success:function(data){
				////console.log("data: "+data);
				//alert("data: "+data[0].custVO.memberId);
				callback(data);
				//console.log("adminRest.ajax실행중 getAdminList 성공");
			},
			error:function(xhr,status,err){
				if(error){
					error(err);
					//console.log("adminRest.ajax실행중 getAdminList 오류");
				}
			}
		});	//end ajax
	}	//end function getCustLogin
	
	
	/* 특정 회원 정보 가져오기 */
	function getCust(memberId, callback, error){
		$.ajax({
			type:"get",
			url:"/cust/get/"+memberId,

			success:function(data){
				//console.log(data);
				callback(data["memberVO"]);
				//console.log("restCust.ajax실행중 getCust 완료");
			},
			error:function(xhr,status,err){
				//console.log("restCust.ajax실행중 getCustLogin 오류");
			}
		});	//end ajax
	}	//end function getCust
	
	/* 업체 승인  */
	function confirmCompany(memberId,loginId, csrf, callback, error){
		$.ajax({
			type:"post",
			url:"/admin/confirmComp/"+memberId+"/"+loginId,
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrf.csrfHeaderName, csrf.csrfTokenValue);
			},
			
			success:function(data){
				//console.log(data);
				callback(data);
			},
			
			error:function(xhr,status,err){
				//console.log("오류");
			}
		});	//end ajax
	}	//end function confirmCompany
	
	/* 업체 승인  */
	function confirmAdmin(adminVO, loginId, csrf, callback, error){
		$.ajax({
			type:"post",
			url:"/admin/confirmAdmin/"+loginId,
			data:JSON.stringify(adminVO),
        	contentType: "application/json",
        	
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrf.csrfHeaderName, csrf.csrfTokenValue);
			},
			
			success:function(data){
				//console.log(data);
				callback(data);
			},
			
			error:function(xhr,status,err){
				//console.log("오류");
			}
		});	//end ajax
	}	//end function confirmCompany
	
	
		/* 업체 승인  */
	function modAdmin(adminVO, loginId, csrf, callback, error){
		$.ajax({
			type:"put",
			url:"/admin/mofify/member/"+loginId,
			data:JSON.stringify(adminVO),
        	contentType: "application/json",
        	
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrf.csrfHeaderName, csrf.csrfTokenValue);
			},
			
			success:function(data){
				//console.log(data);
				callback(data);
			},
			
			error:function(xhr,status,err){
				//console.log("오류");
			}
		});	//end ajax
	}	//end function confirmCompany
	
	
	
return{
	getCustList:getCustList,
	getCompanyList:getCompanyList,
	getAdminList:getAdminList,
	getCust:getCust,
	confirmCompany:confirmCompany,
	confirmAdmin:confirmAdmin,
	modAdmin:modAdmin,
};

})();

