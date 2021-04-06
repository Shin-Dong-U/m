//게시글 번호
var GOODS_COMMENT_SEQ = '${detail.GOODS_COMMENT_SEQ}'; 
 
$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});
 
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
 
//댓글 목록 
function commentList(){
    $.ajax({
        url : '/comment/list',
        type : 'get',
        data : {'GOODS_COMMENT_SEQ':GOODS_COMMENT_SEQ},
        success : function(data){
            var a =''; 
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.GOODS_COMMENT_SEQ+'">'+'댓글번호 : '+value.GOODS_COMMENT_SEQ+' / 작성자 : '+value.cust_id;
                a += '<a onclick="commentUpdate('+value.GOODS_COMMENT_SEQ+',\''+value.memo+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.GOODS_COMMENT_SEQ+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+value.GOODS_COMMENT_SEQ+'"> <p> 내용 : '+value.memo +'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : '/comment/insert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(GOODS_COMMENT_SEQ, memo){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="memo_'+GOODS_COMMENT_SEQ+'" value="'+memo+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+GOODS_COMMENT_SEQ+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+GOODS_COMMENT_SEQ).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(GOODS_COMMENT_SEQ){
    var updateContent = $('[name=content_'+GOODS_COMMENT_SEQ+']').val();
    
    $.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'memo' : updateContent, 'GOODS_COMMENT_SEQ' : GOODS_COMMENT_SEQ},
        success : function(data){
            if(data == 1) commentList(GOODS_COMMENT_SEQ); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(GOODS_COMMENT_SEQ){
    $.ajax({
        url : '/comment/delete/'+GOODS_COMMENT_SEQ,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(GOODS_COMMENT_SEQ); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
 
 



