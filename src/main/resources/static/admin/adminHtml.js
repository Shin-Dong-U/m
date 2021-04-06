/* 기본 정보 보여주기 */
function showBasic(check, data){
	//alert(check);
	var str="";
	var str1="";
	var str2="";
	
	if(check==1){
		str1 = "<th>관리자 등업</th>";
	}else if(check==2){
		str1 = "<th>업체</th>"
			 + "<th>승인</th>";
	}else{
		str1 = "<th>레벨</th>";
	}
	
	str +="<p/><p/><table class='table table-bordered' style='width:100%'>"
		 + "<tr>"
		 + "<th>아이디</th>"
		 + "<th>이름</th>"
		 + "<th>이메일</th>"
		 + "<th>성별</th>"
		 + "<th>가입여부</th>"
		 + "<th>가입날짜</th>"
		 + "<th>가입유저</th>"
		 + str1
		 + "<th>상세보기</th>"
		 + "</tr>";
		

	for(var i=0; i<data.memberVO.length; i++){
		//alert(data[i])
		
		if(check==1){
			str2 = "<td><input type='button' class='btn btn_upAdmin' value='관리자 위임' /></td>";
		}else if(check==2){
			str2 = "<td>"+ data.memberVO[i].compVO.confirm_yn +"</td>"
				 + "<td><input type='button' class='btn btn_confirmComp' value='승인' /></td>";
		}else if(check==3){
			str2 = "<td>"+ data.memberVO[i].adminVO.acc_level + "</td>";
		}
		
		str +="<tr>"
			+ "<td><span>"+ data.memberVO[i].custVO.memberId +"</span></td>"
			+ "<td>"+ data.memberVO[i].custVO.name + "</td>"
			+ "<td>"+ data.memberVO[i].custVO.email + "</td>"
			+ "<td>"+ data.memberVO[i].custVO.sex + "</td>"
			+ "<td>"+ data.memberVO[i].custVO.member_yn + "</td>"
			+ "<td>"+ trnasferTime.displayTime(data.memberVO[i].custVO.regDate) +	"</td>"
			+ "<td>"+ data.memberVO[i].custVO.regUser +	"</td>"
			+ str2
			+ "<td><input type='button' class='btn btn_modDetail' value='상세보기' /></td>"
			+ "</tr>";
	}
	str += "</table>";
	//alert("출력"+str);
	
	$(".member_chat").html();
	$(".member_chat").html(str);
	
	if(data.page){
		const pageHtml = makePageHtml(data.page);
		
		const pageDiv = $('#pageDiv');
		$('#pageNum').val(data.page.cri.pageNum);
		pageDiv.empty();
		pageDiv.html(pageHtml);
	}
}


