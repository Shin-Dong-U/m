<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html lang="kr">
    <head>
        <meta charset="utf-8">
        <title>ECO FRIENDS</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="eCommerce HTML Template Free Download" name="keywords">
        <meta content="eCommerce HTML Template Free Download" name="description">

        <!-- Favicon -->
        <link href="${contextPath}/resources/template/img/favicon.ico" rel="icon">
        
        <!--  -->
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
		
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap" rel="stylesheet">

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="${contextPath}/resources/template/lib/slick/slick.css" rel="stylesheet">
        <link href="${contextPath}/resources/template/lib/slick/slick-theme.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="${contextPath}/resources/template/css/style.css" rel="stylesheet">
        <style>
			/* Account - Detail */
			#confirm_check {
				display: none
			}
			.custRemoveButton{
				display: none
			}
			#modify_check {
				display: none
			}
			
			/* Admin - none display */
			#modal_confirm_check {
				display: none
			}
			/* Admin - 사용자 업체 관리자  */
			.userBind {
				display: flex;
			}
			/* Admin - The Modal (background) */
			.modal {
				display: none; /* Hidden by default */
				position: fixed; /* Stay in place */
				z-index: 1; /* Sit on top */
				left: 0;
				top: 0;
				width: 100%; /* Full width */
				height: 100%; /* Full height */
				overflow: auto; /* Enable scroll if needed */
				background-color: rgb(0, 0, 0); /* Fallback color */
				background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
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

<%@include file="../include/header.jsp" %>
        <!-- Bottom Bar End -->


<!-- Bottom Bar End --> 

<!-- Breadcrumb Start -->
<div class="breadcrumb-wrap">
    <div class="container-fluid">
        <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="">홈</a></li>
            <li class="breadcrumb-item"><a href="">상품목록</a></li>
            <li class="breadcrumb-item active">내 정보</li>
        </ul>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- My Account Start -->
<div class="my-account">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3">
                <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
                    <!-- <a class="nav-link active" id="dashboard-nav" data-toggle="pill" href="#dashboard-tab" role="tab"><i class="fa fa-tachometer-alt"></i>Dashboard</a> -->
        <!--주문목록조회  -->
        			
                    <sec:authorize access="hasAuthority('ROLE_COMPANY')">
                   		<a class="nav-link" id="payment-nav" data-toggle="pill" href="#payment-tab" role="tab"><i class="fa fa-credit-card"></i> 배송정보입력(업체)</a>
					</sec:authorize>
                    <a class="nav-link active" id="orders-nav" data-toggle="pill" href="#orders-tab" role="tab"><i class="fa fa-shopping-bag"></i> 주문정보</a>
                    <sec:authorize access="hasAuthority('ROLE_COMPANY')">
                    	<a class="nav-link" id="goods-ins-nav" data-toggle="pill" href="#goods-ins-tab" role="tab"><i class="fa fa-shopping-bag"></i>상품등록</a>
              		</sec:authorize>
                    <a class="nav-link" id="account-nav" data-toggle="pill" href="#account-tab" role="tab"><i class="fa fa-user"></i> 내정보</a>
                    <sec:authorize access="hasAuthority('ROLE_ADMIN')">
	                    <a class="nav-link" href="http://172.16.5.1:3000/" ><i class="fa fa-map-marker-alt"></i> 차트보기</a>
	                    <a class="nav-link" id="member-nav" data-toggle="pill" href="#member-tab" role="tab"><i class="fa fa-user"></i> 사용자 관리 </a>
                    </sec:authorize>
                    <a class="nav-link" href="http://172.16.5.1:3000/" ><i class="fa fa-map-marker-alt"></i> 나무키우기</a>
                    <a class="nav-link logoutBtn"><i class="fa fa-sign-out-alt"></i>Logout</a>
                    <form action="/sample/logout", method="post" class="logoutForm">
                    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </form>
                </div>
            </div>
            <div class="col-md-9">
                <div class="tab-content">
                <!--     <div class="tab-pane fade show active" id="dashboard-tab" role="tabpanel" aria-labelledby="dashboard-nav">
                        <h4>Dashboard</h4>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in. Vivamus tempor hendrerit finibus. Nulla tristique viverra nisl, sit amet bibendum ante suscipit non. Praesent in faucibus tellus, sed gravida lacus. Vivamus eu diam eros. Aliquam et sapien eget arcu rhoncus scelerisque.
                        </p> 
                    </div> -->
                    <div class="tab-pane fade show active" id="orders-tab" role="tabpanel" aria-labelledby="orders-nav">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                               <thead class="thead-dark">
                                            <tr>
                                                <th>주문번호</th>
                                                <th>주문일자</th>
                                                <th>총 가격</th>
                                                <th>배송상태</th>
                                                <th>상세보기</th>
                                            </tr>
                                        </thead>
                                        <tbody class="showOrderedInfo">
                                           
                                         
                                        </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="payment-tab" role="tabpanel" aria-labelledby="payment-nav">
                      <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>주문번호</th>
                                                <th>주문일자</th>
                                                <th>총 가격</th>
                                                <th>배송상태</th>
                                                <th>배송정보 입력하기</th>
                                            </tr>
                                        </thead>
                                        <tbody class="shipOrderedInfo">
                                           
                                         
                                        </tbody>
                                    </table>
                                </div>
                    </div>
                    
                    
                    <!-- 상품등록 탭 -->
                    <div class="tab-pane fade" id="goods-ins-tab" role="tabpanel" aria-labelledby="goods-ins-nav">
                    	<form:form role="form" action="/goods/form" method="put" id="goodsForm" onSubmit="return false;">
                    	<div class="row">
                    		<div class="col-md-1">
                    			<lable>상품명</lable>
                    		</div>
                    		<div class="col-md-3">
                    			<input class="form-control" type="text" id="goods_name" name="goods_name">
                            </div>
                            <div class="col-md-2">
                            </div>
                            <div class="col-md-1">
                    			<lable>썸네일</lable>
                    		</div>
                    		<div class="col-md-3">
                    			<div id="uploadDiv"></div>
								<input class="" type="file" id="uploadFile" name="uploadFile" multiple="multiple"> 
                            </div>
                    	</div>
                    	<div class="row">
                    	</div>
                    	<div class="row">
                    		<div class="col-md-1">
                    			<lable>가격</lable>
                    		</div>
                    		<div class="col-md-2">
                    			<input class="form-control" type="number" id="price" name="price" min="0" max="210000000" oninput="this.value=this.value.replace(/[^0-9]/g,'');">
                            </div>
                    	</div>
                    	<div class="row">
                    		<div class="col-md-1">
                    			<lable>재고수량</lable>
                    		</div>
                    		<div class="col-md-2">
                    			<input class="form-control" type="number" id="qty" name="qty" min="0" max="210000000" oninput="this.value=this.value.replace(/[^0-9]/g,'');">
                            </div>
                    	</div>
                    	<div class="row">
                    		<div class="col-md-1">
                    			<lable>성분</lable>
                    		</div>
                    		<div class="col-md-3">
                    			<input class="form-control" type="text" id="material" name="material">
                            </div>
                    	</div>
                    	<div class="row">
                    		<div class="col-md-1">
                    			<lable>카테고리</lable>
                    		</div>
                    		<div class="col-md-2">
                    			<select class="form-control" id="category" name="category">
						        <c:forEach var="cate" items="${cateList }" >
							       <option value="${cate.CATE_SEQ }">${cate.CATE_NAME }</option>
							    </c:forEach></select>
                            </div>
                    	</div>
                    	<div class="row">
                    		<div class="col-md-1">
                    			<lable>필수 옵션</lable>
                    		</div>
                    		<div class="col-md-4">
                    			<label class="radio-inline">없음<input type="radio" name="req_option" value="N" checked="checked"></label>&nbsp;&nbsp;
                    			<label class="radio-inline">있음<input type="radio" name="req_option" id="req_option_y" value="Y"></label>
                            </div>
                    	</div>
                    	<div class="row" id="req_option_div"></div>
                    	<div class="row" style="margin-top:20px;">
            				<textarea name="goods_detail" id="goods_detail" rows="10" cols="100" style="width:100%; height:412px; min-width:610px;"></textarea>        	
                    	</div>
						</form:form>
						<div class="row" style="margin-top:20px;">
							<button class="btn" id="goodsInsBtn" onclick="submitContents(this);">등록</button>
						</div>
                    </div><!-- 상품 등록 탭의 끝  -->
                    
                    
                    <div class="tab-pane fade" id="address-tab" role="tabpanel" aria-labelledby="address-nav">
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
<!-- 내정보 시작 --> 
					<div class="tab-pane fade" id="account-tab" role="tabpanel" aria-labelledby="account-nav">
						<form id="modifyForm" action="" method="post">
							<div id="account_custChat"></div>
							<div id="account_compChat"></div>
							
							<div class=row >
								<div id="modify_check">
									<input type="button" class="btn btn-primary" id="btn_modify" value="Modify" />
								</div>
								<div id="confirm_check">
									<input type="button" class="btn btn-primary" id="btn_modSubmit" value="확인" />
									<input type="button" class="btn btn-primary" id="btn_remSubmit" value="탈퇴" />
									<input type="button" class="btn btn-primary" id="btn_modCancel" value="취소" />
								</div>
							</div>
						</form>
					</div><!-- ./tab-pane fade -->
<!-- 내정보 끝 --> 
<!-- 관리자 Member -->
					<div class="tab-pane fade" id="member-tab" role="tabpanel"	aria-labelledby="member-tab">
						<div class="table-responsive">
							<div class="col-md-4 userBind">
								<div class="col-md-4 customer" id="customer" > <h4 style="text-align:center"> 사용자 </h4> </div>
								<div class="col-md-4 company" id="company"> <h4 style="text-align:center"> 업체  </h4> </div>
								<div class="col-md-4 admin" id="admin"> <h4 style="text-align:center"> 관리자  </h4> </div>
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
						<input type="hidden" name="custSelect" id="custSelect" value="cust"/>
					</div>
<!-- 관리자 Member -->
                </div>
            </div>
        </div>
    </div>
</div>

<!-- modal 시작 -->
<div class="modal" id="memberManager" tabindex="-1" role="dialog" ria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header ">
				<h5 class="modal-title">회원 상세 정보</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div id="detail_chat">

				</div>
			</div>
			<div class="modal-footer">
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
</div>

        <!-- modal 시작 -->
<div class="modal" id="totalModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header ">
				<h5 id="total_header"></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div id="detail_chat2"></div>
			</div>
			<div class="modal-footer">
				<span class="custRemoveButton">
					<button type="button" class="btn custRemoveSubmit" >확인</button>
					<button type="button" class="btn custRemoveCancel" >취소</button>
				</span>
				<span class="basic">
				<button type="button" id="close1" class="btn close1" data-dismiss="modal">닫기</button>
				</span>
			</div>
		</div>
	</div>
</div>
<!-- Ajax 실행 Javascript -->


   <!-- Footer Start -->
        <div class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h2>고객센터</h2>
                            <div class="contact-info">
                                <p><i class="fa fa-map-marker"></i>Eco Friends, 서울특별시 구로구 시흥대로 163길 33, 대한민국</p>
                                <p><i class="fa fa-envelope"></i>eco_friends@gmail.com</p>
                                <p><i class="fa fa-phone"></i>02-456-7890</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h2>Follow Us</h2>
                            <div class="contact-info">
                                <div class="social">
                                    <a href="https://twitter.com/greenstandards" target="_blank"><i class="fab fa-twitter"></i></a>
                                    <a href="https://www.facebook.com/greenstandards/" target="_blank"><i class="fab fa-facebook-f"></i></a>
                                    <a href="https://www.linkedin.com/company/green-standards-ltd" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="https://www.instagram.com/greenstandards/" target="_blank"><i class="fab fa-instagram"></i></a>
                                    <a href="https://www.youtube.com/channel/UClPHbrXdlb3h7mQ8MoGPeVA" target="_blank"><i class="fab fa-youtube"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h2>Eco Friends</h2>
                            <ul>
                              <p><i class="fas fa-address-card"></i>친환경 온라인 쇼핑몰</p>
                            </ul>
                        </div>
                    </div>

                  
        </div>
        <!-- Footer End -->     
        
        <!-- Back to Top -->
        <a href="" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
        
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="${contextPath}/resources/template/lib/easing/easing.min.js"></script>
        <script src="${contextPath}/resources/template/lib/slick/slick.min.js"></script>
        
        <!-- Template Javascript -->
        <script src="${contextPath}/resources/template/js/main.js"></script>
        
        <!--add JavaScript  -->
        <script src="${contextPath}/resources/order/checkout.js?ver=2"></script>
        <script src="${contextPath}/resources/basket/basket.js?ver=9"></script>
         <script src="${contextPath}/resources/basket/wish.js?ver=9"></script>
        
        <script type="text/javascript">
        $(document).ready(function(){
        	var cust_id="${memberId}";
        	showOrderedInfo(cust_id);
        	showShipListInfo(cust_id);
        });
        
        /* CSRF 데이터 변수 저장 */
        var csrfHeaderName="${_csrf.headerName}";
        var csrfTokenValue="${_csrf.token}";
        
        //로그아웃
                    
         $(".logoutBtn").on("click",function(){

        	$('.logoutForm').submit();
        	
        })  
          var cust_id="${memberId}";
          heartCnt(cust_id);
        
    	function heartCnt(cust_id) {
			var heartCount = 0;
			wishService.countWishGoods(cust_id,function(result){
				heartCount="("+result+")";
				$(".wishCntBtn").text(heartCount);
			});
    	}
       
        
        
      

      //주문 리스트 보기
		function showOrderedInfo(cust_id){		
			checkoutService.getOrderList(cust_id,function(orderedInfoList){
				var showOrderedInfoTable=$(".showOrderedInfo");
				var str="";

				
				for(var i=0,len=orderedInfoList.length||0;i<len;i++){
					var delivery_status= '배송정보';

					switch(Number(orderedInfoList[i].DELIVERY_STATUS)){
					
					case 0:
						delivery_status = '배송전';
						break;
					case 1:
						delivery_status = '배송중';
						break;
					case 2:
						delivery_status = '배송완료';
						break;
					case 3:
						delivery_status = '환불신청';
						break;
					case 4:
						delivery_status = '환불배송중';
						break;				
					case 5:
						delivery_status = '환불배송완료';
						break;
					}
					
					str+="<tr>"
						+"	<td>"+orderedInfoList[i].ORDER_SEQ+"</td>"
						+"	<td>"+orderedInfoList[i].REGDATE+"</td>"
                        +"	<td>"+Number(orderedInfoList[i].TOTAL_PRICE)+"</td>"
                        +"	<td>"+delivery_status+"</td>"
                        +"	<td><button class='btn'><a href='/orders/order/orderCheck?order_seq="+orderedInfoList[i].ORDER_SEQ+"'>View</a></button></td>"
                        +"</tr>"
				}
				showOrderedInfoTable.html(str);
			})
		}
      
		 //주문 리스트 보기(업체)
		function showShipListInfo(cust_id){		
			checkoutService.getOrderAllList(function(orderedInfoList){
				var shipOrderedInfoTable=$(".shipOrderedInfo");
				var str="";

				for(var i=0,len=orderedInfoList.length||0;i<len;i++){
					var delivery_status= '배송정보';

					switch(Number(orderedInfoList[i].DELIVERY_STATUS)){
					
					case 0:
						delivery_status = '배송전';
						break;
					case 1:
						delivery_status = '배송중';
						break;
					case 2:
						delivery_status = '배송완료';
						break;
					case 3:
						delivery_status = '환불신청';
						break;
					case 4:
						delivery_status = '환불배송중';
						break;				
					case 5:
						delivery_status = '환불배송완료';
						break;
					}
					
					str+="<tr>"
						+"	<td>"+orderedInfoList[i].ORDER_SEQ+"</td>"
						+"	<td>"+orderedInfoList[i].REGDATE+"</td>"
                        +"	<td>"+Number(orderedInfoList[i].TOTAL_PRICE)+"</td>"
                        +"	<td>"+delivery_status+"</td>"
                        +"	<td><button class='btn'><a href='/orders/ship/writeShipInfo?order_seq="+orderedInfoList[i].ORDER_SEQ+"'>배송정보 입력</a></button></td>"
                        +"</tr>"
				}
				shipOrderedInfoTable.html(str);
			})
		}
        
        </script>
        
<!-- Admin Member -->
<%----%>
<!-- Naver Smart Editor -->
<script type="text/javascript" src="/resources/vender/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/resources/js/common/common.js?v=<%=System.currentTimeMillis() %>"></script>
<script type="text/javascript" src="/resources/basket/transferTime.js?v=<%=System.currentTimeMillis() %>"></script> 
<script type="text/javascript" src="/resources/admin/adminRest.js?v=<%=System.currentTimeMillis() %>"></script>
<script type="text/javascript" src="/resources/admin/adminHtml.js?v=<%=System.currentTimeMillis() %>"></script>
<script type="text/javascript" src="/resources/js/goods/goods.js?v=<%=System.currentTimeMillis() %>"></script>
<script>
/* CSRF 데이터 변수 저장 */
var csrfHeaderName="${_csrf.headerName}";
var csrfTokenValue="${_csrf.token}";

/* session에 저장된 로그인된 아이디 */
//var loginId="${memberId}";
var loginId="${memberId}";

var oEditors = [];//스마트 에디터
var images = new Array();//이미지 파일이 담길 객체 

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
	$(".chatParent").css("border","1px solid #90c62b"); 
}

