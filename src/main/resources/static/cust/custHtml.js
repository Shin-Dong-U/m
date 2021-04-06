/* 특정 회원 정보 가져오기 */
function get_chat(){
	customer.getCust(
			memId,
			function(memberVO){
				//console.log(memberVO['custVO'].memberId);
				if(memberVO["custVO"].sex == 1){var sex="남자"}else{var sex="여자"}
				str1="";
				str2="";
				str1 +='<h4> My Account Details</h4>'
					 + '<div style="border:1px solid gray;" class="row">'
					 + '	<div class="col-md-8">'
					 + '		<label>ID</label>'
					 + '		<input class="form-control" type="text" id="memberId" name="memberId" value="'+memberVO["custVO"].memberId+'" disabled>'
					 + '	</div>'
					 + '	<div class="col-md-8">'
					 + '		<label>Name</label>'
					 + '		<input class="form-control" type="text" id="name" name="name" value="'+memberVO["custVO"].name+'" disabled>'
					 + '	</div>'
					 + '	<div class="col-md-8">'
					 + '		<label>Phone Number</label>'
					 + '		<input class="form-control" type="text" id="phone" name="phone" value="'+memberVO["custVO"].phone+'" disabled>'
					 + '	</div>'
					 + '	<div class="col-md-8">'
					 + '		<label>Email</label>'
					 + '		<input class="form-control" type="text" id="email" name="email" value="'+memberVO["custVO"].email+'" disabled>'
					 + '	</div>'
					 + '	<div class="col-md-8">'
					 + '		<label>Address</label>'
					 + '		<input class="form-control" type="text" id="addr_post1" name="addr_post" value='+memberVO["custVO"].addr_post+' disabled>'
					 + '		<input class="form-control" type="text" id="addr_city1" name="addr_city" value="'+memberVO["custVO"].addr_city+'" disabled>'
					 + '		<input class="form-control" type="text" id="addr_detail1" name="addr_detail" value="'+memberVO["custVO"].addr_detail+'" disabled>'
					 + '		<span id="guide" style="color:#999display:none"></span>'
					 + '	</div>'
					 + '	<div class="col-md-8">'
					 + '		<label>Birth</label>'
					 + '		<input class="form-control" type="text" id="birth" name="birth" value='+memberVO["custVO"].birth+' disabled>'
					 + '	</div>'	
					 + '	<div class="col-md-8">'
					 + '		<label>Sex</label>'
					 + '		<input class="form-control" type="text" id="sex" name="sex" value='+sex+' disabled>'
					 + '	</div>'
					 + '	<div class="hiddenValue">'
					 + '		<input class="form-control" type="hidden" id="company_yn" name="company_yn" value='+memberVO["custVO"].company_yn+' disabled>'
					 + '	</div>'
					 + '</div><p/>';

				if(memberVO["custVO"].company_yn == "Y"){
					str2 +='<h4> My Company Details</h4>'
						 + '<div style="border:1px solid gray;" class="row">'
						 + '	<div class="col-md-8">'
						 + '		<label>Company Name</label> '
						 + '		<input class="form-control" type="text" id="comp_name" name="comp_name"  value='+memberVO["compVO"].comp_name+' disabled>'
						 + '	</div>'
						 + '	<div class="col-md-8">'
						 + '		<label>Company Corporate Number</label> '
						 + '		<input class="form-control" type="text" id="corp_num" name="corp_num"  value='+memberVO["compVO"].corp_num+' disabled>'
						 + '	</div>'
						 + '	<div class="col-md-8">'
						 + '		<label>Address</label>'
						 + '		<input class="form-control" type="text" id="addr_post2" name="addr_postC" value='+memberVO["custVO"].addr_post+' disabled>'
						 + '		<input class="form-control" type="text" id="addr_city2" name="addr_cityC" value='+memberVO["custVO"].addr_city+' disabled>'
						 + '		<input class="form-control" type="text" id="addr_detail2" name="addr_detailC" value='+memberVO["custVO"].addr_detail+' disabled>'
						 + '		<span id="guide" style="color:#999display:none"></span>'
						 + '		</div>'
						 + '	</div>'
						 + '</div><p>';
					}	        	

				$("#account_custChat").html("");
				$("#account_compChat").html("");
				$("#account_custChat").html(str1);
				$("#account_compChat").html(str2);
	});
};



/* 수정 회원 정보 가져오기 */
function modify_chat(){
	customer.getCust(
			memId,
			function(memberVO){
				////console.log(memberVO['custVO'].memberId);
				if(memberVO["custVO"].sex == 1){var sex="남자"}else{var sex="여자"}
				str1="";
				str2="";
				str1 +='<h4> My Account Details</h4>'
					 + '<div style="border:1px solid gray;" class="row">'
					 + '	<div class="col-md-8">'
					 + '		<label>ID</label>'
					 + '		<input class="form-control" type="text" id="memberId" name="memberId" value="'+memberVO["custVO"].memberId+'" disabled>'
					 + '	</div>'
					 + '	<div class="col-md-8">'
					 + '		<label>Password</label>'
					 + '		<input class="form-control" type="password" id="password_new" name="password_new" />'
					 + '	</div>'
					 + '	<div class="col-md-8">'
					 + '		<label>Name</label>'
					 + '		<input class="form-control" type="text" id="name" name="name" value="'+memberVO["custVO"].name+'" >'
					 + '	</div>'
					 + '	<div class="col-md-8">'
					 + '		<label>Phone Number</label>'
					 + '		<input class="form-control" type="text" id="phone" name="phone" value="'+memberVO["custVO"].phone+'" >'
					 + '	</div>'
					 + '	<div class="col-md-8">'
					 + '		<label>Email</label>'
					 + '		<input class="form-control" type="text" id="email" name="email" value="'+memberVO["custVO"].email+'" disabled>'
					 + '	</div>'
					 + '	<div class="col-md-8">'
					 + '		<label>Address</label>'
					 + '		<input class="form-control" type="text" id="addr_post" name="addr_post" value='+memberVO["custVO"].addr_post+' readonly>'
					 + '		<input class="btn btn-link" type="button" onclick="popUP()" value="우편번호 찾기">'
					 + '		<input class="form-control" type="text" id="addr_city_new1" name="addr_city" value="'+memberVO["custVO"].addr_city+'" readonly>'
					 + '		<input class="form-control" type="text" id="addr_city_old1" 	name="addr_city_O" readonly>'
					 + '		<input class="form-control" type="text" id="addr_detail1" name="addr_detail" value="'+memberVO["custVO"].addr_detail+'" >'
					 + '		<span id="guide" style="color:#999display:none"></span>'
					 + '	</div>'
					 + '	<div class="col-md-8">'
					 + '		<label>Birth</label>'
					 + '		<input class="form-control" type="text" id="birth" name="birth" value='+memberVO["custVO"].birth+' disabled>'
					 + '	</div>'	
					 + '	<div class="col-md-8">'
					 + '		<label>Sex</label>'
					 + '		<input class="form-control" type="text" id="sex" name="sex" value='+sex+' disabled>'
					 + '	</div>'
					 + '	<div class="hiddenValue">'
					 + '		<input class="form-control" type="hidden" id="company_yn" name="company_yn" value='+memberVO["custVO"].company_yn+'>'
					 + '		<input class="form-control" type="hidden" id="password" name="password" value='+memberVO["custVO"].password+'>'
					 + '	</div>'
					 + '</div><p/>';

				$("#account_custChat").html("");
				$("#account_custChat").html(str1);

	});
}