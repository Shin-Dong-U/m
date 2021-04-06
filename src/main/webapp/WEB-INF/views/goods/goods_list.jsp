<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ECO FRIENDS</title>
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
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">상품</a>
                                <div class="dropdown-menu">
                                	<a href="wishlist.html" class="dropdown-item">전체</a>
                                    <a href="wishlist.html" class="dropdown-item">Wishlist</a>
                                    <a href="login.html" class="dropdown-item">Login & Register</a>
                                    <a href="contact.html" class="dropdown-item">Contact Us</a>
                                </div>
                            </div>
                            <a href="my-account.html" class="nav-item nav-link">Contect Us</a>
                            
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
                    <li class="breadcrumb-item"><a href="#">상품</a></li>
                    <li class="breadcrumb-item active">상품리스트</li>
                </ul>
            </div>
        </div> -->
        <!-- Breadcrumb End -->
        <%@include file="../include/header.jsp" %>
        <!-- Product List Start -->
        <div class="product-view">
            <div class="container">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="product-view-top">
                               	<form id="searchForm" onsubmit="return false">
                               	<div class="row">
                               		<input type="hidden" id="pageNum" name="pageNum" value="">
                           			<input type="hidden" id="amount" name="amount" value="">
                                    <div class="col-md-2">
                                        <div class="product-short">
                                            <div class="dropdown">
                                        		<select class="dropdown-toggle" id="category" name="category">
												    	<option value="" selected>전체</option>
                                               		<c:forEach var="cate" items="${cateList }" >
											    		<option value="${cate.CATE_SEQ }" ${cri.category eq cate.CATE_SEQ ? 'selected' : ''}>${cate.CATE_NAME }</option>
                                               		</c:forEach>
												</select>
                                            </div>
                                        </div>
                                    </div>                                    
                                    <div class="col-md-3">
                                        <div class="product-search">
                                            <input type="text" id="keyword" name="keyword" value="${cri.keyword }" placeholder="상품명 검색">
                                            <button type="button" onclick="callGetGoodsList(true);"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                               	</div>
                                </form>
                            </div>
                        </div>
                        
                        <!-- Goods List -->
                        <div class="col-md-12"><div class="row" id="goods_list"></div></div>
                        
						<!-- Pagination Start -->
						<div class="col-md-12" id="pageDiv"></div>
                    </div>
                </div>           
            </div>
        </div>
        <!-- Product List End -->  
        
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
        <script>
        	$(document).ready(function(){
        		movePage(1);
        		$("#keyword").keydown(function(key) {
        			if (key.keyCode == 13) {
        				callGetGoodsList(true); 
       				}
       			});
        	});
        	
        	$('.all_cate_search').click(function(e){
    			mainSearch();
			});
    		
    		$('#main_search').keydown(function(key) {
    			if (key.keyCode == 13) { mainSearch(); }
   			});
        	
     		//header 검색바 사용.  키워드를 이용하여 전체 카테고리에 대한 검색을 실행.
        	function mainSearch(){
        		var keyword = $('#main_search').val();
				$('#category').val('').prop("selected",true);
				$('#keyword').val(keyword);
				
				movePage(1); 
        	}
        	
        	function movePage(pageNum){
        		selectedPage(pageNum);
        		callGetGoodsList();
        	}
        	
        	var cust_id = "${memberId}";
           	cartCnt(cust_id);
              
           	function cartCnt(cust_id) {
       			var cartCount = 0;
       			basketService.countBasketGoods(cust_id,function(result){
       				cartCount="("+result+")";
       				$(".cartCntBtn").text(cartCount);
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