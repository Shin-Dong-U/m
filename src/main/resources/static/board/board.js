console.log("board Module.........");



var boardService=(function(){
	
//
//	function breadCtrl($scope) {
//	    var objectName = "Home.Folder 1.Folder 2.Folder 3.Folder 4.Folder 5.Folder 6.Folder 7.File";
//	    
//	    debugger;
//	    
//	    var objects = objectName.split(".");
//	    $scope.displayName = objects.pop();
//	    var fullPath = "#/";
//	    
//	    $scope.ObjectPath = [];
//	    $.each(objects, function () {
//	        if (this !== objects[0]) {
//	            fullPath += ".";
//	        }
//	        
//	        fullPath += this;
//	    }
	//검색
//	function getSearchedlist(goods_name,callback){
//		console.log("searchedlist...............");
//		
//		$.ajax({ 
//			type:'get',					
//			url:'/board/searchedlist',	
//			data:JSON.stringify(),			
//			contentType: "application/json; charset=utf-8", 
//			success:(searchedlist)=>{console.log("검색한 상품", searchedlist),
//				callback(searchedlist)},
//			error:(log)=>{console.log("실패 "+log)}
//		})
//	}
////	
//	//카테고리 클릭->해당 카테고리 상품목록 페이지
////	function getCateList(cate_seq,callback){
////		console.log("CateList...............");
////		
////		$.ajax({ 
////			type:'get',					
////			url:'/board/catelist/' + cate_seq,	
////			data:JSON.stringify(),			
////			contentType: "application/json; charset=utf-8", 
////			success:(CateList)=>{console.log("클릭한 카테고리의 상품목록", CateList),
////				callback(CateList)},
////			error:(log)=>{console.log("실패 "+log)}
////		})
////	}

//	return{
//		getSearchedlist:getSearchedlist
//		getCateList:getCateList
//		
//	};
		
})();