/* 페이징 처리 */
function movePage(pageNum){
	selectedPage(pageNum);	//common.js
	custSelect = $("#custSelect").val();
	custAjax(custSelect, pageNum);
}

/* 관리자 클릭 클릭시 */
$("#member-nav").on("click", function(){
	/* 스타일 변경 */
	styleUpdate(1);
	$("#custSelect").val("cust");
	movePage(1);
	
});

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
	//alert(memberId);

	checkModal(memberId);
	//display
	document.getElementById("modal_confirm_check").style.display = "none";
	document.getElementById("modal_modify_check").style.display = "block";
	
	//document.getElementById("memberManager").style.display="none";
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
			var pageNum=$("#pageNum").val();
			movePage(pageNum);	
		}
	);
});

/* 업체 승인 */
$(".member_chat").on("click",".btn_confirmComp", function(){
	var memberId = $(this).parent().parent().find("span").text();
	//alert("memberId: "+memberId);
	//alert("loginId: "+loginId);
	
	adminRest.confirmCompany(
		memberId, loginId,
		csrf={
			"csrfHeaderName":csrfHeaderName,
			"csrfTokenValue":csrfTokenValue
		},
		function(data){
			var pageNum=$("#pageNum").val();
			movePage(pageNum);
		}
	);
});


