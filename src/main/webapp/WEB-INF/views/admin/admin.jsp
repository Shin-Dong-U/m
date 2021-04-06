<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>E Store - eCommerce HTML Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="eCommerce HTML Template Free Download" name="keywords">
<meta content="eCommerce HTML Template Free Download" name="description">

<!-- Favicon -->
<link href="/resources/template/img/favicon.ico" rel="icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap" rel="stylesheet">

<!-- CSS Libraries -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="/resources/template/lib/slick/slick.css" rel="stylesheet">
<link href="/resources/template/lib/slick/slick-theme.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/resources/template/css/style.css" rel="stylesheet">

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="/resources/template/lib/easing/easing.min.js"></script>
<script src="/resources/template/lib/slick/slick.min.js"></script>

<!-- Template Javascript -->
<script src="/resources/template/js/main.js"></script>

<style>
	/* Account - Detail */
	#confirm_check{ display: none }
	#modify_check{ display: none }
	
	/* Admin - none display */
	#modal_confirm_check{ display: none }
	/* Admin - 사용자 업체 관리자  */
	.userBind{
		display:flex;
	}
	/* Admin - The Modal (background) */
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
	/* Admin - Modal Content Box Title */
	.modal-content {
		background-color: #fefefe;
		margin: 15% auto; /* 15% from the top and centered */
		padding: 20px;
		border: 1px solid #888;
		width: 50%; /* Could be more or less, depending on screen size */                          
	}
	/* Admin - The Close Button */
	.close {
		color: #aaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
	}
	/* Admin -  Modal*/
	.close:hover, .close:focus {
		color: black;
		text-decoration: none;
		cursor: pointer;
	}
</style>
</head>

<body>

<!-- Top bar Start -->
<div class="top-bar">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-6">
				<i class="fa fa-envelope"></i> support@email.com
			</div>
			<div class="col-sm-6">
				<i class="fa fa-phone-alt"></i> +012-345-6789
			</div>
		</div>
	</div>
</div>
<!-- Top bar End -->

<!-- Nav Bar Start -->
<div class="nav">
	<div class="container-fluid">
		<nav class="navbar navbar-expand-md bg-dark navbar-dark">
			<a href="" class="navbar-brand">MENU</a>
			<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
				<div class="navbar-nav mr-auto">
					<a href="index.html" class="nav-item nav-link">Home</a> 
					<a href="product-list.html" class="nav-item nav-link">Products</a> 
					<a href="product-detail.html" class="nav-item nav-link">Product	Detail</a> 
					<a href="cart.html" class="nav-item nav-link">Cart</a> 
					<a href="checkout.html" class="nav-item nav-link">Checkout</a> 
					<a href="my-account.html" class="nav-item nav-link active">My Account</a>
					<div class="nav-item dropdown">
						<a href="" class="nav-link dropdown-toggle"
							data-toggle="dropdown">More Pages</a>
						<div class="dropdown-menu">
							<a href="wishlist.html" class="dropdown-item">Wishlist</a> 
							<a href="login.html" class="dropdown-item">Login & Register</a> 
							<a href="contact.html" class="dropdown-item">Contact Us</a>
						</div>
					</div>
				</div>
				<div class="navbar-nav ml-auto">
					<div class="nav-item dropdown">
						<a href="" class="nav-link dropdown-toggle" data-toggle="dropdown">User Account</a>
						<div class="dropdown-menu">
							<a href="" class="dropdown-item">Login</a> 
							<a href="" class="dropdown-item">Register</a>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</div>
</div>
<!-- Nav Bar End -->

