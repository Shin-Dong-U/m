var goodsService=(function(){
	var isRun = false;
	
	function getGoodsList(url, search, callback){
		if(isRun === true) { return false; }
		isRun = true;
		
		$.ajax({ 
			type : 'get',						
			url : url,	
			data : search,
			contentType : "application/json;charset=UTF-8",
			
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
				isRun = false;
			}, error : function(e){
				console.log(e);
				isRun = false;
			}
		});
	}
	
	function getCommentList(url, search, callback){
		if(isRun === true) { return false; }
		isRun = true;
		
		$.ajax({ 
			type : 'get',						
			url : url,	
			data : search,
			contentType : "application/json;charset=UTF-8",
			
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
				isRun = false;
			}, error : function(e){
				console.log(e);
				isRun = false;
			}
		});
	}
	
	function updateComment(url, data, callback){
		if(isRun === true) { return false; }
		isRun = true;
		
		$.ajax({ 
			type : 'post',						
			url : url,	
			data : JSON.stringify(data),
			contentType : "application/json;charset=UTF-8",
			
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
				isRun = false;
			}, error : function(e){
				console.log(e);
				isRun = false;
			}, complete : function() {
				commentReset();
    		}


		});
	}
	
	function insertComment(url, data, callback){
		if(isRun === true) { return false; }
		isRun = true;
		
		$.ajax({ 
			type : 'put',						
			url : url,	
			data : JSON.stringify(data),
			contentType : "application/json;charset=UTF-8",
			
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
				isRun = false;
			}, error : function(e){
				console.log(e);
				isRun = false;
			}, complete : function() {
				commentInsertFormReset();
				movePage(1);
    		}
		});
	}
	
	function deleteComment(url, data, callback){
		if(isRun === true) { return false; }
		isRun = true;
		
		$.ajax({ 
			type : 'delete',						
			url : url,	
			data : JSON.stringify(data),
			contentType : "application/json;charset=UTF-8",
			
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
				isRun = false;
			}, error : function(e){
				console.log(e);
				isRun = false;
			}, complete : function() {
				commentInsertFormReset();
				movePage(1);
    		}
		});
	}
	
	function insertGoods(url, data, callback){
		if(isRun === true) { return false; }
		isRun = true;
		
		$.ajax({ 
			type : 'put',						
			url : url,	
			data : JSON.stringify(data),
			contentType : "application/json;charset=UTF-8",
			
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
				isRun = false;
			}, error : function(e){
				console.log(e);
				isRun = false;
			}, complete : function() {
    		}
		});
	}
	
	return {
		getGoodsList : getGoodsList,
		getCommentList : getCommentList,
		updateComment : updateComment,
		insertComment : insertComment,
		insertGoods : insertGoods,
		deleteComment : deleteComment
	};
	
})();

function callGetGoodsList(isNewSearch){
	if(isNewSearch === true){ selectedPage(1); }
	
	var data = $('#searchForm').serializeObject();
	var url = '/goods/rest';  
	
	goodsService.getGoodsList(url, data, function(result){
		
		var linkUrl = '/goods/';
		
		var htmlStr = '';
		if(result.goodsList){
			for(var i = 0; i < result.goodsList.length; i++){
				const imgUrl = result.goodsList[i].IMG_URL ? result.goodsList[i].IMG_URL : '';//예외처리
				
				htmlStr += '<div class="col-lg-3">';
				htmlStr += '<div class="product-item">';
				htmlStr += '<div class="product-title" style="height:100px;">';
				htmlStr += '<a href="' + linkUrl + result.goodsList[i].GOODS_SEQ + '">' + result.goodsList[i].GOODS_NAME + '</a>';
				
				htmlStr += makeStarIconHtml(result.goodsList[i].STAR);
				
				htmlStr += '</div>';
				htmlStr += '<div class="product-image">';
				htmlStr += '<a href="' + linkUrl + result.goodsList[i].GOODS_SEQ + '">';
				htmlStr += '<img src="' + imgUrl + '" alt="상품 이미지" onerror="this.src=' + "'/resources/image/no_img.png'" + '" style="overflow: hidden;height:250px;"/>';
				htmlStr += '</a>';
				
				htmlStr += '<div class="product-action">';
				htmlStr += '<a href="' + linkUrl + result.goodsList[i].GOODS_SEQ + '"><i class="fa fa-search"></i></a>';
				htmlStr += '</div>';
				htmlStr += '</div>';
				
				htmlStr += '<div class="product-price">';
				htmlStr += '<h3>' + formattingComma(result.goodsList[i].PRICE) + ' &#8361;</h3>';
				htmlStr += '<a class="btn" href="' + linkUrl + result.goodsList[i].GOODS_SEQ + '"><i class="fa fa-shopping-cart"></i>구매</a>';
				htmlStr += '</div>';
				htmlStr += '</div>';
				htmlStr += '</div>';
				
			}
			
			const goodsDiv = $('#goods_list');
			goodsDiv.empty();
			goodsDiv.html(htmlStr);
		}//if(result.goodsList){
		
		if(result.page){
			const pageHtml = makePageHtml(result.page);
			
			const pageDiv = $('#pageDiv');
			$('#pageNum').val(result.page.cri.pageNum);
			$('#amount').val(result.page.cri.amount);
			pageDiv.empty();
			pageDiv.html(pageHtml);
		}
	});
}

