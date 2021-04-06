<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- <!DOCTYPE html>
<html lang="en">
    <head>
    	
    
        Favicon
		<link href="/resources/template/img/favicon.ico" rel="icon">
		
		Google Fonts
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap" rel="stylesheet">
		
		CSS Libraries
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
		<link href="/resources/template/lib/slick/slick.css" rel="stylesheet">
		<link href="/resources/template/lib/slick/slick-theme.css" rel="stylesheet">
		
		Template Stylesheet
		<link href="/resources/template/css/style.css" rel="stylesheet">
    </head>

    <body>
        Top bar Start
        <div class="top-bar">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <i class="fa fa-envelope"></i>
                        support@email.com
                    </div>
                    <div class="col-sm-6">
                        <i class="fa fa-phone-alt"></i>
                        +012-345-6789
                    </div>
                </div>
            </div>
        </div>
        Top bar End
        
        Nav Bar Start
        <div class="nav">
            <div class="container-fluid">
                <nav class="navbar navbar-expand-md bg-dark navbar-dark">
                    <a href="#" class="navbar-brand">MENU</a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto">
                            <a href="index.html" class="nav-item nav-link">Home</a>
                            <a href="product-list.html" class="nav-item nav-link active"></a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">상품</a>
                                <div class="dropdown-menu">
                                    <a href="wishlist.html" class="dropdown-item">카테고리 전체</a>
                                    <a href="wishlist.html" class="dropdown-item">식품</a>
                                    <a href="contact.html" class="dropdown-item">가구</a>
                                </div>
                            </div>
                            <a href="checkout.html" class="nav-item nav-link">Contect Us</a>
                            
                        </div>
                        <div class="navbar-nav ml-auto">
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">User Account</a>
                                <div class="dropdown-menu">
                                    <a href="#" class="dropdown-item">Login</a>
                                    <a href="#" class="dropdown-item">Register</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        Nav Bar End      
        
        Bottom Bar Start
        <div class="bottom-bar">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-md-3">
                        <div class="logo">
                            <a href="index.html">
                                <img src="/resources/template/img/logo.png" alt="Logo">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        Bottom Bar End  
        
        Breadcrumb Start
        <div class="breadcrumb-wrap">
            <div class="container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">메인</a></li>
                    <li class="breadcrumb-item"><a href="/goods">상품</a></li>
                    <li class="breadcrumb-item active">상품상세</li>
                </ul>
            </div>
        </div> -->
        <%@include file="../include/header.jsp" %>
        
        <!-- Breadcrumb End -->
        
        <!-- Product Detail Start -->
        <div class="product-detail">
        	
        	<!-- hidden field -->
        	<input type="hidden" id="memberId" name="memberId" value="${memberId }">
        	<input type="hidden" id="pageNum" name="pageNum" value="1">
        	<input type="hidden" id="goodsSeq" name="goodsSeq" value="${goodsDetail.GOODS_SEQ }">
        	<input type="hidden" id="star" name="star" value="${goodsDetail.STAR }">
        	<input type="hidden" id="goodsName" value="${goodsDetail.GOODS_NAME }">
        	<input type="hidden" id="category" value="${goodsDetail.CATEGORY }">
        	
        
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="product-detail-top">
                            <div class="row align-items-center">
                                <div class="col-md-5">
                                    <div class="product-slider-single normal-slider">
                                    	<c:forEach var="thumbList" items="${thumbList }">
                                        <img src="${thumbList.IMG_URL}" alt="Product Image">
                                        </c:forEach>
                                    </div>
                                    <div class="product-slider-single-nav normal-slider">
                                    	<c:forEach var="thumbList" items="${thumbList }">
                                        <div class="slider-nav-img"><img src="${thumbList.IMG_URL}" alt="Product Image" onerror="this.src='/resources/upload/img/default/no_img.jpg'"></div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <div class="product-content" style="left: 70px;">
                                        <div class="title"><h2>${goodsDetail.GOODS_NAME }</h2></div>
                                        <div class="ratting" id="goods_ratting_div"></div>
                                        <div class="price">
                                            <h4>가격:</h4>
                                            <p class="goods-price">${goodsDetail.PRICE }</p><a>원</a>
                                        </div>
                                        <div class="quantity">
                                            <h4>수량:</h4>
                                            <div class="qty goodsQty">
                                                <button class="btn-minus"><i class="fa fa-minus"></i></button>
                                                <input type="text"  class="orderQty" value="1">
                                                <button class="btn-plus"><i class="fa fa-plus"></i></button>
                                            </div>
                                        </div>
                                        <c:if test="${goodsDetail.REQ_OPTION eq 'Y' }">
                                        <div class="p-size">
                                            <h4>옵션:</h4>
                                            
                                            <div class="btn-group dropdown">
                                                <select class="form-control nav-link dropdown-toggle" id="goodsReqOptionSeq" name="goodsReqOptionSeq" style="border-color:rgb(255, 111, 97)">
                                                	<option>필수선택</option>
                                                	<c:forEach var="optionList" items="${optionList }">
                                                    <option value="${optionList.GOODS_REQ_OPTION_SEQ }">${optionList.OPTION_NAME } / + ${optionList.PRICE } 원</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        </c:if> 
                                        
                                        
                                        
                                        <div class="action">
                                            <a class="btn addCart" ><i class="fa fa-shopping-cart"></i>장바구니</a>
                                            <a class="btn buyNow" href="#"><i class="fa fa-shopping-bag"></i>바로구매</a>
                                         	<a class="btn wish" href="#" style="margin-left: 10px;"><i class="far fa-heart wishHeart"></i>담아두기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row product-detail-bottom">
                            <div class="col-lg-12">
                                <ul class="nav nav-pills nav-justified">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="pill" href="#description">상품설명</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#reviews">리뷰</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="pill" href="#specification">배송/교환/반품 안내</a>
                                    </li>
                                    
                                </ul>

                                <div class="tab-content">
                                    <div id="description" class="container tab-pane active">
                                        <h4>상품 설명</h4>
                                            ${goodsDetail.GOODS_DETAIL } 
                                    </div>
                                    <div id="specification" class="container tab-pane fade">
                                        <h4>Product specification</h4>
                                        <ul>
                                            <li>Lorem ipsum dolor sit amet</li>
                                            <li>Lorem ipsum dolor sit amet</li>
                                            <li>Lorem ipsum dolor sit amet</li>
                                            <li>Lorem ipsum dolor sit amet</li>
                                            <li>Lorem ipsum dolor sit amet</li>
                                        </ul>
                                    </div>
                                </div>
                                <br/><br/><br/>
                                <div class="tab-content"> 
                                    <div id="reviews" class="container">
                                        <div class="container" id="commentDiv">
                                        </div>
                                        
                                        <!-- Pagination -->
										<div class="col-md-12" id="pageDiv"></div>
										
										<sec:authorize access="isAuthenticated()">
                                        <div class="reviews-submit" id="write_review_div">
                                            <h4>Give your Review:</h4>
                                            <div class="nav-item dropdown">
                                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" id="comment_insert_star_a" data-selected-star="5">
                                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                                </a>
                                                <div class="dropdown-menu">
                                                    <a class="dropdown-item" onclick="selectedStar('insert', 5);"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></a>
                                                    <a class="dropdown-item" onclick="selectedStar('insert', 4);"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="far fa-star"></i></a>
                                                    <a class="dropdown-item" onclick="selectedStar('insert', 3);"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></a>
                                                    <a class="dropdown-item" onclick="selectedStar('insert', 2);"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></a>
                                                    <a class="dropdown-item" onclick="selectedStar('insert', 1);"><i class="fa fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></a>
                                                </div>
                                            </div>
                                            
                                            <div class="row form">
                                                <div class="col-sm-12">
                                                    <textarea placeholder="Review" id="comment_memo"></textarea>
                                                </div>
                                                <div class="col-sm-12">
                                                    <button onclick="commentInsert();">Submit</button>
                                                </div>
                                            </div>
                                        </div>
                                        </sec:authorize>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>   
  
                    
                    <!-- Side Bar Start -->
                    <div class="col-lg-4 sidebar">
                        <div class="sidebar-widget widget-slider">
                            <h2 class="title"></h2>
                            <!-- <div class="sidebar-slider normal-slider"> 액션 슬라이드-->
                            <div>
                                <div class="product-item">
                                    <div class="product-image">
                                        <a href="product-detail.html">
                                            <img src="/resources/image/side_menu/어디지.png" alt="Product Image" style="overflow: hidden;height:400px;">
                                        </a>   
                                    </div>
                                </div>

                                <div class="product-item">
                                    <div class="product-image">
                                        <a href="product-detail.html">
                                            <img src="/resources/image/side_menu/풍경.jpg" alt="Product Image" style="overflow: hidden;height:400px;">
                                        </a>   
                                    </div>
                                </div>

                                <div class="product-item">
                                    <div class="product-image">
                                        <a href="product-detail.html">
                                            <img src="/resources/image/side_menu/북극곰과팽귄.jpg" alt="Product Image" style="overflow: hidden;height:400px;">
                                        </a>   
                                    </div>
                                </div>

                                <div class="product-item">
                                    <div class="product-image">
                                        <a href="product-detail.html">
                                            <img src="/resources/image/side_menu/WWF북극곰.png" alt="Product Image" style="overflow: hidden;height:400px;">
                                        </a>   
                                    </div>
                                </div>
                                
                                <div class="product-item">
                                    <div class="product-image">
                                        <a href="product-detail.html">
                                            <img src="/resources/image/side_menu/WWF환경파괴.png" alt="Product Image" style="overflow: hidden;height:400px;">
                                        </a>   
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="sidebar-widget brands">
                            <h2 class="title">멋진 단체들</h2><br/>
                            <ul>
                                <li><a href="#">WWF </a></li>
                                <li><a href="#">환경부 </a></li>
                                <li><a href="#">GREEN PEACE</a></li>
                                <li><a href="#">푸른아시아</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Side Bar End -->
                </div>
            </div>
        </div>
        <!-- Product Detail End -->
        
        
        
        
        
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
        
        <!--Basket Modal  -->
        <div class="modal basketModal" tabindex="-1" role="dialog">
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
        <!--Wish Modal  -->
        <div class="modal wishModal" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">담아두기</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <p class="wishAlert">담아두기에 해당 상품이 저장되었습니다</p>
		      </div>
		      <div class="modal-footer">
		      <button type="button" class="btn btn-primary moveWish">담아두기 이동하기</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">계속쇼핑하기</button>
		        
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
						<div id="detail_chat"></div>
					</div>
					<div class="modal-footer">
						<span class="basic">
						<button type="button" id="close" class="btn close3" data-dismiss="modal">닫기</button>
						</span>
					</div>
				</div>
			</div>
		</div>
        
        <!-- Back to Top -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
        
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="${contextPath}/resources/template/lib/easing/easing.min.js"></script>
        <script src="${contextPath}/resources/template/lib/slick/slick.min.js"></script>
        
        <!-- Template Javascript -->
        <script src="${contextPath}/resources/template/js/main.js"></script>
        
        <script src="${contextPath}/resources/js/common/common.js"></script>
        <script src="${contextPath}/resources/js/goods/goods.js"></script>
        <script src="${contextPath}/resources/basket/basket.js?ver=10"></script>
        <script src="${contextPath}/resources/basket/wish.js?ver=10"></script>
        <script src="${contextPath}/resources/order/checkout.js?ver=3"></script>
        <script>
        $(document).ready(function(){
        	var star = $('#star').val();
        	var rattingHtml = makeStarIconHtml(star);
        	$('#goods_ratting_div').html(rattingHtml);
        	
        	movePage(1);
        	
        	var category = document.getElementById('category').value;
        	var goodsName = document.getElementById('goodsName').value;
        	
        	if(!category && category == 1){
        		var msg = '신선하고 맛 좋은 ' + goodsName + ' 팝니다 ' + goodsName.substr(0,1) + goodsName.substr(0,1) + goodsName.substr(0,1) + goodsName.substr(0,1) + goodsName + '팔아요'; 
        		
	        	speak(msg, {
	                rate: 10,
	                pitch: 2,
	            });
        	}
     	});
        
        function speak(text, opt_prop) {
            if (typeof SpeechSynthesisUtterance === "undefined" || typeof window.speechSynthesis === "undefined") {
                console.log("이 브라우저는 음성 합성을 지원하지 않습니다.")
                return
            }
            
            window.speechSynthesis.cancel(); // 현재 읽고있다면 초기화

            const prop = opt_prop || {};

            const speechMsg = new SpeechSynthesisUtterance();
            speechMsg.rate = prop.rate || 1; // 속도: 0.1 ~ 10      
            speechMsg.pitch = prop.pitch || 1; // 음높이: 0 ~ 2
            speechMsg.lang = prop.lang || "ko-KR";
            speechMsg.text = text;
            
            // SpeechSynthesisUtterance에 저장된 내용을 바탕으로 음성합성 실행
            window.speechSynthesis.speak(speechMsg);
        }
        
        /* CSRF 데이터 변수 저장 */
        var csrfHeaderName="${_csrf.headerName}";
        var csrfTokenValue="${_csrf.token}";
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
    	
    	heartChaeck(cust_id);
    	function heartChaeck(cust_id) {
				       		orderinfo={
				    	    		cust_id:"${memberId}",
				    	    		qty:$(".orderQty").val(),
				    	    		orderOption:$("#goodsReqOptionSeq option:selected").val(),    	    		
				    	    		goods_seq:"${goodsDetail.GOODS_SEQ }"
				    	    };
				       		
				       		csrf={"csrfHeaderName":csrfHeaderName,
				       				"csrfTokenValue":csrfTokenValue};
				       		
				    	   
				    		wishService.addGoodsAtWish(orderinfo,csrf,function(result){
								var check = result==="exist";
								
				    		if(check){
				    			 $(".wishHeart").attr('class','fa fa-heart');
				   			}
    					})
    		}
    	
    	
    	
       	//리뷰 페이지 이동 
    	function movePage(pageNum){
    		selectedPage(pageNum);
    		callGetCommentList();
    	}
       	
       	//선택상품 장바구니에 담기
       	$('.addCart').on("click",function(){
       		orderinfo={
    	    		cust_id:"${memberId}",
    	    		qty:$(".orderQty").val(),
    	    		orderOption:$("#goodsReqOptionSeq option:selected").val(),    	    		
    	    		goods_seq:"${goodsDetail.GOODS_SEQ }"
    	    };
       		csrf={"csrfHeaderName":csrfHeaderName,
       				"csrfTokenValue":csrfTokenValue};
       		
    	   
    		basketService.addGoodsAtBasket(orderinfo,csrf,function(result){
				var check = result==="exist";
				
    			if(check){
    				var basketStr = "이미  존재하는 상품입니다."
    				$(".basketAlert").text(basketStr);
    				//$(".moveBasket").css("visibility", 'hidden')
    			}
    			
    			$(".basketModal").modal("show");    			
    			cartCnt(cust_id)
    			
    			$('.moveBasket').on("click",function(){
    				window.location.href = '/orders/basket/list';
    			})
    		});
    		
       	})
       	
       	$('.buyNow').on("click",function(){
       		orderinfo={
    	    		cust_id:"${memberId }",
    	    		qty:$(".orderQty").val(),
    	    		orderOption:$("#goodsReqOptionSeq option:selected").val(),
    	    		total_price:Number($(".orderQty").val())*Number("${goodsDetail.PRICE }"),
    	    		goods_seq:"${goodsDetail.GOODS_SEQ }"
    	    } 
       		csrf={"csrfHeaderName":csrfHeaderName,
       				"csrfTokenValue":csrfTokenValue};
		
		
	
		checkoutService.orderNow(orderinfo,csrf);
       	})
       	
       	
       	    //하트
				$('.wish').on('click', function () {
					
				    var $button = $(this).children("i");
				    if ($button.hasClass('far fa-heart')) {
				        $button.attr('class','fa fa-heart');
				        //추가
					       		orderinfo={
					    	    		cust_id:"${memberId}",
					    	    		qty:$(".orderQty").val(),
					    	    		orderOption:$("#goodsReqOptionSeq option:selected").val(),    	    		
					    	    		goods_seq:"${goodsDetail.GOODS_SEQ }"
					    	    };
					       		csrf={"csrfHeaderName":csrfHeaderName,
					       				"csrfTokenValue":csrfTokenValue};
					       		
					    	   
					    		wishService.addGoodsAtWish(orderinfo,csrf,function(result){
									var check = result==="exist";
									
					    			if(check){
					    				var WishStr = "해당상품이 담아두기에 존재 합니다."
					    				$(".WishAlert").text(WishStr);
					    				//$(".moveBasket").css("visibility", 'hidden')
					    			}
					    			
					    			$(".wishModal").modal("show");    			
					    			heartCnt(cust_id);
					    			$('.moveWish').on("click",function(){
					    				window.location.href = '/orders/basket/wishlist';
					    			})
					    		});
					    	
				    }else if ($button.hasClass('fa fa-heart')) {
				        $button.attr('class','far fa-heart');
				        //삭제
				        var goods_seq =  orderinfo.goods_seq;
				        cust_id="${memberId}";
				       
						delWishGoods(cust_id,goods_seq);
				    }
				
				})
				      //담아두기에서 상품 삭제
					function delWishGoods(cust_id,goods_seq){
						csrf={"csrfHeaderName":csrfHeaderName,
				   				"csrfTokenValue":csrfTokenValue};
						
						wishService.delWishGoods(cust_id,goods_seq,csrf,function(result){
							
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
				
			
				
				$(".close3").on("click",function(){
					//display
					$(".modal").hide();
					location.reload();
				});
			</script>
		<!--End of Tawk.to Script-->
    </body>
</html>