<!-- Bottom Bar Start -->
<div class="bottom-bar">
	<div class="container-fluid">
		<div class="row align-items-center">
			<div class="col-md-3">
				<div class="logo">
					<a href="index.html">
						<img src="/resources/template/img/logo.png" alt="Logo">\
					</a>
				</div>
			</div>
			<div class="col-md-6">
				<div class="search">
					<input type="text" placeholder="Search">
					<button> <i class="fa fa-search"></i> </button>
				</div>
			</div>
			<div class="col-md-3">
				<div class="user">
					<a href="wishlist.html" class="btn wishlist"> 
						<i class="fa fa-heart"></i> 
						<span>(0)</span>
					</a> 
					<a href="cart.html" class="btn cart"> 
						<i class="fa fa-shopping-cart"></i> 
						<span>(0)</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Bottom Bar End -->

<!-- Breadcrumb Start -->
<div class="breadcrumb-wrap">
	<div class="container-fluid">
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="">Home</a></li>
			<li class="breadcrumb-item"><a href="">Products</a></li>
			<li class="breadcrumb-item active">My Account</li>
		</ul>
	</div>
</div>
<!-- Breadcrumb End -->

<!-- My Account Start -->
<div class="my-account">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3">
				<div class="nav flex-column nav-pills" role="tablist"
					aria-orientation="vertical">
					<a class="nav-link active" id="dashboard-nav" data-toggle="pill" href="#dashboard-tab" role="tab">
						<i class="fa fa-tachometer-alt"></i>Dashboard
					</a> 
					<a class="nav-link" id="orders-nav" data-toggle="pill" href="#orders-tab" role="tab">
						<i class="fa fa-shopping-bag"></i>Orders
					</a> 
					<a class="nav-link" id="payment-nav" data-toggle="pill" href="#payment-tab" role="tab">
						<i class="fa fa-credit-card"></i>Payment Method
					</a> 
					<a class="nav-link" id="address-nav" data-toggle="pill" href="#address-tab" role="tab">
						<i class="fa fa-map-marker-alt"></i>address
					</a>
					<a class="nav-link" id="account-nav" data-toggle="pill" href="#account-tab" role="tab"><!-- #account-tab은 id account-tab을 찾아간다. -->
						<i class="fa fa-user"></i>Account Details
					</a>
					<a class="nav-link" id="member-nav" data-toggle="pill" href="#member-tab" role="tab"><!-- ##member-tab은 id member-tab을 찾아간다. -->
						<i class="fa fa-user"></i>Admin Member
					</a>
					<a class="nav-link" href="index.html">
						<i class="fa fa-sign-out-alt"></i>Logout
					</a>
				</div>
			</div>
			<div class="col-md-9">
				<div class="tab-content">
<!-- DashBorad -->
					<div class="tab-pane fade show active" id="dashboard-tab" role="tabpanel" aria-labelledby="dashboard-nav">
					<h4>Dashboard</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							In condimentum quam ac mi viverra dictum. In efficitur ipsum
							diam, at dignissim lorem tempor in. Vivamus tempor hendrerit
							finibus. Nulla tristique viverra nisl, sit amet bibendum ante
							suscipit non. Praesent in faucibus tellus, sed gravida lacus.
							Vivamus eu diam eros. Aliquam et sapien eget arcu rhoncus
							scelerisque.</p>
					</div>
<!-- Order -->
					<div class="tab-pane fade" id="orders-tab" role="tabpanel" aria-labelledby="orders-nav">
						<div class="table-responsive">
							<table class="table table-bordered">
								<thead class="thead-dark">
									<tr>
										<th>No</th>
										<th>Product</th>
										<th>Date</th>
										<th>Price</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>Product Name</td>
										<td>01 Jan 2020</td>
										<td>$99</td>
										<td>Approved</td>
										<td><button class="btn">View</button></td>
									</tr>
									<tr>
										<td>2</td>
										<td>Product Name</td>
										<td>01 Jan 2020</td>
										<td>$99</td>
										<td>Approved</td>
										<td><button class="btn">View</button></td>
									</tr>
									<tr>
										<td>3</td>
										<td>Product Name</td>
										<td>01 Jan 2020</td>
										<td>$99</td>
										<td>Approved</td>
										<td><button class="btn">View</button></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					
