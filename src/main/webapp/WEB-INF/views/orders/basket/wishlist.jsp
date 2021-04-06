<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../../include/header.jsp" %>
        <!-- Bottom Bar End -->
        
        <!-- Breadcrumb Start -->
        <div class="breadcrumb-wrap">
            <div class="container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="">홈</a></li>
                    <li class="breadcrumb-item"><a href="">상품목록</a></li>
                    <li class="breadcrumb-item active">담아두기</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->
        
        <!-- Cart Start -->
        <div class="cart-page">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="cart-page-inner">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>상품명</th>
                                            <th>가격</th>
                                            <!-- <th>수량</th>
                                            <th>상품별 합계</th> -->
                                            <th>장바구니</th>
                                            <th>제거</th>
                                        </tr>
                                    </thead>
                                    <tbody class="align-middle wishList">
                                                                         
                                    </tbody>
                                    
                                </table>
                            </div>
                        </div>
                    </div>
                   
                </div>
            </div>
        </div>
        <!-- Cart End -->
        
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
        
        <!--wish Modal  -->
        <div class="modal" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">장바구니</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <p class="basketAlert">장바구니에 해당 상품이 저장되었습니다</p>
		      </div>
		      <div class="modal-footer">
		      <button type="button" class="btn btn-primary moveBasket">장바구니 이동하기</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">계속쇼핑하기</button>
		        
		      </div>
		    </div>
		  </div>
		</div>
       
        
        <!-- Back to Top -->
        <a href="" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
        
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="${contextPath}/resources/template/lib/easing/easing.min.js"></script>
        <script src="${contextPath}/resources/template/lib/slick/slick.min.js"></script>
        
        <!-- Template Javascript -->
        <script src="${contextPath}/resources/template/js/main.js?var=8"></script>
        <script src="${contextPath}/resources/basket/basket.js?ver=9"></script>
        <script src="${contextPath}/resources/basket/wish.js?ver=10"></script>
		<script src="${contextPath}/resources/basket/transferTime.js"></script>
		<script src="${contextPath}/resources/order/checkout.js?ver=3"></script>
    </body>
    
    <script>
    
    var cust_id = "${memberId}";
	cartCnt(cust_id);
    $(document).ready(function(){
    	showList(cust_id);
    	wishCnt(cust_id);
    	//var cust_id $(".sessionId").val();
    });
    /* CSRF 데이터 변수 저장 */
    var csrfHeaderName="${_csrf.headerName}";
    var csrfTokenValue="${_csrf.token}";
    

    heartCnt(cust_id);
    
	function heartCnt(cust_id) {
		var heartCount = 0;
		wishService.countWishGoods(cust_id,function(result){
			heartCount="("+result+")";
			$(".wishCntBtn").text(heartCount);
		});
	}
    
    
  	//상품제목 <p>클릭시
 /*  	$('.basketList').on('click', "p",function () {
  		var goods_seq =  $(this).data("goods_seq");
      //현재 버튼클릭시 해당 goods_seq선택가능-->Ajax로 연동
		selectBasketGoods(goods_seq);    
    }); */
  	
  	
	$('.wishList').on('click',".delwishBtn",function(){
		//var goods_seq =  $(this).parents("td").children("p").data("goods_seq");
		var goods_seq =  $(this).data("goods_seq");
		delWishGoods(cust_id,goods_seq);
		showList();
	});
  	
  	
	//선택상품 장바구니에 담기
	function addGoodsAtWish(){
		wishService.addGoodsAtWish(function(){})
	}
	
	//장바구니 수량변경
	function changeQtyAtWish(cust_id,goods_seq,qty){
		wishService.changeQtyAtWish(cust_id,goods_seq,qty,function(){})
	}
	
	
	//장바구니에 구매된 상품 삭제
	function purGoodsAtWish(){
		wishService.purGoodsAtWish(function(result){
			
		})
	}
	
	//담아두기에서 상품 삭제
	function delWishGoods(cust_id,goods_seq){
		csrf={"csrfHeaderName":csrfHeaderName,
   				"csrfTokenValue":csrfTokenValue};
		wishService.delWishGoods(cust_id,goods_seq,csrf,function(result){
			showList();
		})
	}
	
	//장바구니에서 특정상품 선택
	/* function selectBasketGoods(goods_seq){
		basketService.getBasketGoods(goods_seq,function(){})
	} */
   
	//카트 상품 갯수 표시
	function cartCnt(cust_id) {
		var cartCount = 0;
		basketService.countBasketGoods(cust_id,function(result){
			cartCount="("+result+")";
			$(".cartCntBtn").text(cartCount);
		})
		
	}
	
	//담아두기 상품 갯수 표시
	function wishCnt(cust_id) {
		var wishCount = 0;
		wishService.countWishGoods(cust_id,function(result){
			wishCount="("+result+")";
			$(".wishCntBtn").text(wishCount);
		})
		
	}
	
	
  //담아두기 리스트 보기
		function showList(){		
			wishService.getWishList(cust_id,function(wishList){
				var wishListTable=$(".wishList");
				var str="";
				var firstTotal = 0;
				var firstGrandTotal = 0;
			
				for(var i=0,len=wishList.length||0;i<len;i++){
					 //"+basketList[i].IMG_URL+"
					str+="<tr>"
		                +"   <td>"
		                +"        <div class='img'>"
		                +"            <a href=''><img src='"+wishList[i].IMG_URL+"' alt='Image'></a>"		               
		                +"            <p data-goods_seq='"+wishList[i].GOODS_SEQ+"'>"+wishList[i].GOODS_NAME+"</p>"
		                +"        </div>"
		                +"    </td>"
		                +"    <td><span>"+wishList[i].PRICE+"</span></td>"
		                /* +"    <td>"
		                 +"        <div class='qty' data-goods_seq='"+wishList[i].GOODS_SEQ+"'>"
		                +"            <button class='btn-minus'><i class='fa fa-minus'></i></button>"
		                +"            <input type='text' class='orderQty' value='"+wishList[i].QTY+"'>"
		                +"            <button class='btn-plus'><i class='fa fa-plus'></i></button>"
		                +"        </div>" 
		                +"    </td>"
		                +"    <td><span class='calPrice"+[i]+"'>"+Number(wishList[i].PRICE)*Number(wishList[i].QTY)+"</span></td>" */       
		                //상품상세 버튼 가져오기
		               // +"    <td><button class='addCart' data-goods_seq='"+wishList[i].GOODS_SEQ+"'></button></td>"
		                +"    <td><button class='btn-cart addCart' data-goods_seq='"+wishList[i].GOODS_SEQ+"'>추가하기</button></td>"
		                +"    <td><button class='delwishBtn' data-goods_seq='"+wishList[i].GOODS_SEQ+"'>"
		                +"		<i class='fa fa-trash'></i></button>"
		                +"	  </td>"
               		    +"</tr>";
               		    
					firstTotal+= Number(wishList[i].PRICE)*Number(wishList[i].QTY);
						
				}
				wishListTable.html(str);
			})
		}
  
		
   
		//선택상품 장바구니에 담기
       	$(".wishList").on("click",".addCart",function(){
       		var goods_seq =  $(this).data("goods_seq");
       		orderinfo={
    	    		cust_id:"${memberId}",
    	    		qty:1,//$(".orderQty").val(),
    	    		orderOption:"",//$("#goodsReqOptionSeq option:selected").val(),    	    		
    	    		goods_seq:goods_seq
    	    };
       		csrf={"csrfHeaderName":csrfHeaderName,
       				"csrfTokenValue":csrfTokenValue};
       		
    	   
    		basketService.addGoodsAtBasket(orderinfo,csrf,function(result){
				var check = result==="exist";
				
    			if(check){
    				var basketStr = "해당상품이 장바구니에 존재 합니다."
    				$(".basketAlert").text(basketStr);
    				//$(".moveBasket").css("visibility", 'hidden')
    			}
    			
    			$(".modal").modal("show");    			
    			
    			$('.moveBasket').on("click",function(){
    				window.location.href = '/orders/basket/list';
    			})
    		});
    		
       	})
  
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