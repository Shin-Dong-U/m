<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


<!-- Breadcrumb Start -->
<div class="breadcrumb-wrap">
    <div class="container-fluid">
        <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="">Home</a></li>
            <li class="breadcrumb-item"><a href="">Products</a></li>
            <li class="breadcrumb-item active">Login & Register</li>
        </ul>
    </div>
</div>
<!-- Breadcrumb End -->
      
<!-- Login Start -->
<form id="registerForm" method="post">
	<div class="login">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">    
					<div class="register-form"><!-- 회원가입 완료 사용 -->
						<div class="row">
							<!-- Company_yn radiobutton으로 체크하기 -->
							<div class="col-md-12">
								<label>Company Check</label>
								<div class="col-md-6">
									<table style="width:100%; text-align:center;">
										<tr>
											<td><label>일반 사용자</label></td>
											<td><label>회사</label></td>
										</tr>
										<tr>
											<td><input class="form-control companyCheck" id="customer" type="radio" name="company_yn" value="N" checked/></td>
											<td><input class="form-control companyCheck" id="company" type="radio" name="company_yn" value="Y"/> </td>
										</tr>
									</table>
								</div>
								<div class="col-md-6 " >
									<label>아이디</label>
									<div class="userBind">
										<input class="form-control" type="text" id="memberId" name="memberId" placeholder="ID">&nbsp;&nbsp;&nbsp;&nbsp;
										<div class="idCheck_div">
											<input class="btn idCheck" type="button" id="idCheck" value="중복검사" />
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<label>비밀번호</label>
									<input class="form-control" type="password" id="password" name="password" placeholder="password">
									<input class="form-control" type="password" id="password_confirm" name="password_confirm" placeholder="password">
									<span class="passwordCheck"> </span>
								</div>
								<div class="col-md-6">
									<label>이름</label>
									<input class="form-control" type="text" id="name" name="name" placeholder="Name">
								</div>
								<div class="col-md-6">
									<label>이메일</label>
									<input class="form-control" type="text" id="email" name="email" placeholder="E-mail">
								</div>
								<div class="col-md-6">
									<label>핸드폰</label>
									<input class="form-control" type="text" id="phone" name="phone" placeholder="-없이 입력하세요">
									<span class="phoneCheck"></span>
								</div>
	                              
								<div class="col-md-6">
									<label>주소</label>
									<input class="form-control" type="text" id="addr_post" 		name="addr_post" 	placeholder="우편주소" readOnly>	
									<input class="btn btn-link" type="button" onclick="popUP()" value="우편번호 찾기">
									<input class="form-control" type="text" id="addr_city_new" 	name="addr_city" 	placeholder="도로명 주소" readOnly>
									<input class="form-control" type="text" id="addr_city_old" 	name="addr_city_O" 	placeholder="지번 주소" readOnly>
									<input class="form-control" type="text" id="addr_detail" 	name="addr_detail" 	placeholder="상세 주소">
									<span id="guide" style="color:#999;display:none"></span>
								</div>		
	                              
								<div class="col-md-6">
									<label>생일</label>
									<input class="form-control" type="date" id="birth" name="birth" placeholder="birth" max="9999-12-31">	<!-- value="날짜" 초기값 설정 -->
								</div>
	            									 
								<div class="col-md-6">
									<label>성별</label>
									<table style="width:100%; text-align:center;">
										<tr>
											<td><label>남성</label></td>
											<td><label>여성</label></td>
										</tr>
										<tr>
											<td><input class="form-control companyCheck" type="radio"	id="male"  	name="sex" value=1 checked /></td>
											<td><input class="form-control companyCheck" type="radio"	id="female" name="sex" value=2 /> </td>
										</tr>  
									</table>                             
	   							</div>													
								<!-- Company_yn 이  y일경우 -->
								<div id="company_addDiv" style="display:none;">
									<div class="col-md-6">
										<label>회사 이름</label> 
										<input class="form-control" type="text" id="comp_name" name="comp_name"  placeholder="Company name" >
									</div>
									<div class="col-md-6">
										<label>사업자 번호</label> 
										<input class="form-control" type="text" id="corp_num" name="corp_num"  placeholder="Corporate number">
									</div>
								</div>
								<div class="col-md-12" id="test">
									<button class="btn" id="btn_register">가입하기</button>
								</div>
							</div><!-- ./col-md-12 -->
                       </div><!-- ./row -->
                   </div><!-- ./register-form -->
               </div><!-- ./col-lg-12 -->
           </div><!-- ./row -->
       </div><!-- ./container-fluid -->
	</div><!-- ./login -->
</form>	
	
<!-- modal 시작 -->
<div class="modal" id="memberManager" tabindex="-1" role="dialog" ria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header ">
				<h5>아이디 검사</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div id="detail_chat"></div>
			</div>
			<div class="modal-footer">
				<input type="button" class="btn close" id="close" value="닫기">
			</div>
		</div>
	</div>
</div>
<!-- Ajax 실행 Javascript -->

<script src="/resources/cust/customer.js?v=<%=System.currentTimeMillis() %>"></script>
<script>
/* CSRF 데이터 변수 저장 */
var csrfHeaderName="${_csrf.headerName}";
var csrfTokenValue="${_csrf.token}";

/* 유효성 검사 변수 */
var passCheck = false;
var idCheck = false;
var phoneCheck = false;

/* company일 경우만 company의 항목을 보여준다. */
$("input[type='radio'][name='company_yn']").on("click", function(){
	var company_yn=$("input[type='radio'][name='company_yn']:checked").val();
	
	if(company_yn=="N"){
		$("#company_addDiv").css('display','none');
	}else{
		$("#company_addDiv").css('display','block');
	}
});