<!-- payment Methode -->
					<div class="tab-pane fade" id="payment-tab" role="tabpanel"	aria-labelledby="payment-nav">
						<h4>Payment Method</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							In condimentum quam ac mi viverra dictum. In efficitur ipsum
							diam, at dignissim lorem tempor in. Vivamus tempor hendrerit
							finibus. Nulla tristique viverra nisl, sit amet bibendum ante
							suscipit non. Praesent in faucibus tellus, sed gravida lacus.
							Vivamus eu diam eros. Aliquam et sapien eget arcu rhoncus
							scelerisque.</p>
					</div>
					
<!-- Address -->
					<div class="tab-pane fade" id="address-tab" role="tabpanel"
						aria-labelledby="address-nav">
						<h4>Address</h4>
						<div class="row">
							<div class="col-md-6">
								<h5>Payment Address</h5>
								<p>123 Payment Street, Los Angeles, CA</p>
								<p>Mobile: 012-345-6789</p>
								<button class="btn">Edit Address</button>
							</div>
							<div class="col-md-6">
								<h5>Shipping Address</h5>
								<p>123 Shipping Street, Los Angeles, CA</p>
								<p>Mobile: 012-345-6789</p>
								<button class="btn">Edit Address</button>
							</div>
						</div>
					</div>
					
<!-- Account Detail -->
					<div class="tab-pane fade" id="account-tab" role="tabpanel" aria-labelledby="account-nav">
						<form id="modifyForm" action="" method="post">
							<div id="account_custChat"></div>
							<div id="account_compChat"></div>
							
							<div class=row >
								<div id="modify_check">
									<input type="button" class="btn btn-primary" id="btn_modify" value="Modify" />
								</div>
								<div id="confirm_check">
									<input type="button" class="btn btn-primary" id="btn_modSubmit" value="Submit" />
									<input type="button" class="btn btn-primary" id="btn_remSubmit" value="Remove" />
									<input type="button" class="btn btn-primary" id="btn_modCancel" value="Cancel" />
								</div>
							</div>
						</form>
					</div><!-- ./tab-pane fade -->
					
<!-- admin-Member -->
					<div class="tab-pane fade" id="member-tab" role="tabpanel"	aria-labelledby="member-tab">
						<div class="table-responsive">
							<div class="col-md-12 userBind">
								<div class="col-4 customer" id="customer"> <h4 style="text-align:center"> 사용자 </h4> </div>
								<div class="col-4 company" id="company"> <h4 style="text-align:center"> 업체  </h4> </div>
								<div class="col-4 admin" id="admin"> <h4 style="text-align:center"> 관리자  </h4> </div>
							</div>
							<div class="col-md-12 chatParent" >
								<div class="col-md-12 member_chat" id="member_chat" ></div><p/>
								<div class="col-md-12" id="pageDiv"> </div><!-- 페이지 번호 -->
								<!-- <table class="table table-bordered"> <tr> <th>No</th> </tr> </table>-->									
							</div><!-- ./col-md-12 -->
						</div>
					</div><!-- ./tab-pane fade -->
					<div class="hiddenParam">
						<input type="hidden" name="pageNum" id="pageNum" value="1"/>
						<input type="hidden" name="custSelect" id="custSelect" value=""/>
					</div>
<!-- admin-Member -->
				</div><!--  -->
			</div><!--  -->
		</div><!--  -->
	</div><!--  -->
</div><!--  -->
<!-- My Account End -->

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
			<div id="modal_modify_check">		
				<input type="button" class="btn" id="modal_btn_modify" value="수정">
			</div>
			<div id="modal_confirm_check">
				<input type="button" class="btn" id="modal_btn_submit" value="확인">
				<input type="button" class="btn" id="modal_btn_cancel" value="취소">
			</div>
		</div>
	</div>
</div>
<!-- modal 끝 -->