/* 상세정보 보여주기 */
function showDetail(memberVO){
/*
	-일반 사용자
	아이디 이름 핸드폰 이메일 생일 성별  주소 가입여부 
	가입날짜 가입유저 트리 마일리지 트리바  씨앗
*/

/*
	-업체 
	아이디 이름 핸드폰 이메일 생일 성별  주소 가입여부 
	[회사이름 사업자번호] 트리 마일리지 트리바  씨앗
*/

/*
	-관리자
	아이디 이름 핸드폰 이메일 생일 성별  주소 가입여부 
	[관리자 레벨] 트리 마일리지 트리바  씨앗
*/
	var check="";
	if(memberVO['custVO'].admin_yn=="Y"){
		check=3;
	}else if(memberVO['custVO'].company_yn=="Y"){
		check=2;
	}else{
		check=1;
	}
	
	//alert(check);
	var str="";
	str +="<table class='table table-bordered'>"
		+ "	<tr>"
		+ "		<td>아이디</td>"
		+ "		<td><span>"+memberVO['custVO'].memberId+"</span></td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>이름</td>"
		+ "		<td>"+memberVO['custVO'].name+"</td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>핸드폰</td>"
		+ "		<td>"+memberVO['custVO'].phone+"</td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>이메일</td>"
		+ "		<td>"+memberVO['custVO'].email+"</td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>생일</td>"
		+ "		<td>"+memberVO['custVO'].birth+"</td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>성별</td>"
		+ "		<td>"+memberVO['custVO'].sex+"</td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td rowspan='4'>주소</td>"
		+ "		<tr>"
		+ "			<td>"+memberVO['custVO'].addr_post+"</td>"
		+ " 	</tr>"
		+ "		<tr>"
		+ "			<td>"+memberVO['custVO'].addr_city+"</td>"
		+ " 	</tr>"
		+ "		<tr>"
		+ "			<td>"+memberVO['custVO'].addr_detail+"</td>"
		+ " 	</tr>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>가입여부</td>"
		+ "		<td>"+memberVO['custVO'].member_yn+"</td>"
		+ " </tr>"
	
	if(check==2){
		str +="	<tr>"
			+ "		<td>회사 이름</td>"
			+ "		<td>"+memberVO['compVO'].comp_name+"</td>"
			+ " </tr>"
			+ "	<tr>"
			+ "		<td>사업자 번호</td>"
			+ "		<td>"+memberVO['compVO'].corp_num+"</td>"
			+ " </tr>"
	}else if(check==3){
		str +="	<tr>"
			+ "		<td>관리자 레벨</td>"
			+ "		<td>"+memberVO['adminVO'].acc_level+"</td>"
			+ " </tr>"
	}
		
	str +="	<tr>"
		+ "		<td>가입날짜</td>"
		+ "		<td>"+trnasferTime.displayTime(memberVO['custVO'].regDate)+"</td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>가입유저</td>"
		+ "		<td>"+memberVO['custVO'].regUser+"</td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>수정날짜</td>"
		+ "		<td>"+trnasferTime.displayTime(memberVO['custVO'].editDate)+"</td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>수정유저</td>"
		+ "		<td>"+memberVO['custVO'].editUser+"</td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>마일리지</td>"
		+ "		<td>"+memberVO['custVO'].myMil+"</td>"
		+ " </tr>";
/*
		+ "	<tr>"
		+ "		<td rowspan='3'>나무정보</td>"
		+ "		<tr>"
		+ "			<td>"+memberVO['custVO'].myTree+"</td>"
		+ " 	</tr>"
		+ "		<tr>"
		+ "			<td>"+memberVO['custVO'].my_bar+"</td>"		
		+ " 	</tr>"
		+ " </tr>";
*/		
	$("#detail_chat").html(str);	//modal
}