/* 모달 생성 */
function checkModal(memberId){
	adminRest.getCust(
		memberId,
		function(memberVO){

			showDetail(memberVO);
		}
	);
	
	document.getElementById("memberManager").style.display="block";
}

/* 모달 닫기 */
$(".close").on("click",function(){
	
	//display
	document.getElementById("modal_confirm_check").style.display = "none";
	document.getElementById("modal_modify_check").style.display = "block";
	
	document.getElementById("memberManager").style.display="none";
});

/* 모달 수정 버튼  */
$("#modal_btn_modify").on("click",function(){
    //var button = $(this).css({"border": "2px solid blue"});
	//var memberId = $(this).parent().parent().find("span").css({"border": "2px solid yellow"});
	
	//var memberId1 = $(this).parent().parent().parent().children().next().find("span").css({"border": "2px solid yellow"});
	var memberId = $(this).parent().parent().parent().children().next().find("span").text();
	//alert("id값: "+memberId);

	adminRest.getCust(
		memberId,
		function(memberVO){

			showDetail_modify(memberVO);
		}
	);
	
	//display
	document.getElementById("modal_confirm_check").style.display = "block";
	document.getElementById("modal_modify_check").style.display = "none";
	
});

/* 모달 완료 버튼  */
$("#modal_btn_submit").on("click",function(){

	memberId=$(this).parent().parent().parent().children().children().find("#memberId").val();
	//alert(memberId);
	$(this).parent().parent().parent().children().children().find("#memberId").css({"border": "2px solid blue"});
	var $form=$(this).parent().parent().parent().children().children();
	var birth=$form.find("#birth").val();
	birth=birth.replace("-","");
	var birth_int= parseInt(birth.replace("-",""));
	//alert(birth_int);
	

	var acc_level=$form.find('input[name="acc_level_check"]:checked').val();
	var member_yn=$form.find('input[name="member_check"]:checked').val();
	var sex=$form.find('input[name="sex_check"]:checked').val();
	//alert(sex);

	var custVO = {
		"memberId" : memberId,
		"password" : $form.find("#password").val(),
		"email" : $form.find("#email").val(),
		"birth" : birth_int,
		"member_yn":member_yn,
		"sex":sex
	};
	
	var compVO = {
		"cust_id" : memberId,
		"comp_name" : $form.find("#comp_name").val(),
		"corp_num" : $form.find("#corp_num").val()
	};
	
	var adminVO = {
		"cust_id" : memberId,
		"acc_level" :acc_level
	};
	
	//alert(memberId);
	//alert(loginId);
	adminRest.modAdmin(
		memberVO={custVO:custVO, compVO:compVO, adminVO:adminVO}, loginId,
		csrf={
			"csrfHeaderName":csrfHeaderName,
			"csrfTokenValue":csrfTokenValue
		},
		function(data){
			var pageNum=$("#pageNum").val();
			movePage(pageNum);
		}
	);
	
	//display
	document.getElementById("modal_confirm_check").style.display = "none";
	document.getElementById("modal_modify_check").style.display = "block";
	
	document.getElementById("memberManager").style.display="none";
});