function callGetCommentList(){
	var goodsSeq = document.getElementById('goodsSeq').value;
	var pageNum = document.getElementById('pageNum').value;
	var data = {"goodsSeq" : goodsSeq, "pageNum" : pageNum };
	
	var url = '/goods/rest/' + goodsSeq + '/review';  
	
	goodsService.getGoodsList(url, data, function(result){
		if(result.commentList){
			var memberId = $('#memberId').val();
			var htmlStr = '';
			
			for(var i = 0; i < result.commentList.length; i++){
				htmlStr += '<div class="reviews-submitted" id="commentDiv_' + result.commentList[i].GOODS_COMMENT_SEQ + '">';
				htmlStr += '<div class="reviewer">' + result.commentList[i].NAME + ' - <span>' + result.commentList[i].REGDATE;
				if(result.commentList[i].CUST_ID === memberId) {
					htmlStr += '<span style="float:right">';
					htmlStr += '<a href="#this" onClick="modifyComment(' + result.commentList[i].GOODS_COMMENT_SEQ + ');">수정</a> &nbsp;';
					htmlStr += '<a href="#this" onClick="commentDelete(' + result.commentList[i].GOODS_COMMENT_SEQ + ');">삭제</a></span>';
				}
				htmlStr += '</span></div>';
				
				htmlStr += makeStarIconHtml(result.commentList[i].STAR);
				
				htmlStr += '<input type="hidden" id="commentMemo_' + result.commentList[i].GOODS_COMMENT_SEQ + '" value="' + result.commentList[i].MEMO + '">';
				htmlStr += '<p>' + result.commentList[i].MEMO + '</p>';
				htmlStr += '</div>';
				htmlStr += '<hr/>';
				
			}
			
			const commentDiv = $('#commentDiv');
			commentDiv.empty();
			commentDiv.html(htmlStr);
			
		}
	
		if(result.page){
			const pageHtml = makePageHtml(result.page);
			
			const pageDiv = $('#pageDiv');
			$('#pageNum').val(result.page.cri.pageNum);
			pageDiv.empty();
			pageDiv.html(pageHtml);
		}
	});
}

function callUpdateComment(goods_comment_seq){
	const goodsSeq = $('#goodsSeq').val();
	var url = '/goods/rest/' + goodsSeq + '/review/' + goods_comment_seq;

	var memo = $('#update_memo').val();
	var star = $('#comment_update_star_a').attr('data-selected-star');
	var data = {"goods_comment_seq" : goods_comment_seq, "goods_seq" : goodsSeq, "memo" : memo, "star" : star};
	 
	goodsService.updateComment(url, data, function(result){
		$("#totalModal").show();
		$("#total_header").html("댓글");
		$("#detail_chat").html("수정 되었습니다.");
		//alert('수정 되었습니다.');
	});
}

function callDeleteComment(goods_comment_seq){
	const goodsSeq = $('#goodsSeq').val();
	var url = '/goods/rest/' + goodsSeq + '/review/' + goods_comment_seq;

	var data = {"goods_comment_seq" : goods_comment_seq, "goods_seq" : goodsSeq};
	 
	goodsService.deleteComment(url, data, function(result){
		$("#totalModal").show();
		$("#total_header").html("댓글");
		$("#detail_chat").html("삭제 되었습니다.");
	});
}

function callInsertComment(){
	var memo = $('#comment_memo').val();
	var goodsSeq = $('#goodsSeq').val();
	var star = $('#comment_insert_star_a').attr('data-selected-star');

	var data = {"memo" : memo, "goods_seq" : goodsSeq, "star" : star};
	var url = '/goods/rest/' + goodsSeq + '/review';

	goodsService.insertComment(url, data, function(result){
		$("#totalModal").show();
		$("#total_header").html("댓글");
		$("#detail_chat").html("등록 되었습니다.");
		//alert('등록 되었습니다.');
	});
}