<!-- Admin Member -->
<script type="text/javascript" src="/resources/js/common/common.js?v=<%=System.currentTimeMillis() %>"></script>
<script type="text/javascript" src="/resources/admin/adminRest.js?v=<%=System.currentTimeMillis() %>"></script>
<script>
/* CSRF 데이터 변수 저장 */
var csrfHeaderName="${_csrf.headerName}";
var csrfTokenValue="${_csrf.token}";

/* session에 저장된 로그인된 아이디 */
//var loginId="${memberId}";
var loginId="admin0";

/* 스타일 변경 */
function styleUpdate(divBtn){
	if(divBtn==1){
		$(".customer").css("background","#ABF200"); 
		$(".company").css("background",""); 
		$(".admin").css("background",""); 
	}else if(divBtn==2){
		$(".customer").css("background",""); 
		$(".company").css("background","#ABF200"); 
		$(".admin").css("background",""); 
	}else if(divBtn==3){
		$(".customer").css("background",""); 
		$(".company").css("background",""); 
		$(".admin").css("background","#ABF200"); 
	}
	//$(".chatParent").css("border","1px solid #90c62b"); 
}

/* 페이징 처리 */
function movePage(pageNum){
	selectedPage(pageNum);	//common.js
	custSelect = $("#custSelect").val();
	custAjax(custSelect, pageNum);
}

/* 사용자 클릭시 */
$(".customer").on("click", function(){
	/* 스타일 변경 */
	styleUpdate(1);
	$("#custSelect").val("cust");
	movePage(1);
	
});

/* ajax실행  */
function custAjax(custSelect, pageNum){
	var check ="";
	
	if(custSelect=="cust"){
		check=1;
		adminRest.getCustList(
			pageNum,
			function(list){
				showBasic(check,list);
		});//end adminRest
	}else if(custSelect=="comp"){
		check=2;
		adminRest.getCompanyList(
			pageNum,
			function(list){
				showBasic(check,list);
		});//end adminRest
	}else if(custSelect=="admin"){
		check=3;
		adminRest.getAdminList(
			pageNum,
			function(list){
				showBasic(check,list);
		});//end adminRest
	}
}


/* 업체 클릭시 */
$(".company").on("click", function(){
	/* 스타일 변경 */
	styleUpdate(2);
	$("#custSelect").val("comp");
	movePage(1);
});

/* 관리자 클릭시 */
$(".admin").on("click", function(){
	/* 스타일 변경 */
	styleUpdate(3);
	$("#custSelect").val("admin");
	movePage(1);
});


/* 상세보기 */
$(".member_chat").on("click", ".btn_modDetail", function(){
    //var button = $(this).css({"border": "2px solid blue"});
	//var memberId = $(this).parent().parent().find("span").css({"border": "2px solid yellow"});
	var memberId = $(this).parent().parent().find("span").text();
	alert("성공?"+memberId);

	checkModal(memberId);
});

/* 관리자 위임  */
$(".member_chat").on("click",".btn_upAdmin", function(){
	var memberId=$(this).parent().parent().find("span").text();
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
			alert(data);
			
		}
	);
	
});

/* 업체 승인 */
$(".member_chat").on("click",".btn_confirmComp", function(){
	var memberId = $(this).parent().parent().find("span").text();
	alert("성공?"+memberId);
	alert("성공?"+loginId);
	
	adminRest.confirmCompany(
		memberId, loginId,
		csrf={
			"csrfHeaderName":csrfHeaderName,
			"csrfTokenValue":csrfTokenValue
		},
		function(data){
			alert(data);
		}
	);
	
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
	document.getElementById("modal_confirm_check").style.display = "none";
	document.getElementById("modal_modify_check").style.display = "block";
	
	document.getElementById("modal").style.display="none";
});

/* 모달 수정 버튼  */
$("#modal_btn_modify").on("click",function(){
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
	document.getElementById("modal_confirm_check").style.display = "block";
	document.getElementById("modal_modify_check").style.display = "none";
	
});

/* 모달 완료 버튼  */
$("#modal_btn_submit").on("click",function(){

	//display
	document.getElementById("modal_confirm_check").style.display = "none";
	document.getElementById("modal_modify_check").style.display = "block";
});