/* 모달 취소 버튼  */
$("#modal_btn_cancel").on("click",function(){
	memberId=$("#memberId").val();

	adminRest.getCust(
			memberId,
			function(memberVO){

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

			showDetail(memberVO);
		}
	);
	
	document.getElementById("memberManager").style.display="block";
}

/* 스마트에디터 객체 생성  */
var seq = 0;//객체 중복 생성을 막기위한 시퀀스
$('#goods-ins-tab').click(function(e){
	if(seq++ == 0){//최초만 객체 생성
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "goods_detail",
			sSkinURI: "/resources/vender/smarteditor2/SmartEditor2Skin.html",
			fCreator: "createSEditor2",
			fOnAppLoad : function(){
		    }
		});
	}
});
function submitContents(elClickedObj) {
	 // 에디터의 내용이 textarea에 적용된다.
	 oEditors.getById["goods_detail"].exec("UPDATE_CONTENTS_FIELD", []);

	 // 에디터의 내용에 대한 값 검증은 이곳에서
	 // document.getElementById("ir1").value를 이용해서 처리한다.
	 try {
		 //console.log(document.getElementById("goods_detail").value);
		 //console.log(elClickedObj);
	     //elClickedObj.form.submit();
		 callInsertGoods();//goods.js 상품 등록 함수 호출
	 } catch(e) {}
}