function callInsertGoods(){
	var data = $('#goodsForm').serializeObject();
	var url = '/goods/rest/form'; 

//  필수 옵션 관련 작업 중지.
//	var req_option_name = $('input[name="req_option_name"]');
//	var req_price = $('input[name="req_price"]');
	
	goodsService.insertGoods(url, data, function(result){
		if(result && result != -1){
			var goodsSeq = result;
			var formData = new FormData();
		
			var inputFile = $('input[name="uploadFile"]');
			
			var files = inputFile[0].files;
			
			for(var i = 0; i < files.length; i++){
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				url : '/goods/rest/' + goodsSeq + '/form/upload/images/thumb',
				processData: false,
				contentType: false,
				data: formData,
				type: 'POST',
				success: function(result){
					//alert('등록 되었습니다.');
					$("#totalModal").show();
					$("#total_header").html("상품");
					$("#detail_chat2").html("등록 되었습니다.");
					//location.href = '/goods/' + goodsSeq;
					
				}
			});
		}
	});
}

//별점에 따라 아이콘 리턴
function makeStarIconHtml(ratting){
	var htmlText = '<div class="ratting">';
	
	for(var i = 0; i < 5; i ++){
		if(ratting < 1 && ratting >= 0.5){
			htmlText += ' <i class="fa fa-star-half-alt"></i>';
			break;
		}else if(ratting >= 1){
			htmlText += ' <i class="fa fa-star"></i>';
			ratting -= 1;
		}else{
			break;
		}
	}
	
	htmlText += '</div>';
	
	return htmlText;
}

function modifyComment(goodsCommentSeq){
	var thisDiv = $('#commentDiv_' + goodsCommentSeq);
	var memo = $('#commentMemo_' + goodsCommentSeq).val();
	
	thisDiv.empty();
	var htmlStr = '<div class="nav-item dropdown">';
	htmlStr += '<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" id="comment_update_star_a" data-selected-star="5">';
	htmlStr += '<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>';
	htmlStr += '</a>';
	htmlStr += '<div class="dropdown-menu">';                                                 
	htmlStr += '<a class="dropdown-item" onclick="selectedStar(' + "'" + 'update' + "'" + ', 5);"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></a><a class="dropdown-item" onclick="selectedStar(' + "'" +  'update' + "'" + ', 4);"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="far fa-star"></i></a><a class="dropdown-item" onclick="selectedStar(' + "'" + 'update' + "'" + ', 3);"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></a><a class="dropdown-item" onclick="selectedStar(' + "'" + 'update' + "'" + ', 2);"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></a><a class="dropdown-item" onclick="selectedStar(' + "'" + 'update' + "'" + ', 1);"><i class="fa fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></a>';                              
	htmlStr += '</div></div>';                                     
	htmlStr += '<div class="row form">';
	htmlStr += '<div class="col-sm-12">';
	htmlStr += '<textarea id="update_memo">' + memo + '</textarea>';
	htmlStr += '</div><div class="col-sm-12"><button onclick="commentUpdate(' + goodsCommentSeq + ');">수정</button> <button onclick="commentReset();">취소</button></div></div>';
                                                
	thisDiv.html(htmlStr);
}

function selectedStar(action, star){
	var starHtml = '';
	var starTag = '<i class="fa fa-star"></i>';
	for(var i = 0; i < star; i++){ starHtml += starTag; }
	
	if(action === 'insert'){
		const tmpTarget = $('#comment_insert_star_a'); 
		tmpTarget.attr('data-selected-star', star);
		tmpTarget.empty();
		tmpTarget.html(starHtml);
	}else if(action === 'update'){
		const tmpTarget = $('#comment_update_star_a'); 
		tmpTarget.attr('data-selected-star', star);
		tmpTarget.empty();
		tmpTarget.html(starHtml);
	}
}

//상세 - 리뷰 리스트 초기화
function commentReset(){
	const pageNum = document.getElementById('pageNum').value;
	movePage(pageNum);
};
   	
//상세 - 리뷰 등록 필드 초기화
function commentInsertFormReset(){
	selectedStar('insert', 5);
	$('#comment_memo').val('');
}
   	
//상세 - 리뷰 수정 실행
function commentUpdate(goodsCommentSeq){
	callUpdateComment(goodsCommentSeq);
	commentReset();
}

//상세 - 리뷰 삭제 실행
function commentDelete(goodsCommentSeq){
	callDeleteComment(goodsCommentSeq);
	commentReset();
}
   	
