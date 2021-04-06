<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" th:content="${_csrf.token}">
<meta name="_csrf_header" th:content="${_csrf.headerName}">
<title>상품등록페이지</title>
<script type="text/javascript" src="/resources/vender/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
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
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<!-- Naver Smart Editor -->
	<script type="text/javascript" src="/resources/vender/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
<!-- Top bar Start -->
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
<!-- Top bar End -->

<!-- Nav Bar Start -->
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
                    <a href="product-list.html" class="nav-item nav-link">Products</a>
                    <a href="product-detail.html" class="nav-item nav-link">Product Detail</a>
                    <a href="cart.html" class="nav-item nav-link">Cart</a>
                    <a href="checkout.html" class="nav-item nav-link">Checkout</a>
                    <a href="my-account.html" class="nav-item nav-link active">My Account</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">More Pages</a>
                        <div class="dropdown-menu">
                            <a href="wishlist.html" class="dropdown-item">Wishlist</a>
                            <a href="login.html" class="dropdown-item">Login & Register</a>
                            <a href="contact.html" class="dropdown-item">Contact Us</a>
                        </div>
                    </div>
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
<!-- Nav Bar End -->      

<!-- Bottom Bar Start -->
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
            <div class="col-md-6">
                <div class="search">
                    <input type="text" placeholder="Search">
                    <button><i class="fa fa-search"></i></button>
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
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item"><a href="#">Products</a></li>
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
                <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
                    <a class="nav-link active" id="dashboard-nav" data-toggle="pill" href="#dashboard-tab" role="tab"><i class="fa fa-tachometer-alt"></i>Dashboard</a>
                    <a class="nav-link" id="orders-nav" data-toggle="pill" href="#orders-tab" role="tab"><i class="fa fa-shopping-bag"></i>Orders</a>
                    <a class="nav-link" id="payment-nav" data-toggle="pill" href="#payment-tab" role="tab"><i class="fa fa-credit-card"></i>Payment Method</a>
                    <a class="nav-link" id="address-nav" data-toggle="pill" href="#address-tab" role="tab"><i class="fa fa-map-marker-alt"></i>address</a>
                    <a class="nav-link" id="account-nav" data-toggle="pill" href="#account-tab" role="tab"><i class="fa fa-user"></i>Account Details</a>
                    <a class="nav-link" href="index.html"><i class="fa fa-sign-out-alt"></i>Logout</a>
                </div>
            </div>
            <div class="col-md-9">
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="dashboard-tab" role="tabpanel" aria-labelledby="dashboard-nav">
                        <h4>Dashboard</h4>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in. Vivamus tempor hendrerit finibus. Nulla tristique viverra nisl, sit amet bibendum ante suscipit non. Praesent in faucibus tellus, sed gravida lacus. Vivamus eu diam eros. Aliquam et sapien eget arcu rhoncus scelerisque.
                        </p> 
                    </div>
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
                    <div class="tab-pane fade" id="payment-tab" role="tabpanel" aria-labelledby="payment-nav">
                        <h4>Payment Method</h4>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in. Vivamus tempor hendrerit finibus. Nulla tristique viverra nisl, sit amet bibendum ante suscipit non. Praesent in faucibus tellus, sed gravida lacus. Vivamus eu diam eros. Aliquam et sapien eget arcu rhoncus scelerisque.
                        </p> 
                    </div>
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
                    <div class="tab-pane fade" id="account-tab" role="tabpanel" aria-labelledby="account-nav">
                    	
                    	
                    	
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
                    			<label class="radio-inline">없음<input type="radio" name="req_option" value="N"></label>&nbsp;&nbsp;
                    			<label class="radio-inline">있음<input type="radio" name="req_option" id="req_option_y" value="Y"></label>
                            </div>
                    	</div>
                    	<div class="row" id="req_option_div">
                    	</div>
                    	<div class="row" style="margin-top:20px;">
            				<textarea name="goods_detail" id="goods_detail" rows="10" cols="100" style="width:100%; height:412px; min-width:610px;"></textarea>        	
                    	</div>
						</form:form>
						
						<div class="row" style="margin-top:20px;">
							<button class="btn" id="testBtn" onclick="submitContents(this);">등록</button>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- My Account End -->

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
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Terms & Condition</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="footer-widget">
                    <h2>Purchase Info</h2>
                    <ul>
                        <li><a href="#">Pyament Policy</a></li>
                        <li><a href="#">Shipping Policy</a></li>
                        <li><a href="#">Return Policy</a></li>
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
<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
    
<!-- JavaScript Libraries -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="/resources/template/lib/easing/easing.min.js"></script>
<script src="/resources/template/lib/slick/slick.min.js"></script>
    
<!-- Template Javascript -->
<script src="/resources/template/js/main.js"></script>
<script src="/resources/js/common/common.js"></script>
<script src="/resources/js/goods/goods.js"></script>
       
<script type="text/javascript">
var oEditors = [];
var images = new Array();


$(document).ready(function(){
	var seq = 0;//객체 중복 생성을 막기위한 시퀀스
	$('#account-tab').click(function(e){
		if(seq++ == 0){
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
	     
		 callInsertGoods();
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




</script>
</body>
</html>
