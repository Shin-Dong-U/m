<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	/* confirm_check none display */
	#confirm_check{ display: none }
		
	/* The Modal (background) */
	.modal{
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 1; /* Sit on top */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	/* Modal Content Box Title */
	.modal-content {
		background-color: #fefefe;
		margin: 15% auto; /* 15% from the top and centered */
		padding: 20px;
		border: 1px solid #888;
		width: 50%; /* Could be more or less, depending on screen size */                          
	}
	/* The Close Button */
	.close {
		color: #aaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
	}
	.close:hover, .close:focus {
		color: black;
		text-decoration: none;
		cursor: pointer;
	}

</style>

</head>
<body>

	<h1> 일반 사용자 회원정보</h1>
	<input type="button" id="btn_custTest" value="출력" />
	<hr/>
	
	<h1> 업체 회원정보</h1>
	<input type="button" id="btn_companyTest" value="출력" />
	<hr/>
	
	<h1> 관리자 회원정보</h1>
	<input type="button" id="btn_AdminTest" value="출력" />
	<hr/>

<div class="plus-content">

</div>


<!-- modal 시작 -->

	
<div id="modal" class="modal">
	<div id="modal-content" class="modal-content">
		<span id="close-modal" class="close">&times;</span> 
		<!-- content -->
		<h3>회원 정보 </h3><hr/>
		<div>
			<div id="detail_chat">
			
			
			
			</div>
			<!-- content -->
			<div id="modify_check">		
				<input type="button" class="btn btn-primary" id="btn_modify" value="수정">
			</div>
			<div id="confirm_check">
				<input type="button" class="btn btn-primary" id="btn_submit" value="확인">
				<input type="button" class="btn btn-primary" id="btn_cancel" value="취소">
			</div>
		</div>
	</div>
</div>

<!-- modal 끝 -->








<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
<script type="text/javascript" src="/resources/admin/adminRest.js?v=<%=System.currentTimeMillis() %>"></script>
<script>

/* CSRF 데이터 변수 저장 */
var csrfHeaderName="${_csrf.headerName}";
var csrfTokenValue="${_csrf.token}";

/* session에 저장된 로그인된 아이디 */
//var loginId="${memberId}";
var loginId="admin0";

/* 관리자 업체 사용자 처리 */
var check="";

/* 일반 사용자 불러오기 */
$("#btn_custTest").on("click", function(e){
	e.preventDefault();
	var cust=1;	//페이징
	check=1;	//[1]-일반사용자 [2]-업체 [3]-관리자
	adminRest.getCustList(
		cust,
		function(list){
			showBasic(check,list);
		}
	);
});

/* 업체 사용자 불러오기 */
$("#btn_companyTest").on("click", function(e){
	e.preventDefault();
	var cust=1;	//페이징
	check=2;	//[1]-일반사용자 [2]-업체 [3]-관리자
	adminRest.getCompanyList(
		cust,
		function(list){
			showBasic(check,list);
		}
	);
});

/* 관리자 사용자 불러오기 */
$("#btn_AdminTest").on("click", function(e){
	e.preventDefault();
	var cust=1;	//페이징
	check=3;	//[1]-일반사용자 [2]-업체 [3]-관리자
	adminRest.getAdminList(
		cust,
		function(list){
			showBasic(check,list);
		}
	);
});

/* 상세보기 */
$(".plus-content").on("click", ".btn_modDetail", function(){
    //var button = $(this).css({"border": "2px solid blue"});
	//var memberId = $(this).parent().parent().find("span").css({"border": "2px solid yellow"});
	var memberId = $(this).parent().parent().find("span").text();
	alert("성공?"+memberId);

	checkModal(memberId);
});

/* 모달 생성 */
function checkModal(memberId){
	adminRest.getCust(
		memberId,
		function(memberVO){
			console.log(memberVO);
			showDetail(memberVO);
		}
	);
	
	document.getElementById("modal").style.display="block";
}

/* 모달 닫기 */
$("#close-modal").on("click",function(){
	
	//display
	document.getElementById("confirm_check").style.display = "none";
	document.getElementById("modify_check").style.display = "block";
	
	document.getElementById("modal").style.display="none";
});

/* 모달 수정 버튼  */
$("#btn_modify").on("click",function(){
    //var button = $(this).css({"border": "2px solid blue"});
	//var memberId = $(this).parent().parent().find("span").css({"border": "2px solid yellow"});
	var memberId = $(this).parent().parent().find("span").text();
	alert("id값: "+memberId);

	adminRest.getCust(
		memberId,
		function(memberVO){
			console.log(memberVO);
			showDetail_modify(memberVO);
		}
	);
	
	//display
	document.getElementById("confirm_check").style.display = "block";
	document.getElementById("modify_check").style.display = "none";
	
});

/* 모달 완료 버튼  */
$("#btn_submit").on("click",function(){

	//display
	document.getElementById("confirm_check").style.display = "none";
	document.getElementById("modify_check").style.display = "block";
});

/* 모달 취소 버튼  */
$("#btn_cancel").on("click",function(){
	memberId=$("#memberId").val();

	adminRest.getCust(
			memberId,
			function(memberVO){
				console.log(memberVO);
				showDetail(memberVO);
			}
		);
	//display
	document.getElementById("confirm_check").style.display = "none";
	document.getElementById("modify_check").style.display = "block";
});

/* 업체 승인 */
$(".plus-content").on("click",".btn_confirmComp", function(){
	var memberId = $(this).parent().parent().find("span").text();
	alert("성공?"+memberId);
	alert("성공?"+loginId);
	adminRest.confirmCompany(
			memberId, loginId,
			csrf={"csrfHeaderName":csrfHeaderName,
				"csrfTokenValue":csrfTokenValue},
				
			function(data){
				alert("성공?"+data);
			}
		);
});


/* 관리자 위임  */
$(".plus-content").on("click",".btn_upAdmin", function(){
	var memberId=memberId = $(this).parent().parent().find("span").text();
	var adminVO={
		"cust_id":memberId,
		"acc_level":3
	}
	//alert("성공?"+JSON.stringify(adminVO));
	
	adminRest.confirmAdmin(
		adminVO, 
		loginId,
		csrf={"csrfHeaderName":csrfHeaderName,
			  "csrfTokenValue":csrfTokenValue},
				
		function(data){
			alert("성공?"+data);
			
		}
	);
});


/* 기본 정보 보여주기 */
function showBasic(check, data){
	alert(check);
	var str="";
	var str1="";
	var str2="";
	
	if(check==1){
		str1 = "<td>관리자 등업</td>";
	}else if(check==2){
		str1 = "<td>업체</td>"
			 + "<td>승인</td>";
	}else{
		str1 = "<td>레벨</td>";
	}
	
	str +="<table>"
		 + "<tr>"
		 + "<td>아이디</td>"
		 + "<td>이름</td>"
		 + "<td>이메일</td>"
		 + "<td>성별</td>"
		 + "<td>가입여부</td>"
		 + "<td>가입날짜</td>"
		 + "<td>가입유저</td>"
		 + str1
		 + "<td>상세보기</td>"
		 + "</tr>";
		

	for(var i=0; i<data.length; i++){
		//alert(data[i])
		
		if(check==1){
			str2 = "<td><input type='button' class='btn_upAdmin' value='관리자 위임' /></td>";
		}else if(check==2){
			str2 = "<td>"+ data[i].compVO.confirm_yn +"</td>"
				 + "<td><input type='button' class='btn_confirmComp' value='승인' /></td>";
		}else if(check==3){
			str2 = "<td>"+ data[i].adminVO.acc_level + "</td>";
		}
		
		str +="<tr>"
			+ "<td><span>"+ data[i].custVO.memberId +"</span></td>"
			+ "<td>"+ data[i].custVO.name + "</td>"
			+ "<td>"+ data[i].custVO.email + "</td>"
			+ "<td>"+ data[i].custVO.sex + "</td>"
			+ "<td>"+ data[i].custVO.member_yn + "</td>"
			+ "<td>"+ data[i].custVO.regDate +	"</td>"
			+ "<td>"+ data[i].custVO.regUser +	"</td>"
			+ str2
			+ "<td><input type='button' class='btn_modDetail' value='상세보기' /></td>"
			+ "</tr>";
	}
	str += "</table>";
	alert("출력"+str);
	$(".plus-content").html(str);
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
	
	alert(check);
	var str="";
	str +="<table>"
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
		+ "		<td>"+memberVO['custVO'].regDate+"</td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>가입유저</td>"
		+ "		<td>"+memberVO['custVO'].regUser+"</td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>수정날짜</td>"
		+ "		<td>"+memberVO['custVO'].editDate+"</td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>수정유저</td>"
		+ "		<td>"+memberVO['custVO'].editUser+"</td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>마일리지</td>"
		+ "		<td>"+memberVO['custVO'].myMil+"</td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td rowspan='3'>나무정보</td>"
		+ "		<tr>"
		+ "			<td>"+memberVO['custVO'].myTree+"</td>"
		+ " 	</tr>"
		+ "		<tr>"
		+ "			<td>"+memberVO['custVO'].my_bar+"</td>"		
		+ " 	</tr>"
		+ " </tr>";
		
	$("#detail_chat").html(str);	//modal
}


/* 상세보기 게시판 수정 판*/
function showDetail_modify(memberVO){
	var check="";
	if(memberVO['custVO'].admin_yn=="Y"){
		check=3;
	}else if(memberVO['custVO'].company_yn=="Y"){
		check=2;
	}else{
		check=1;
	}
	
	alert(check);
	var str="";
	str +="<table>"
		+ "	<tr>"
		+ "		<td>아이디</td>"
		+ "		<td><input type='text' class='' name='memberId' id='memberId' value='"+memberVO['custVO'].memberId+"' readOnly></td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>비밀번호</td>"
		+ "		<td><input type='text' class='' name='password' id='password' ></td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>이름</td>"
		+ "		<td><input type='text' class='' name='name' id='name' value='"+memberVO['custVO'].name+"' ></td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>핸드폰</td>"
		+ "		<td><input type='text' class='' name='phone' id='phone' value='"+memberVO['custVO'].phone+"' ></td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>이메일</td>"
		+ "		<td><input type='text' class='' name='email' id='email' value='"+memberVO['custVO'].email+"' ></td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>생일</td>"
		+ "		<td><input type='date' class='' name='birth' id='birth' value='"+memberVO['custVO'].birth+"' ></td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>성별</td>"
		+ "		<td>"
		+ "		<input type='radio' id='male' name='sex_check' value=1 >남자 "
		+ "		<input type='radio' id='female' name='sex_check' value=2 >여자 "
		+ "		</td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td rowspan='5'>주소</td>"
		+ "		<tr>"
		+ "			<td>"
		+ "				<input type='text' class='' name='addr_post' id='addr_post' value='"+memberVO['custVO'].addr_post+"' > &nbsp;&nbsp;"
		+ " 			<input class='btn btn-link' type='button' onclick='popUP()' value='우편번호 찾기'>"
		+ "			</td>"
		+ " 	</tr>"
		+ "		<tr>"
		+ "			<td><input type='text' class='' name='addr_city' id='addr_city' value='"+memberVO['custVO'].addr_city+"' ></td>"
		+ " 	</tr>"
		+ "		<tr>"
		+ "			<td><input type='text' class='' name='addr_city_old' id='addr_city_old' ></td>"
		+ " 	</tr>"
		+ "		<tr>"
		+ "			<td><input type='text' class='' name='addr_detail' id='addr_detail' value='"+memberVO['custVO'].addr_detail+"' ></td>"
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
			+ "		<td><input type='text' class='' name='comp_name' id='comp_name' value='"+memberVO['compVO'].comp_name+"' ></td>"
			+ " </tr>"
			+ "	<tr>"
			+ "		<td>사업자 번호</td>"
			+ "		<td><input type='text' class='' name='corp_num' id='corp_num' value='"+memberVO['compVO'].corp_num+"' ></td>"
			+ " </tr>";
	}else if(check==3){
		str +="	<tr>"
			+ "		<td>관리자 레벨</td>"
			+ "		<td>"
			+ "			<select name='acc_level'>"
			+ "				<option value=1>1-총관리자</option>"
			+ "				<option value=2>2-중간관리자</option>"
			+ "				<option value=3>3-신입관리자</option>"
			+ "			<select>"
			+ "		</td>"
			+ " </tr>";
	}
		
	str +="	<tr>"
		+ "		<td>가입날짜</td>"
		+ "		<td>"+memberVO['custVO'].regDate+"</td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>가입유저</td>"
		+ "		<td>"+memberVO['custVO'].regUser+"</td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>수정날짜</td>"
		+ "		<td>"+memberVO['custVO'].editDate+"</td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>수정유저</td>"
		+ "		<td>"+memberVO['custVO'].editUser+"</td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td>포인트</td>"
		+ "		<td><input type='text' class='' name='myMil' id='myMil' value='"+memberVO['custVO'].myMil+"' ></td>"
		+ " </tr>"
		+ "	<tr>"
		+ "		<td rowspan='3'>나무정보</td>"
		+ "		<tr>"
		+ "			<td><input type='text' class='' name='myTree' id='myTree' value='"+memberVO['custVO'].myTree+"' ></td>"
		+ " 	</tr>"
		+ "		<tr>"
		+ "			<td><input type='text' class='' name='my_bar' id='my_bar' value='"+memberVO['custVO'].my_bar+"' ></td>"
		+ " 	</tr>"
		+ " </tr>";
		
	$("#detail_chat").html(str);	//modal
}







</script>

</body>
</html>