//상세 - 리뷰 등록 실행
function commentInsert(){
	callInsertComment();
}

//상품 썸네일
/*
$(document).ready(function () {
    //start the carousel
    $(".carousel").carousel();

    //bind to window resize event to see if we've toggled 
    //between phone and larger
    $(window).resize(function () {
        if ($(window).width() < 768) {
          //Phone size, manipulate DOM for phone here
        } else {
          //Not phone size, re-manipulate DOM to get back to original carousel
        }
        //Re-init carousel
        $(".carousel").carousel();
    });
});


(function ($) {
    "use strict";
    
    // Dropdown on mouse hover
    $(document).ready(function () {
        function toggleNavbarMethod() {
            if ($(window).width() > 768) {
                $('.navbar .dropdown').on('mouseover', function () {
                    $('.dropdown-toggle', this).trigger('click');
                }).on('mouseout', function () {
                    $('.dropdown-toggle', this).trigger('click').blur();
                });
            } else {
                $('.navbar .dropdown').off('mouseover').off('mouseout');
            }
        }
        toggleNavbarMethod();
        $(window).resize(toggleNavbarMethod);
    });
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });
    
    
    // Header slider
    $('.header-slider').slick({
        autoplay: true,
        dots: true,
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1
    });
    
    
    // Product Slider 4 Column
    $('.product-slider-4').slick({
        autoplay: true,
        infinite: true,
        dots: false,
        slidesToShow: 4,
        slidesToScroll: 1,
        responsive: [
            {
                breakpoint: 1200,
                settings: {
                    slidesToShow: 4,
                }
            },
            {
                breakpoint: 992,
                settings: {
                    slidesToShow: 3,
                }
            },
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 2,
                }
            },
            {
                breakpoint: 576,
                settings: {
                    slidesToShow: 1,
                }
            },
        ]
    });
    
    
    // Product Slider 3 Column
    $('.product-slider-3').slick({
        autoplay: true,
        infinite: true,
        dots: false,
        slidesToShow: 3,
        slidesToScroll: 1,
        responsive: [
            {
                breakpoint: 992,
                settings: {
                    slidesToShow: 3,
                }
            },
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 2,
                }
            },
            {
                breakpoint: 576,
                settings: {
                    slidesToShow: 1,
                }
            },
        ]
    });
    
    
    // Product Detail Slider
    $('.product-slider-single').slick({
        infinite: true,
        autoplay: true,
        dots: false,
        fade: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        asNavFor: '.product-slider-single-nav'
    });
    $('.product-slider-single-nav').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        dots: false,
        centerMode: true,
        focusOnSelect: true,
        asNavFor: '.product-slider-single'
    });
    
    
    // Brand Slider
    $('.brand-slider').slick({
        speed: 5000,
        autoplay: true,
        autoplaySpeed: 0,
        cssEase: 'linear',
        slidesToShow: 5,
        slidesToScroll: 1,
        infinite: true,
        swipeToSlide: true,
        centerMode: true,
        focusOnSelect: false,
        arrows: false,
        dots: false,
        responsive: [
            {
                breakpoint: 992,
                settings: {
                    slidesToShow: 4,
                }
            },
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 3,
                }
            },
            {
                breakpoint: 576,
                settings: {
                    slidesToShow: 2,
                }
            },
            {
                breakpoint: 300,
                settings: {
                    slidesToShow: 1,
                }
            }
        ]
    });
    
    
    // Review slider
    $('.review-slider').slick({
        autoplay: true,
        dots: false,
        infinite: true,
        slidesToShow: 2,
        slidesToScroll: 1,
        responsive: [
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 1,
                }
            }
        ]
    });
    
    
    // Widget slider
    $('.sidebar-slider').slick({
        autoplay: true,
        dots: false,
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1
    });
    
    
    // Quantity
    $('.qty button').on('click', function () {
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        if ($button.hasClass('btn-plus')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }
        $button.parent().find('input').val(newVal);
    });
    
    
    // Shipping address show hide
    $('.checkout #shipto').change(function () {
        if($(this).is(':checked')) {
            $('.checkout .shipping-address').slideDown();
        } else {
            $('.checkout .shipping-address').slideUp();
        }
    });
    
    
    // Payment methods show hide
    $('.checkout .payment-method .custom-control-input').change(function () {
        if ($(this).prop('checked')) {
            var checkbox_id = $(this).attr('id');
            $('.checkout .payment-method .payment-content').slideUp();
            $('#' + checkbox_id + '-show').slideDown();
        }
    });
})(jQuery);*/