//스마트 에디터 리턴 값 -> 파일 경로 + 파일명만 추출
function getFilePath(queryStr){
	return queryStr.substring(t.indexOf("sFileURL=") + 9);
}

function checkExtension(fileName, fileSize){
	var regex = new RegExp("(.*?)\.(jpg|png|bmp|rle|dib|gif|tif|tiff)");
	var maxSize = 5242880;
	
	if(fileSize >= maxSize){
		alert('파일 사이즈 초과');
		return false;
	}
	
	if(!regex.test(fileName)){
		alert('이미지 파일만 업로드 가능합니다. \n jpg, png, bmp, rle, dib, gif, tif, tiff');
		return false;
	}
	
	return true;
}
//----------------------------------- naver smart editor -------------------------------

var reqLen = 0;
//radio 버튼 클릭 이벤트 
$("input:radio[name=req_option]").click(function(){
            
    if($("input:radio[name=req_option]:checked").val()=='Y'){
    	if(reqLen === 0){ makeReqOptionInputHtml(); }
    }else{
    	$('#req_option_div').empty();
    	reqLen = 0;
    }
});

function makeReqOptionInputHtml(){
	var optionNameArr = $('input:text[name=req_option_name]');
	
	if(reqLen != 0 && !optionNameArr[reqLen -1].value){ 
		alert ('옵션명을 입력 해주세요. (금액 : 입력안함 -> 0원)');
		return;
	}
	
	reqLen++;
	var htmlStr = '<div class="col-lg-12" id="tmp' + reqLen + '"> ';
	htmlStr += ' 옵션명 <input type="text" name="req_option_name"> '; 
	htmlStr += ' 가격 <input type="number" name="req_price" value="0"> ';
	htmlStr += '<button class="btn" onclick="makeReqOptionInputHtml();">추가</button> <button class="btn" onclick="removeReqOptionInputHtml();">제거</button></div>';
	
	$('#req_option_div').append(htmlStr);
}

