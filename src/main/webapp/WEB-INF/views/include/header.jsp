<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html lang="kr">
    <head>
        <meta charset="utf-8">
        <title>ECO FRIENDS</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="eCommerce HTML Template Free Download" name="keywords">
        <meta content="eCommerce HTML Template Free Download" name="description">
		<link rel="shortcut icon" href="data:image/x-icon" type="image/x-icon">
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

        <style>
			/* Account - Detail */
			#confirm_check {
				display: none
			}
			#test {
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
				text-align:center;
			}
			
			.shipSubBind{
				display: flex;
				flex-direction:column;
				justify-content:center;
				align-items:center;
				
			}
			
			.shipCheck{
				border:solid 8px #90c62b;
				border-radius: 20%;
			}
			
			.shipYet{
				border:solid 8px rgba(0,0,0,0.5);
				border-radius: 20%;
			}
			
			
			.shipBind{
			display: flex;
			justify-content: space-between;
			margin: 0 30px 0 30px;
			}
			
			.shipLine{
			border: 2px solid rgba(0,0,0,0.5);
			margin: 0 70px 30px 70px ;
			border-radius:50px;
			}
			
			.shipCircle{
			width:30px;
			height:30px;
			background-color:#90c62b;
			border-radius:50%;
			}
			
		
			
		
	</style>

        <link href="${contextPath}/resources/template/css/style.css" rel="stylesheet">

    </head>

    <body>
        <!-- Top bar Start -->
        <!-- <div class="top-bar">
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
        </div> -->
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
                            <!-- <a href="index.html" class="nav-item nav-link">Home</a> -->
                            
                            <div class="nav-item dropdown">
                            <a href="/goods" class="nav-link dropdown-toggle " data-toggle="dropdown" aria-expanded="false">상품</a>
                                <div class="dropdown-menu">
                                    <a href="/goods?category=1" class="dropdown-item">식품</a>
                                    <a href="/goods?category=2" class="dropdown-item">가구</a>
                                    <a href="/goods?category=3" class="dropdown-item">의류</a>
                                    <a href="/goods?category=4" class="dropdown-item">생활용품</a>
                                    <a href="/goods?category=5" class="dropdown-item">잡화</a>
                                    <a href="/goods?category=21" class="dropdown-item">뷰티</a>
                                    <a href="/goods?category=22" class="dropdown-item">헬스/건강식품</a>
                                    <a href="/goods?category=23" class="dropdown-item">주방용품</a>
                                </div>
                            </div>
                      
  <!-- member5 pw5  -> 인증된 사용자일경우, 들어가게 .... -->    
  <!-- admin1 pw1 -->   
  <!--  http://localhost/cust/account-->                   
                            <a href="/orders/basket/list" class="nav-item nav-link">장바구니</a>
                            <a href="/cust/my-account" class="nav-item nav-link">마이페이지</a>
                            <sec:authorize access="isAnonymous()">
										<a href="/home/login" class="nav-item nav-link">로그인</a>
										<a href="/home/register" class="nav-item nav-link">회원가입</a>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
										<a class="nav-item nav-link logoutBtn">로그아웃</a>
									</sec:authorize>
									<form action="/sample/logout" method="post" class="logoutForm">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									</form>
                            <div class="nav-item dropdown">
                                <a href="" class="nav-link dropdown-toggle" data-toggle="dropdown">More Pages</a>
                                <div class="dropdown-menu">
                                    <!-- <a href="wishlist.html" class="dropdown-item">Wishlist</a> -->
                                    <a href="login.html" class="dropdown-item">Login & Register</a>
                                    <a href="/cust/my-account" class="dropdown-item">마이페이지</a>
                                </div>
                            </div>
                        </div>
                        <div class="navbar-nav ml-auto">
                            <div class="nav-item dropdown">
                               <%--  <a href="" class="nav-link dropdown-toggle" data-toggle="dropdown">User Account</a>
                                
                                <div class="dropdown-menu">
									<sec:authorize access="isAnonymous()">
										<a href="/home/login" class="dropdown-item">Login</a>
										<a href="/home/register" class="dropdown-item">Register</a>
									</sec:authorize>
									<sec:authorize access="isAuthenticated()">
										<a class="dropdown-item logoutBtn">Logout</a>
									</sec:authorize>
									<form action="/sample/logout" method="post" class="logoutForm">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										
									</form>
								</div> --%>
                                
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
                            <a href="/home/index">
                                <img src="/resources/template/img/ecoL.png" alt="Logo">
                            </a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="search">
                            <input type="text" placeholder="Search" id="main_search">
                            <button class="all_cate_search"><i class="fa fa-search"></i></button>
                        </div>
                    </div> 
                    <div class="col-md-3">
                        <div class="user">
                            <a href="/orders/basket/wishlist" class="btn wishlist">
                                <i class="fa fa-heart"></i>
                                <span class="wishCntBtn">(0)</span>
                            </a>
                            <a href="/orders/basket/list" class="btn cart">
                                <i class="fa fa-shopping-cart"></i>
                               <span class="cartCntBtn">(0)</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bottom Bar End -->

	<script src="${contextPath}/resources/basket/basket.js?ver=9"></script>
	<script>
	//카트 상품 갯수 표시
		var cust_id = "${memberId}";
		
		
		$(".logoutBtn").on("click",function(e){
			e.preventDefault();
        	$('.logoutForm').submit();
        	
        });
		
		//검색기능 
		$('.all_cate_search').click(function(e){
			mainSearch();
		});
		
		$('#main_search').keydown(function(key) {
			if (key.keyCode == 13) { mainSearch(); }
		});
    	
 		//header 검색바 사용.  키워드를 이용하여 전체 카테고리에 대한 검색을 실행.
    	function mainSearch(){
    		var keyword = $('#main_search').val();
			
			location.href = '/goods?keyword=' + keyword;
    	}
        
        </script>