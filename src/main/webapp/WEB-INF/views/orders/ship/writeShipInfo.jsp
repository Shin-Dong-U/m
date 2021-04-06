<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../../include/header.jsp" %>
        <!-- Bottom Bar End --> 
        
        <!-- Breadcrumb Start -->
        <div class="breadcrumb-wrap">
            <div class="container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="">Home</a></li>
                    <li class="breadcrumb-item"><a href="">Products</a></li>
                    <li class="breadcrumb-item active">Checkout</li>
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
                                <!-- <h2>Billing Address</h2>
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
                                            <option selected>United States</option>
                                            <option>Afghanistan</option>
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
                                    <div class="col-md-12">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="newaccount">
                                            <label class="custom-control-label" for="newaccount">Create an account</label>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="shipto">
                                            <label class="custom-control-label" for="shipto">Ship to different address</label>
                                        </div>
                                    </div>
                                </div> -->
                            </div>

                            <div class="shipping-address">
                                <h2>Shipping Address</h2>
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
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="checkout-inner">
                            <div class="checkout-summary">
                                <h1>주문 금액</h1>
                                
                                <p class="sub-total">Sub Total<span class="sub-total-price">$99</span></p>
                                <p class="ship-cost">Shipping Cost<span>100</span></p>
                                <h2>Grand Total<span class="grand-total-price">$100</span></h2>
                            </div>

                            <div class="checkout-payment">
                                <!-- <div class="payment-methods">
                                    <h1>Payment Methods</h1>
                                    <div class="payment-method">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" id="payment-1" name="payment">
                                            <label class="custom-control-label" for="payment-1">Paypal</label>
                                        </div>
                                        <div class="payment-content" id="payment-1-show">
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tincidunt orci ac eros volutpat maximus lacinia quis diam.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="payment-method">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" id="payment-2" name="payment">
                                            <label class="custom-control-label" for="payment-2">Payoneer</label>
                                        </div>
                                        <div class="payment-content" id="payment-2-show">
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tincidunt orci ac eros volutpat maximus lacinia quis diam.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="payment-method">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" id="payment-3" name="payment">
                                            <label class="custom-control-label" for="payment-3">Check Payment</label>
                                        </div>
                                        <div class="payment-content" id="payment-3-show">
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tincidunt orci ac eros volutpat maximus lacinia quis diam.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="payment-method">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" id="payment-4" name="payment">
                                            <label class="custom-control-label" for="payment-4">Direct Bank Transfer</label>
                                        </div>
                                        <div class="payment-content" id="payment-4-show">
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tincidunt orci ac eros volutpat maximus lacinia quis diam.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="payment-method">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" id="payment-5" name="payment">
                                            <label class="custom-control-label" for="payment-5">Cash on Delivery</label>
                                        </div>
                                        <div class="payment-content" id="payment-5-show">
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tincidunt orci ac eros volutpat maximus lacinia quis diam.
                                            </p>
                                        </div>
                                    </div>
                                </div>-->
                                <div class="checkout-btn">
                                    <button class="writeShipInfoBtn">배송정보 입력</button>
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
	
	heartCnt(cust_id);
	    
		function heartCnt(cust_id) {
			var heartCount = 0;
			wishService.countWishGoods(cust_id,function(result){
				heartCount="("+result+")";
				$(".wishCntBtn").text(heartCount);
			});
		}
    
	cartCnt(cust_id);
   
	function cartCnt(cust_id) {
		var cartCount = 0;
		basketService.countBasketGoods(cust_id,function(result){
			cartCount="("+result+")";
			$(".cartCntBtn").text(cartCount);
		});
	}
	
    $(".writeShipInfoBtn").on('click',function(){
    	var csrf={"csrfHeaderName":csrfHeaderName,
   				"csrfTokenValue":csrfTokenValue};
    	var shipInfo ={
    			 editUser:cust_id,
    			 order_seq:order_seq,
    			 invoice_no:$(".invoice_no").val(),
    			 delivery_company:$(".delivery_company").val(),
    			 sender_name:$(".sender_name").val(),
    		     sender_phone:$(".sender_phone").val(),
    		     sender_addr_post:$(".sender_addr_post").val(),
    		     sender_addr_city:$(".sender_addr_city").val(),
    		     sender_addr_detail:$(".sender_addr_detail").val()
    			 
  			}
    	checkoutService.insertShipInfoCom(shipInfo,csrf);
    	
    })
    
    

    function showShipInfo(){
    	
    	checkoutService.getShipInfo(cust_id,order_seq,function(checkoutInfo){
    		orderInfo = checkoutInfo;
			var address=$(".addressInfomation");
			var str="";
			/* (주문번호: "+checkoutInfo.ORDER_SEQ+") */
				str+="<h2>배송 정보</h2>"
					+"	<div class='divBind'>	"
					+"  	 <div class='row'>"
	                +"    	    	<div class='col-md-6'>"
	                +"  	           <label>송장번호</label>"		               
	                +"  	           <input class='form-control invoice_no' type='text' placeholder='송장번호를 입력해주세요' >"
	                +"  	        </div>"
	                +"  	  		<div class='col-md-6'>"
	                +"    		 		<label>배송회사</label>"
	                +"   		   		<input class='form-control delivery_company' type='text' placeholder='배송회사를 입력해주세요' >"
	                +"   	 		</div>"
	                +"  	</div>"
	                +"  	 <div class='row'>"
	                +"    	    	<div class='col-md-6'>"
	                +"  	           <label>보내는 사람</label>"		               
	                +"  	           <input class='form-control invoice_no' type='text' placeholder='업체명을 입력해주세요' >"
	                +"  	        </div>"
	                +"  	  		<div class='col-md-6'>"
	                +"    		 		<label>전화번호</label>"
	                +"   		   		<input class='form-control delivery_company' type='text' placeholder='배송회사를 입력해주세요' >"
	                +"   	 		</div>"
	                +"  	</div>"
	                +"  	 <div class='row'>"
	                +"    	    	<div class='col-md-6'>"
	                +"  	           <label>우편번호</label>"		               
	                +"  	           <input class='form-control sender_addr_post' type='text' placeholder='우편번호을 입력해주세요' >"
	                +"  	        </div>"
	                +"  	  		<div class='col-md-6'>"
	                +"    		 		<label>시/도</label>"
	                +"   		   		<input class='form-control sender_addr_city' type='text' placeholder='시/도를 입력해주세요' >"
	                +"   	 		</div>"
	                +"  	</div>"
	                +"	  <div class='col-md-12'>"
           		    +"		<label>상세주소</label>"
           		    +"		<input class='form-control sender_addr_detail' type='text' placeholder='상세주소' >"		
           		    +"	  </div>"
	                +"  </div>"
	                +"    <hr>"
	                +"   <div class='row'>"
	                +"        <div class='col-md-6'>"
	                +"            <label>Name</label>"		               
	                +"             <input class='form-control writeName' type='text' value='"+checkoutInfo.NAME+"' readonly>"
	                +"        </div>"
	                +"    <div class='col-md-6'>"
	                +"      <label>E-mail</label>"
	                +"      <input class='form-control writeEmail' type='text' value='"+checkoutInfo.EMAIL+"' readonly>"
	                +"    </div>"
	                +"    <div class='col-md-6'>"
	                +"    	<label>Mobile No</label>"                                           
	                +"    	<input class='form-control writePhone' type='text' value='"+checkoutInfo.PHONE+"' readonly>"
	                +"	  </div>"
	                +"	  <div class='col-md-12'>"
           		    +"		<label>Address</label>"
           		    +"		<input class='form-control writeAddrDetail' type='text' value='"+checkoutInfo.ADDR_DETAIL+"' readonly>"		
           		    +"	  </div>"
                    +"    <div class='col-md-6'>"
                    +"    	<label>Country</label>"
                    +"      <select class='custom-select writeNation' readonly>"
                    +"         <option selected readonly>South Korea</option>"
                    +"         <option>United States</option>"
                    +"    	</select>"
                    +" 	  </div>"
                    +"    <div class='col-md-6'>"
                    +"    	<label>City</label>"
                    +"      <input class='form-control writeAddrCity' type='text' value='"+checkoutInfo.ADDR_CITY+"' readonly>"
                    +"    </div>"
                    +"    <div class='col-md-6'>"
                    +"     <label>State</label>"
                    +"     <input class='form-control writeAddrState' type='text' value='"+checkoutInfo.ADDR_CITY+"' readonly>"
                    +"  </div>"
                    +" <div class='col-md-6'>"
                    +"     <label>ZIP Code</label>"
                    +"     <input class='form-control writeAddrPost' type='text' value='"+checkoutInfo.ADDR_POST+"' readonly>"
                    +" </div>"
                    +"</div>"
              address.html(str);
              
              var shippingCost = 100;
              $(".grand-total-price").html(checkoutInfo.TOTAL_PRICE);
              $(".sub-total-price").html(checkoutInfo.TOTAL_PRICE-shippingCost);
                    
		})
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
</html>