function removeReqOptionInputHtml(){
	if(reqLen == 0){ return; }
	$('#tmp' + reqLen--).remove();
}

$(".close1").on("click",function(){
	//display
	$(".modal").hide();
	location.reload();
});


</script>






<!-- My Account -->
<script src="/resources/cust/customer.js?v=<%=System.currentTimeMillis() %>"></script>
<script src="/resources/cust/custHtml.js?v=<%=System.currentTimeMillis() %>"></script>
<script>
/* CSRF 데이터 변수 저장 */
var csrfHeaderName="${_csrf.headerName}";
var csrfTokenValue="${_csrf.token}";



var modify_value= $("#modify_value").val;
var memId="${memberId}";

/* 비밀번호 체크 html 생성 */
$("#account-nav").on("click", function(){
	//alert("id는? "+memId);
	$("#account_custChat").html("");
	$("#account_compChat").html("");
 	document.getElementById("confirm_check").style.display="none";
 	document.getElementById("modify_check").style.display="none";
	
	str="";
	str +='<h5>비밀번호 확인</h5>'
		+ '	<div class="row" id="cust_detailChat">'
		+ '		<div class="col-md-6">'
		+ '			<label>Password</label>'
		+ '			<input class="form-control" type="password" id="password" name="password">'
		+ '		</div>'
		+ '		<div class="col-md-6">'
		+ '			<label>　</label>'
		+ '			<input type="button" class="form-control btn btn-primary" id="btn_check" value="submit">'
		+ '		</div>'
		+ '	</div>';

	
	$("#account_custChat").html(str);
});