/* 모달 취소 버튼  */
$("#modal_btn_cancel").on("click",function(){
	memberId=$("#memberId").val();

	adminRest.getCust(
			memberId,
			function(memberVO){
				console.log(memberVO);
				showDetail(memberVO);
			}
		);
	//display
	document.getElementById("modal_confirm_check").style.display = "none";
	document.getElementById("modal_modify_check").style.display = "block";
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


/* 기본 정보 보여주기 */
function showBasic(check, data){
	alert(check);
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
	
	str +="<table class='table table-bordered' style='width:100%'>"
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
			str2 = "<td><input type='button' class='btn_upAdmin' value='관리자 위임' /></td>";
		}else if(check==2){
			str2 = "<td>"+ data.memberVO[i].compVO.confirm_yn +"</td>"
				 + "<td><input type='button' class='btn_confirmComp' value='승인' /></td>";
		}else if(check==3){
			str2 = "<td>"+ data.memberVO[i].adminVO.acc_level + "</td>";
		}
		
		str +="<tr>"
			+ "<td><span>"+ data.memberVO[i].custVO.memberId +"</span></td>"
			+ "<td>"+ data.memberVO[i].custVO.name + "</td>"
			+ "<td>"+ data.memberVO[i].custVO.email + "</td>"
			+ "<td>"+ data.memberVO[i].custVO.sex + "</td>"
			+ "<td>"+ data.memberVO[i].custVO.member_yn + "</td>"
			+ "<td>"+ data.memberVO[i].custVO.regDate +	"</td>"
			+ "<td>"+ data.memberVO[i].custVO.regUser +	"</td>"
			+ str2
			+ "<td><input type='button' class='btn_modDetail' value='상세보기' /></td>"
			+ "</tr>";
	}
	str += "</table>";
	alert("출력"+str);
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






<!-- My Account -->
<script src="/resources/home/customer.js?v=<%=System.currentTimeMillis() %>"></script>
<script>
/* CSRF 데이터 변수 저장 */
var csrfHeaderName="${_csrf.headerName}";
var csrfTokenValue="${_csrf.token}";


var modify_value= $("#modify_value").val;
var memId="${memberId}";

/* 비밀번호 체크 html 생성 */
$("#account-nav").on("click", function(){
	alert("id는? "+memId);
	$("#account_custChat").html("");
	$("#account_compChat").html("");
 	document.getElementById("confirm_check").style.display="none";
 	document.getElementById("modify_check").style.display="none";
	
	str="";
	str +='<h5>비밀번호 확인</h5>'
		+ '<form id="pwCheckForm" action="">'
		+ '	<div class="row" id="cust_detailChat">'
		+ '		<div class="col-md-6">'
		+ '			<label>Password</label>'
		+ '			<input class="form-control" type="text" id="pwCheck" name="pwCheck">'
		+ '		</div>'
		+ '		<div class="col-md-6">'
		+ '			<label>　</label>'
		+ '			<input type="button" class="form-control btn btn-primary" id="btn_check" value="submit">'
		+ '		</div>'
		+ '	</div>'
		+ '</form>';
	
	$("#account_custChat").html(str);
});

/* 비밀번호 확인 */
$("#account_custChat").on("click","#btn_check", function(){
	customer.passwordCheck(
		custVO={"memberId":memId, "password":$("#pwCheck").val()},	
		csrf={"csrfHeaderName":csrfHeaderName, "csrfTokenValue":csrfTokenValue},
		function(data){
			if(data="success"){
				get_chat();
			 	document.getElementById("modify_check").style.display="block";
			}
		},
		function(data){
			alert("비밀번호가 일치 하지 않습니다");
		}
	);

});

/* 특정 회원 정보 가져오기 */
function get_chat(){
	customer.getCust(
			memId,
			function(memberVO){
				console.log(memberVO['custVO'].memberId);
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
				console.log(memberVO['custVO'].memberId);
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
					 + '		<input class="form-control" type="text" id="password" name="password" />'
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
					 + '		<input class="form-control" type="text" id="addr_post" name="addr_post" value='+memberVO["custVO"].addr_post+' >'
					 + '		<input class="btn btn-link" type="button" onclick="popUP()" value="우편번호 찾기">'
					 + '		<input class="form-control" type="text" id="addr_city_new1" name="addr_city" value="'+memberVO["custVO"].addr_city+'" >'
					 + '		<input class="form-control" type="text" id="addr_city_old1" 	name="addr_city_O" >'
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
					 + '		<input class="form-control" type="hidden" id="company_yn" name="company_yn" value='+memberVO["custVO"].company_yn+' disabled>'
					 + '	</div>'
					 + '</div><p/>';

				$("#account_custChat").html("");
				$("#account_custChat").html(str1);

	});
}

/* 수정 버튼 선택시 수정  */
$("#btn_modify").on("click", function(){
	//display
 	document.getElementById("confirm_check").style.display="block";
 	document.getElementById("modify_check").style.display="none";
 	
 	modify_chat();
});


/* 취소버튼 클릭시 */
$("#btn_modCancel").on("click", function(){
	//display
 	document.getElementById("confirm_check").style.display="none";
 	document.getElementById("modify_check").style.display="block";
 	
 	get_chat();
});

/* 완료버튼 클릭시 */
$("#btn_modSubmit").on("click", function(){
	
	var company_yn=$("#company_yn").val();
	var company_yn1=document.getElementById("company_yn");
	
	alert("company_yn: "+company_yn);
	alert("company_yn: "+company_yn1);
	
	var custVO = {
		"company_yn" : company_yn,
//		"memberId" : $("#memberId").val(),
		"memberId" : memId,
		"password" : $("#password").val(),
		"name" : $("#name").val(),
		"phone" : $("#phone").val(),
		"addr_post" : $("#addr_post").val(),
		"addr_city" : $("#addr_city_new1").val(),
		"addr_detail" : $("#addr_detail1").val(),
	};

	console.log("custVO: " + JSON.stringify(custVO));

	customer.modifyMember(
		custVO, 
		csrf = {
			"csrfHeaderName" : csrfHeaderName,
			"csrfTokenValue" : csrfTokenValue
		}, 
		function(data) {
			if(data=="success"){get_chat();}
		}
	);

	//display
	document.getElementById("confirm_check").style.display = "none";
	document.getElementById("modify_check").style.display = "block";

	get_chat();
});



/* 삭제버튼 클릭시 */
$("#btn_remSubmit").on("click", function(){

var confirmflag = confirm("정말로 삭제하시겠습니까?");
	if (confirmflag == true) {
		alert("완료되었나요?");
		customer.deleteMember(memId, 
		csrf = {
				"csrfHeaderName" : csrfHeaderName,
				"csrfTokenValue" : csrfTokenValue
		}, 
		function(data) {
			if (data == "success") {
				alert("성공" + data);	
			}
		});
		
		//display
		document.getElementById("confirm_check").style.display = "none";
		document.getElementById("modify_check").style.display = "block";
		/* 로그아웃 설정 */
	}
});
</script>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function popUP() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('addr_post').value = data.zonecode;
            document.getElementById("addr_city_new1").value = roadAddr;
            document.getElementById("addr_city_old1").value = data.jibunAddress;
            
            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
</script>
<!--Start of Tawk.to Script-->
			<script type="text/javascript">
				var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
				(function(){
				var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
					s1.async=true;
					s1.src='https://embed.tawk.to/6051161bf7ce18270930c865/1f0ubsnki';
					s1.charset='UTF-8';
					s1.setAttribute('crossorigin','*');
					s0.parentNode.insertBefore(s1,s0);
				})();
			</script>
		<!--End of Tawk.to Script-->
<%@include file="../include/footer.jsp" %>