// form 인풋 값 -> object로 변환
jQuery.fn.serializeObject = function() { 
	var obj = {};

    var arr = this.serializeArray(); 
    if(arr){ 
    	jQuery.each(arr, function() {
			//pageNum, amount 가 null 또는 '' 이면 전달 하지 않는다.
			if( !(!this.value && (this.name == "pageNum" || this.name == "amount")) ){
    			obj[this.name] = this.value; 
    		}
    		
		}); 
    }
    
    return obj;
}

// 숫자 3자리마다 콤마 찍기
function formattingComma(num){
    var len, point, str; 
       
    num = num + ""; 
    point = num.length % 3 ;
    len = num.length; 
   
    str = num.substring(0, point); 
    while (point < len) { 
        if (str) str += ","; 
        str += num.substring(point, point + 3); 
        point += 3; 
    } 
     
    return str;
}

//paging 생성 movePage()는 사용페이지에서 반드시 새로 구현.
function makePageHtml(page){
	var pageHtml = ''
	if(!page || !page.startPage || !page.endPage) { return pageHtml; }
	
	pageHtml += '<nav aria-label="Page navigation example">';
	pageHtml += '<ul class="pagination justify-content-center">';
	
	if(page.prev){
		pageHtml += '<li class="page-item">';
		pageHtml += '<Button class="page-link" name="pageBtn" onclick="movePage(' + (page.startPage - 1) + ');" >이전</Button>';
		pageHtml += '</li>';
	}
	
	for(var i = page.startPage; i <= page.endPage; i++){
		if(page.cri.pageNum == i){
			pageHtml += '<li class="page-item active"><span class="page-link">' + page.cri.pageNum + '</span></li>';
		}else{
			pageHtml += '<li class="page-item"><Button class="page-link" name="pageBtn" onclick="movePage(' + i + ');" >' + i + '</Button></li>';
		}
	}
	
	if(page.next){
		pageHtml += '<li class="page-item">';
		pageHtml += '<Button class="page-link" name="pageBtn" onclick="movePage(' + (page.endPage + 1) + ');" >다음</Button>';
		pageHtml += '</li>';
	}
	
	pageHtml += '</ul> </nav>';
	
	return pageHtml;
}

function selectedPage(pageNum){
	document.getElementById('pageNum').value = pageNum;
}