/* 상세보기 게시판 수정 판*/
function showDetail_modify(memberVO){
	/* 사용자||업체||관리자 분류 */
	var check="";
	if(memberVO['custVO'].admin_yn=="Y"){
		check=3;
	}else if(memberVO['custVO'].company_yn=="Y"){
		check=2;
	}else{
		check=1;
	}
	
	/*input 값 지정*/
	// -생일
	birthValue=memberVO['custVO'].birth;
	
	if(birthValue.length==8){
		birthValue=birthValue.substring(0,4)+"-"+birthValue.substring(4,6)+"-"+birthValue.substring(6);
	}else if(birthValue.length==6){
		birthValue=birthValue.substring(0,4)+"-"+birthValue.substring(4,6)+"-01";
	}
	$("#birth").val(birthValue);
	

	
	//alert(check);
	var str="";
	str +="<table>"
		+ "	<tr>"
		+ "		<td>아이디</td>"
		+ "		<td><input type='text' class='form-control' name='memberId' id='memberId' value='"+memberVO['custVO'].memberId+"' readOnly></td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>비밀번호</td>"
		+ "		<td><input type='password' class='form-control' name='password' id='password'></td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>이름</td>"
		+ "		<td><input type='text' class='form-control' name='name' id='name' value='"+memberVO['custVO'].name+"' readOnly></td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>핸드폰</td>"
		+ "		<td><input type='text' class='form-control' name='phone' id='phone' value='"+memberVO['custVO'].phone+"' readOnly></td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>이메일</td>"
		+ "		<td><input type='text' class='form-control' name='email' id='email' value='"+memberVO['custVO'].email+"' ></td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>생일</td>"
		+ "		<td><input type='date' class='form-control' name='birth' id='birth' value='"+birthValue+"' max='9999-12-31' ></td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>성별</td>"
		+ "		<td>"
		+ "		<input type='radio' id='male' name='sex_check' value=1 >남자 "
		+ "		<input type='radio' id='female' name='sex_check' value=2 >여자 "
		+ "		</td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td rowspan='4'>주소</td>"
		+ "		<tr>"
		+ "			<td><input type='text' class='form-control' name='addr_post' id='addr_post' value='"+memberVO['custVO'].addr_post+"' readOnly></td>"
		+ " 	</tr>"
		+ "		<tr>"
		+ "			<td><input type='text' class='form-control' name='addr_city_new1' id='addr_city_new1' value='"+memberVO['custVO'].addr_city+"' readOnly></td>"
		+ " 	</tr>"
		+ "		<tr>"
		+ "			<td><input type='text' class='form-control' name='addr_detail' id='addr_detail' value='"+memberVO['custVO'].addr_detail+"' readOnly></td>"
		+ " 	</tr>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>가입여부</td>"
		+ "		<td>"
		+ "		<input type='radio' id='member_y' name='member_check' value='Y'>가입 "
		+ "		<input type='radio' id='member_n' name='member_check' value='N'>탈퇴 "
		+ "		</td>"
		+ " </tr>";
		
	if(check==2){
		str +="	<tr>"
			+ "		<td>회사 이름</td>"
			+ "		<td><input type='text' class='form-control' name='comp_name' id='comp_name' value='"+memberVO['compVO'].comp_name+"' ></td>"
			+ " </tr>"
			+ "	<tr>"
			+ "		<td>사업자 번호</td>"
			+ "		<td><input type='text' class='form-control' name='corp_num' id='corp_num' value='"+memberVO['compVO'].corp_num+"' ></td>"
			+ " </tr>";
	}else if(check==3){
		str +="	<tr>"
			+ "		<td>관리자 레벨</td>"
			+ "		<td>"
			+ "			<input type='radio' id='level1' name='acc_level_check' value='1'>총관리자 "
			+ "			<input type='radio' id='level2' name='acc_level_check' value='2'>중간관리자"
			+ "			<input type='radio' id='level3' name='acc_level_check' value='3'>신입관리자"
			+ "			<input type='radio' id='level4' name='acc_level_check' value='-1'>일반사용자"
			+ "		</td>"
			+ " </tr>";
	}

	str +="	<tr>"
		+ "		<td>가입날짜</td>"
		+ "		<td><input type='text' class='form-control' name='regDate' id='regDate' value='"+trnasferTime.displayTime(memberVO['custVO'].regDate)+"' disabled></td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>가입유저</td>"
		+ "		<td><input type='text' class='form-control' name='regUser' id='regUser' value='"+memberVO['custVO'].regUser+"' disabled></td>"
		+ " </tr>"
/*
		+ "	<tr>"
		+ "		<td>수정날짜</td>"
		+ "		<td><input type='text' class='form-control' name='editDate' id='editDate' value='"+trnasferTime.displayTime(memberVO['custVO'].editDate)+"' disabled></td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>수정유저</td>"
		+ "		<td><input type='text' class='form-control' name='editUser' id='editUser' value='"+memberVO['custVO'].editUser+"' disabled></td>"
		+ " </tr>"
*/
		+ "	<tr>"
		+ "		<td>포인트</td>"
		+ "		<td><input type='text' class='form-control' name='myMil' id='myMil' value='"+memberVO['custVO'].myMil+"' disabled></td>"
		+ " </tr>"
		+ "	<tr>";
		/*
		+ "		<td rowspan='3'>나무정보</td>"
		+ "		<tr>"
		+ "			<td><input type='text' class='form-control' name='myTree' id='myTree' value='"+memberVO['custVO'].myTree+"' ></td>"
		+ " 	</tr>"
		+ "		<tr>"
		+ "			<td><input type='text' class='form-control' name='my_bar' id='my_bar' value='"+memberVO['custVO'].my_bar+"' ></td>"
		+ " 	</tr>"
		+ " </tr>";
		*/			
		
	$("#detail_chat").html(str);	//modal
	
	//-성별
	if(memberVO['custVO'].sex==1){
		$(":radio[name='sex_check'][value=1]").attr('checked', true); // 선택하기
	}else{
		$(":radio[name='sex_check'][value=2]").attr('checked', true); // 선택하기
	}	
	
	//-가입여부
	if(memberVO['custVO'].member_yn=='Y'){
		$(":radio[name='member_check'][value='Y']").attr('checked', true); // 선택하기
	}else{
		$(":radio[name='member_check'][value='N']").attr('checked', true); // 선택하기
	}	
		
	//-관리자 레벨
	//alert(memberVO['adminVO'].acc_level);
	
	if(memberVO['adminVO'].acc_level == '1'){
		$(":radio[name='acc_level_check'][value='1']").attr('checked', true); // 선택하기
		
	}else if(memberVO['adminVO'].acc_level == '2'){
		$(":radio[name='acc_level_check'][value='2']").attr('checked', true); // 선택하기
		
	}else if(memberVO['adminVO'].acc_level == '3'){
		$(":radio[name='acc_level_check'][value='3']").attr('checked', true); // 선택하기
	}			
}


