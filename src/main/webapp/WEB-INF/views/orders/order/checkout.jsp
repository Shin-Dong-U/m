<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../../include/header.jsp" %>
        <!-- Bottom Bar End --> 
        
        <!-- Breadcrumb Start -->
        <div class="breadcrumb-wrap">
            <div class="container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="">홈</a></li>
                    <li class="breadcrumb-item"><a href="">상품목록</a></li>
                    <li class="breadcrumb-item active">주문하기</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->
        
        <!-- Checkout Start -->
        <div class="checkout">
            <div class="container-fluid"> 
                <div class="row">
                    <div class="col-lg-8">
                        <div class="checkout-inner">
                            <div class="billing-address addressInfomation">
                                
                            </div>

                            <div class="shipping-address">
                               <!--  <h2>배송정보 입력</h2>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>First Name</label>
                                        <input class="form-control" type="text" placeholder="First Name">
                                    </div>
                                    <div class="col-md-6">
                                        <label>Last Name"</label>
                                        <input class="form-control" type="text" placeholder="Last Name">
                                    </div>
                                    <div class="col-md-6">
                                        <label>E-mail</label>
                                        <input class="form-control" type="text" placeholder="E-mail">
                                    </div>
                                    <div class="col-md-6">
                                        <label>Mobile No</label>
                                        <input class="form-control" type="text" placeholder="Mobile No">
                                    </div>
                                    <div class="col-md-12">
                                        <label>Address</label>
                                        <input class="form-control" type="text" placeholder="Address">
                                    </div>
                                    <div class="col-md-6">
                                        <label>Country</label>
                                        <select class="custom-select">
                                            <option selected>South Korea</option>
                                            <option>United States</option>
                                            <option>Albania</option>
                                            <option>Algeria</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label>City</label>
                                        <input class="form-control" type="text" placeholder="City">
                                    </div>
                                    <div class="col-md-6">
                                        <label>State</label>
                                        <input class="form-control" type="text" placeholder="State">
                                    </div>
                                    <div class="col-md-6">
                                        <label>ZIP Code</label>
                                        <input class="form-control" type="text" placeholder="ZIP Code">
                                    </div>
                                </div> -->
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="checkout-inner">
                            <div class="checkout-summary">
                                <h1>구매금액</h1>
                                
                                <p class="sub-total">상품 주문 금액<span class="sub-total-price">0</span></p>
                                <p class="ship-cost">배송비<span>100</span></p>
                                <h2>총 결제금액<span class="grand-total-price">100</span></h2>
                            </div>

                            <div class="checkout-payment">
                             
                                <div class="checkout-btn">
                                
                                	<button class="deliveryBtn"style="margin-bottom:5px">배송정보 입력</button>
                                    <button class="payOrderBtn" style="visibility:hidden">결제하기</button>
                                    
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Checkout End -->
        
        <!-- Footer Start -->
        <div class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h2>Get in Touch</h2>
                            <div class="contact-info">
                                <p><i class="fa fa-map-marker"></i>123 E Store, Los Angeles, USA</p>
                                <p><i class="fa fa-envelope"></i>email@example.com</p>
                                <p><i class="fa fa-phone"></i>+123-456-7890</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h2>Follow Us</h2>
                            <div class="contact-info">
                                <div class="social">
                                    <a href=""><i class="fab fa-twitter"></i></a>
                                    <a href=""><i class="fab fa-facebook-f"></i></a>
                                    <a href=""><i class="fab fa-linkedin-in"></i></a>
                                    <a href=""><i class="fab fa-instagram"></i></a>
                                    <a href=""><i class="fab fa-youtube"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h2>Company Info</h2>
                            <ul>
                                <li><a href="">About Us</a></li>
                                <li><a href="">Privacy Policy</a></li>
                                <li><a href="">Terms & Condition</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h2>Purchase Info</h2>
                            <ul>
                                <li><a href="">Pyament Policy</a></li>
                                <li><a href="">Shipping Policy</a></li>
                                <li><a href="">Return Policy</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="row payment align-items-center">
                    <div class="col-md-6">
                        <div class="payment-method">
                            <h2>We Accept:</h2>
                            <img src="/resources/template/img/payment-method.png" alt="Payment Method" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="payment-security">
                            <h2>Secured By:</h2>
                            <img src="/resources/template/img/godaddy.svg" alt="Payment Security" />
                            <img src="/resources/template/img/norton.svg" alt="Payment Security" />
                            <img src="/resources/template/img/ssl.svg" alt="Payment Security" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->
        
        <!--Basket Modal  -->
        <div class="modal" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">상품결제</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <p class="errorMsg"></p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		
        <!-- Footer Bottom Start -->
        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 copyright">
                        <p>Copyright &copy; <a href="https://htmlcodex.com">HTML Codex</a>. All Rights Reserved</p>
                    </div>

                    <div class="col-md-6 template-by">
                        <p>Template By <a href="https://htmlcodex.com">HTML Codex</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Bottom End -->       
        
        <!-- Back to Top -->
        <a href="" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
        
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="${contextPath}/resources/template/lib/easing/easing.min.js"></script>
        <script src="${contextPath}/resources/template/lib/slick/slick.min.js"></script>
        
        <!-- Template Javascript -->
        <script src="${contextPath}/resources/template/js/main.js"></script>
        
        <!--add js  -->
        <script src="${contextPath}/resources/order/checkout.js?var=3"></script>
         <script src="${contextPath}/resources/basket/wish.js?ver=9"></script>
         <script src="${contextPath}/resources/basket/basket.js?ver=9"></script>
        <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    </body>
   
    <script>
    $(document).ready(function(){
    	showShipInfo();
       
    });
    /* CSRF 데이터 변수 저장 */
    var csrfHeaderName="${_csrf.headerName}";
    var csrfTokenValue="${_csrf.token}";

    
    var cust_id = "${memberId}";
    var orderInfo;
    var order_seq = ${order_seq};
	
   
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
	
    $(".deliveryBtn").on('click',function(){
    	var addressInfo ={
    			 regUser:cust_id,
    			 cust_name:$(".writeName").val(),
    			 cust_phone:$(".writePhone").val(),
    			 cust_addr_post:$(".writeAddrPost").val(),
    			 cust_addr_city:$(".writeAddrCity").val(),
    			 cust_addr_detail:$(".writeAddrDetail").val(),
    			 order_seq:order_seq
    		}
    	csrf={"csrfHeaderName":csrfHeaderName,
   				"csrfTokenValue":csrfTokenValue};
    	checkoutService.insertShipInfo(addressInfo,csrf);
    	
    	
    	$(".payOrderBtn").css("visibility", 'visible')
    	})
    
    

    function showShipInfo(){
    	
    	checkoutService.getShipInfo(cust_id,order_seq,function(checkoutInfo){
    		orderInfo = checkoutInfo;
			var address=$(".addressInfomation");
			var str="";
			
				str+="<h2>배송정보</h2>"
	                +"   <div class='row'>"
	                +"        <div class='col-md-6'>"
	                +"            <label>이름</label>"		               
	                +"             <input class='form-control writeName' type='text' value='"+checkoutInfo.NAME+"'>"
	                +"        </div>"
	           /*      +"    <div class='col-md-6'>"
	                +"    	<label>Last Name</label>"
	                +"    	<input class='form-control writeLname' type='text' value='"+checkoutInfo.NAME+"'>"
	                +"    </div>" */
	                +"    <div class='col-md-6'>"
	                +"      <label>E-mail</label>"
	                +"      <input class='form-control writeEmail' type='text' value='"+checkoutInfo.EMAIL+"'>"
	                +"    </div>"
	                +"    <div class='col-md-6'>"
	                +"    	<label>전화번호</label>"                                           
	                +"    	<input class='form-control writePhone' type='text' value='"+checkoutInfo.PHONE+"'>"
	                +"	  </div>"
	                +"	  <div class='col-md-12'>"
           		    +"		<label>Address</label>"
           		    +"		<input class='form-control writeAddrDetail' type='text' value='"+checkoutInfo.ADDR_DETAIL+"'>"		
           		    +"	  </div>"
                    +"    <div class='col-md-6'>"
                    +"    	<label>Country</label>"
                    +"      <select class='custom-select writeNation'>"
                    +"         <option selected>South Korea</option>"
                    +"         <option>United States</option>"
                    +"    	</select>"
                    +" 	  </div>"
                    +"    <div class='col-md-6'>"
                    +"    	<label>City</label>"
                    +"      <input class='form-control writeAddrCity' type='text' value='"+checkoutInfo.ADDR_CITY+"'>"
                    +"    </div>"
                    +"    <div class='col-md-6'>"
                    +"     <label>State</label>"
                    +"     <input class='form-control writeAddrState' type='text' value='"+checkoutInfo.ADDR_CITY+"'>"
                    +"  </div>"
                    +" <div class='col-md-6'>"
                    +"     <label>ZIP Code</label>"
                    +"     <input class='form-control writeAddrPost' type='text' value='"+checkoutInfo.ADDR_POST+"'>"
                    +" </div>"
                    +"</div>"
              address.html(str);
              
              var shippingCost = 100;
              $(".grand-total-price").html(checkoutInfo.TOTAL_PRICE);
              $(".sub-total-price").html(checkoutInfo.TOTAL_PRICE-shippingCost);
                    
		})
	}
    
   
    $('.payOrderBtn').on('click', function (){
    checkoutService.getShipInfo(cust_id,order_seq,function(checkoutInfo){
    	orderInfo = checkoutInfo;
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp03498848'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문상품번호: '+orderInfo.ORDER_SEQ,
	    amount : orderInfo.TOTAL_PRICE,
	    buyer_email : orderInfo.EMAIL,
	    buyer_name : orderInfo.NAME,
	    buyer_tel : "0"+orderInfo.PHONE,
	    buyer_addr : orderInfo.ADDR_CITY+" "+orderInfo.ADDR_DETAIL,
	    buyer_postcode : orderInfo.ADDR_POST,
	    m_redirect_url : 'https://www.yourdomain.com/payments/complete',
	    custom_data : {cust_id:cust_id,order_seq:orderInfo.ORDER_SEQ}
	}, function(rsp) {
		csrf={"csrfHeaderName":csrfHeaderName,
   				"csrfTokenValue":csrfTokenValue};
				//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
				if ( rsp.success ) {
					
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    
					
					//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
					$.ajax({
						url:"/checkout/payments/complete",
						type:'POST',						
						data:JSON.stringify({
							imp_uid : rsp.imp_uid,
							paid_amount :rsp.paid_amount,
							status:rsp.status,
							success:rsp.success,
							custom_data:rsp.custom_data					
						}),
						contentType: "application/json; charset=utf-8",
						beforeSend:function(xhr){
							xhr.setRequestHeader(csrf.csrfHeaderName, csrf.csrfTokenValue);
						},
						success: function(result){
							location.href = "/cust/my-account"},
						error:function(log){console.log("실패 "+log)}
			    });
					
			      
		}else {
	        var msg = rsp.error_msg;
	        $(".modal").modal("show");
		    $(".errorMsg").text(msg);
	    }
	   
		
	}) ; 
   });
 });
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
</html>