/* submit 유효성 검사 */
function btn_check(){	
	if(passCheck==true && idCheck==true && phoneCheck==true){
		$("#test").css('display','block');
	}
}

/* 아이디 입력 시 유효성 체크 */
$("#idCheck").on("click", function(){
	var memberId = $("#memberId").val();
	//alert(memberId);
	var csrf={
		csrfHeaderName:csrfHeaderName,
		csrfTokenValue:csrfTokenValue
	}
	
	customer.idCheck(
			memberId,
			csrf={
				"csrfHeaderName":csrfHeaderName,
				"csrfTokenValue":csrfTokenValue
			},
			function(data){
				if(data=="false"){
					idCheck=true;
					$("#detail_chat").html("사용가능한 아이디 입니다.");
					$(".idCheck_div").css('display','none');
					$(".modal").show();
					btn_check();
				}else{
					idCheck=false;
					$(".modal").show();
					$("#detail_chat").html("사용 불가능한 아이디 입니다.");
					btn_check();
				}
		}
	);
});

/* 모달 닫기 */
$(".close").on("click",function(){
	//display
	$(".modal").hide();
});


/* 아이디가 변경 되었을때  */
$("#memberId").on("change keyup paste", function(){
	idCheck=false;
	$(".idCheck_div").css('display','block');
	btn_check();
});

/* 비밀번호 입력 시 유효성 체크 */
$("#password_confirm").on("change keyup paste", function(){
	var password= $("#password").val();
	var password_confirm=$("#password_confirm").val();

	if(password==password_confirm){
		$(".passwordCheck").css("color","blue");
		$(".passwordCheck").html("비밀번호가 일치 합니다.");
		passCheck = true;
		btn_check();
		
	}else{
		$(".passwordCheck").css("color","red");
		$(".passwordCheck").html("비밀번호가 일치하지 않습니다.");
		passCheck = false;
		btn_check();
	}
	
});

/* 비밀번호 입력 시 유효성 체크2 */
$("#password").on("change keyup paste", function(){
	var password= $("#password").val();
	var password_confirm=$("#password_confirm").val();

	if(password==password_confirm){
		$(".passwordCheck").css("color","blue");
		$(".passwordCheck").html("비밀번호가 일치 합니다.");
		passCheck = true;
		btn_check();
		
	}else{
		$(".passwordCheck").css("color","red");
		$(".passwordCheck").html("비밀번호가 일치하지 않습니다.");
		passCheck = false;
		btn_check();
	}
	
});

/* 핸드폰 입력 시 유효성 체크 */
$("#phone").on("change keyup paste", function(){
	var phone= $("#phone").val();
	//alert(phone);
	if(phone.length=='11'){
		if(isNaN(phone)){
			$(".phoneCheck").css("color","red");
			$(".phoneCheck").html("형식에 맞게 입력하십시오.");
			phoneCheck = false;
			btn_check();
		}else{
			$(".phoneCheck").css("color","blue");
			$(".phoneCheck").html("형식에 맞게 입력하였습니다.");
			phoneCheck = true;
			btn_check();
		}
	}else{
		$(".phoneCheck").css("color","red");
		$(".phoneCheck").html("형식에 맞게 입력하십시오.");
		phoneCheck = false;
		btn_check();
	}
	
	
});

/* 회원가입 Ajax */
$("#btn_register").on("click", function(e){
	e.preventDefault();
	
	var company_yn=$("input[type='radio'][name='company_yn']:checked").val();
	var sex=$("input[type='radio'][name='sex']:checked").val();
	var birth=$('#birth').val();
	/* 생일 = 문자열 -> 숫자 */
	birth=birth.replace("-","")
	var birth_int= parseInt(birth.replace("-",""));

	var custVO={
		"company_yn":company_yn,
		"memberId":$("#memberId").val(),
		"password":$("#password").val(),
		"name":$("#name").val(),
		"email":$("#email").val(),
		"phone":$("#phone").val(),
		"birth":birth_int,
		"addr_post":$("#addr_post").val(),
		"addr_city":$("#addr_city_new").val(),
		"addr_detail":$("#addr_detail").val(),
		"sex":sex,
	};
	if(company_yn=="Y"){
		var compVO={
			"comp_name":$("#comp_name").val(),
			"corp_num":$("#corp_num").val(),
			"addr_post":$("#addr_post").val(),
			"addr_city":$("#addr_city_new").val(),
			"addr_detail":$("#addr_detail").val(),
		}
	}

	
	customer.joinMember(
		memberVO={custVO:custVO, compVO:compVO},
		csrf={
			"csrfHeaderName":csrfHeaderName,
			"csrfTokenValue":csrfTokenValue
		},
		function(data){
			//alert("joinMember"+data);
			registerSuccess();
		}
	);
    
});

function registerSuccess(){
	
	var str= "";
		str +="<div class='col-md-12 '>"
			+ "	<p/><p/><p/>"
			+ "	<h1 style='text-align:center'>회원 가입 완료되었습니다.</h1>"
			+ " <p/><p/>"
			+ " "
			+ "</div>"
			+ "<div class='col-md-12' style='text-align:center;'>"
			+ "<div style='text-align:center'><a href='/home/login'> 로그인하러 가기</a></div></div>";
			//alert("str"+str);
	$(".register-form").html();
	$(".register-form").html(str);
	
}





</script>


<!-- 도로주소 api -->
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
            document.getElementById("addr_city_new").value = roadAddr;
            document.getElementById("addr_city_old").value = data.jibunAddress;
            
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

<%@include file="../include/footer.jsp" %>			