/* 비밀번호 확인 */
$("#account_custChat").on("click","#btn_check", function(e){
	e.preventDefault();
	var custVO={memberId:memId, password:$("#password").val()} ;
	var csrf={csrfHeaderName:csrfHeaderName, csrfTokenValue:csrfTokenValue};
	customer.passwordCheck(
		custVO,	
		csrf,
		function(data){
			if(data=="success"){
				get_chat();
			 	document.getElementById("modify_check").style.display="block";
			}
		},
		function(){alert("비밀번호가 일치하지 않습니다.");}
	);

});



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
	var password_old=$("#password_new").val();
	$("#password").val(password_old);
	
	//var company_yn1=document.getElementById("company_yn");
	
	//alert("company_yn: "+company_yn);
	//alert("company_yn: "+company_yn1);
	
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



/* 탈퇴버튼 클릭시 */
$("#btn_remSubmit").on("click", function(){

	//탈퇴 모달 display설정
	$(".custRemoveButton").css("display","block");
	$(".basic").css("display","none");
	
	//내용추가
	$("#detail_chat2").html("정말로 탈퇴하시겠습니까?");
	$("#total_header").html("삭제");
	
	//모달 보여주기
	$("#totalModal").show();
	
//var confirmflag = confirm("정말로 삭제하시겠습니까?");
//	if (confirmflag == true) {
//		//alert("완료되었나요?");
//		customer.deleteMember(memId, 
//		csrf = {
//				"csrfHeaderName" : csrfHeaderName,
//				"csrfTokenValue" : csrfTokenValue
//		}, 
//		function(data) {
//			if (data == "success") {
//				//alert(data);	
//			}
//		});
//		
//		//display
//		document.getElementById("confirm_check").style.display = "none";
//		document.getElementById("modify_check").style.display = "block";
//		/* 로그아웃 설정 */
//		$('.logoutForm').submit();
//	}
});

