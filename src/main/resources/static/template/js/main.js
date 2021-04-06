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
    // $('.qty button').on('click', function () {
    
    
 // 상품 quantity
    $('.goodsQty button').on('click', function () {
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        var goodsPrice=$(".goods-price").text();
        var totalPrice=1;
        if ($button.hasClass('btn-plus')) {
            var newVal = parseFloat(oldValue) + 1;
            
            totalPrice=goodsPrice*newVal;
            
        } else {
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
                totalPrice=goodsPrice*newVal;
               
            } else {
                newVal = 0;
            }
        }
        $button.parent().find('input').val(newVal);
        $(".goods-total-price").val(totalPrice);
    });
    
   
    //이벤트 위임
    $('.basketList').on('click', ".qty button",function () {
    	
    	
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        var totalPrice=1;
        $(".checkoutBtn").css("visibility", 'hidden')
        
        if ($button.hasClass('btn-plus')) {
           var newVal = Number(parseFloat(oldValue) + 1);
            var goodsPrice=Number($button.parentsUntil("tr").prev().children("span").text());
           
            //$button.parentsUntil("tr").prev().children("span").css({"border": "2px solid red"});
            
            totalPrice=goodsPrice*newVal;
          

        	//장바구니 수량 업데이트
            var goods_seq = $button.parent().data("goods_seq");
           
        	changeQtyAtBasket(cust_id,goods_seq,newVal);
        	
        } else {
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
                var goodsPrice=Number($button.parentsUntil("tr").prev().children("span").text());
                totalPrice=goodsPrice*newVal;
             
               
             //장바구니 수량 업데이트
               var goods_seq = $button.parent().data("goods_seq");
               
           	   changeQtyAtBasket(cust_id,goods_seq,newVal);
           	
            } else {
                newVal = 0;
            }
       }
        $button.parent().find('input').val(newVal);
     //   $button.parentsUntil("tr").next().children("span").css({"border": "2px solid teal"});
        $button.parentsUntil("tr").next().children("span").text(totalPrice);
       
    });
    
    $('.cartUpBtn').on('click', function () {
    	//금액계산
    	 var subCacul=0;
    	
    	 var loopCnt = Number($("tbody tr").length);
         for(var i=0; i<loopCnt;i++){
         subCacul=Number($(".calPrice"+[i]).text())+Number(subCacul);  	
         
         }
         
        
         $(".subTotalPrice").text(subCacul);
         
    	var totalPrice = subCacul+Number($(".shippingCost").text());
    	
    	$(".grandTotalPrice").text(totalPrice);
    	
    	
    	
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
})(jQuery);