/* 삭제 - 모달 취소 */
$(".custRemoveCancel").on("click",function(){
	//display
	$(".modal").hide();
	$(".custRemoveButton").css("display","none");
	$(".basic").css("display","block");
});
/* 삭제 - 모달 x */
$(".close").on("click",function(){
	//display
	$(".modal").hide();
	$(".custRemoveButton").css("display","none");
	$(".basic").css("display","block");
});

/* 삭제 - 모달 확인 */
$(".custRemoveSubmit").on("click",function(){
	customer.deleteMember(
		memId, 
		csrf = {
			"csrfHeaderName" : csrfHeaderName,
			"csrfTokenValue" : csrfTokenValue
		}, 
		function(data) {
			if (data == "success") {
			}
	});
			
	//display
	document.getElementById("confirm_check").style.display = "none";
	document.getElementById("modify_check").style.display = "block";
	
	//display
	$(".modal").hide();
	$(".custRemoveButton").css("display","none");
	
	/* 로그아웃 설정 */
	$('.logoutForm').submit();
	
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
            //if(data.autoRoadAddress) {
            //    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
            //    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
            //    guideTextBox.style.display = 'block';
            //
            //} else if(data.autoJibunAddress) {
            //    var expJibunAddr = data.autoJibunAddress;
            //    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
            //    guideTextBox.style.display = 'block';
            //} else {
            //    guideTextBox.innerHTML = '';
            //    guideTextBox.style.display = 'none';
            //}
        }
    }).open();
}
</script>
        
 <script>

 
 
	//카트 상품 갯수 표시
		var cust_id = "${memberId}";
    	cartCnt(cust_id);
       
    	function cartCnt(cust_id) {
			var cartCount = 0;
			basketService.countBasketGoods(cust_id,function(result){
				cartCount="("+result+")";
				$(".cartCntBtn").text(cartCount);
			});
    	}
    	
    	 heartCnt(cust_id);
    	 
    		function heartCnt(cust_id) {
    			var heartCount = 0;
    			wishService.countWishGoods(cust_id,function(result){
    				heartCount="("+result+")";
    				$(".wishCntBtn").text(heartCount);
    			});
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
        
        
        
    </body>
</html>