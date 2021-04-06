<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>game</title>
<link href="/resources/template/css/game_style.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>

	<nav id="navbar">
		<div class="navbar__logo">
		<i class="fas fa-leaf"></i>	
		</div>
		<a class="navbar__logoName"href="#">EcoFreinds </a>	
	</nav>
	
	
	<!--고객상태 목록_ cust  -->
	<section id="about" class="section">
	<table class="item_table_board">
		  <thead>
		    <tr>
		      <th scope="col">아이디</th>
		      <th scope="col">나무상태</th>
		      <th scope="col">보유 마일리지 잔액 </th>
		      <th scope="col">Bar상태 </th>
		      <!-- <th scope="col"><input type="checkbox">선택</th> -->
		    </tr>
		  </thead>
		
		  <tbody class="custStatus">
		  		    
		  </tbody>
	</table>
	</section>
	<!--고객상태 목록  끝-->
	<br>
	
	<!--gameImageLvl 시작 -->
	<section class="section">
	<table class="item_table_board">
		  <thead>
		    <tr>
		      <th scope="col">레벨</th>
		      <th scope="col">이미지소스</th>
		      <th scope="col">메모</th>
		      <!-- <th scope="col"><input type="checkbox">선택</th> -->
		    </tr>
		  </thead>
		  <tbody class="custImageLvl">
		  		    
		  </tbody>
	</table>
	</section>
	<!--gameImageLvl 끝-->

		
		<br>
	<!--물 item 목록  -->

	<section class="section">
		<div class="about__item">
			<div>
			<div class="item_awesome">
			<i class="fas fa-tint"></i>
			</div>
			<table class="item_table_board">
			
			  <thead>
			    <tr>
			      
			      <th scope="col">물</th>
			      <th scope="col">가격</th>
			      <th scope="col">메모</th>
			      <!-- <th><button type="submit" class="btn_">선택</button></th> -->
			      <th><button id="updateWater" class="btn_item">선택</button></th>
			 
			    </tr>
			  </thead>
			
			  <tbody class="showItems">
			  
			  </tbody>
			</table>
			</div>
			  <div>
			  <div class="item_awesome">
			   	<i class="fas fa-fill-drip"></i>
			  </div>
			  <table class="item_table_board">
			  <thead>
			    <tr>
			      <th scope="col">비료</th>
			      <th scope="col">가격</th>
			      <th scope="col">메모</th>
			      <!-- <th><button type="submit" class="btn_">선택</button></th> -->
			      <th><button id="updateCompost" class="btn_item">선택</button></th>
			    </tr>
			  </thead>
			  <tbody class="showItemsCompost">
			  		    
			  </tbody>
			</table>
			</div>
		</div>
	</section>

	<!--물 item 목록  끝-->
<br><br>

	<!--비료 item 목록 
		<div>
		<section class="section">
		<table class="item_table_board">
		  <thead>
		    <tr>
		      <th scope="col">비료</th>
		      <th scope="col">가격</th>
		      <th scope="col">메모</th>
		      
		      <th><button id="updateCompost" class="btn_item">선택</button></th>
		    </tr>
		  </thead>
		  <tbody class="showItemsCompost">
		  		    
		  </tbody>
		</table>
		</section>
	</div>
	비료 item 목록  끝-->
	
	
<br><br>
	<!--씨앗 item 목록  -->
		<div>
		<section class="section">
		<table class="item_table_board">
		  <thead>
		    <tr>
		      <th scope="col">씨앗</th>
		      <th scope="col">가격</th>
		      <th scope="col">메모</th>
		      <!-- <th><button type="submit" class="btn_">선택</button></th> -->
		      <th><button id="updateSeed" class="btn_item">선택</button></th>
		    </tr>
		  </thead>
		
		  <tbody class="showItemsSeed">
		  		    
		  </tbody>
		</table>
		</section>
	</div>
	<!--씨앗 item 목록  끝-->


</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/game.js?var=7"></script>

<!-- 
<script>
//3-1 아이템선택버튼 클릭 -> 마일리지 히스토리에 저장()
//클릭했을때  , ajax로가서 로직이 진행이돼_마일리지가 차감 / 나무 체크,변화 / 상태바 체크, 변화 
var updateWater=$("#updateWater");	
updateWater.on("click",function(e){
	
	alert("-200원이 차감되었습니다......마일리지가 차감 / 나무 체크,변화 / 상태바 체크, 변화 ");
	var memberid="nana";
	gameService.updateWater(
			memberid,
			function(result){
				alert("success");
				}
			);
});



3-1 아이템선택버튼 클릭 -> 마일리지 히스토리에 정보저장()
3-2 update_custStatus(bar_status, mytree,mymil)
----------------------------------------------------
4-1 씨앗-> 아이템선택버튼 클릭 마일리지 히스토리에 정보저장()
4-2 update_custStatus(bar_status, mytree,mymil)
</script>
 -->
 
<script>
var updateWater=$("#updateWater");	
updateWater.on("click",function(e){
	
	alert("-200원이 차감되었습니다......마일리지가 차감 / 나무 체크,변화 / 상태바 체크, 변화 ");
	var memberid="nana";
	gameService.clickItem(
			memberid,
			function(result){
				alert("success");
				}
			);
});

var updateCompost=$("#updateCompost");	
updateCompost.on("click",function(e){
	
	alert("-1000원이 차감되었습니다......마일리지가 차감 / 나무 체크,변화 / 상태바 체크, 변화 ");
	var memberid="nana";
	gameService.clickItemCompost(
			memberid,
			function(result){
				alert("success");
				}
			);
});

var updateSeed=$("#updateSeed");
updateSeed.on("click",function(e){
	
	alert("-500원이 차감되었습니다.마일리지가 차감 / 나무 체크,변화 / 상태바 체크, 변화 ");
	var memberid="nana";
	gameService.clickItemSeed(
		memberid,
		function(result){
			alert("success");
		}
	);
});


</script>
 
 
<script>
$(document).ready(function(){
	showStatus();
	showItems();
	updateSeed();
	updateCompost();
	showImageLvl();
	
	//5. Cust의 (1)Tree레벨 /(2)Status_Bar 에 따른 GameImage불러오기
	function showImageLvl(){
	var showLvl=$(".custImageLvl");
		gameService.getLvlImage(11,function(gameLvl){
			
			console.log("JSP: ",gameLvl );
			console.log("JSP_2:", gameLvl.length);
			var str="";
			
			for(var i=0, len=gameLvl.length||0; i<len; i++){
				console.log("====for");
				console.log("list.jsp의 gameLvl불러오기 :"+gameLvl);
				
				str +="<tr>"
					+"	<th scope='row'>"+gameLvl[i].mil_level+"</th>"
					+"	<td>"+gameLvl[i].img_src+"</td>"
					+"	<td>"+gameLvl[i].strd_memo+"</td>"
					+"</tr>"
			}
			showLvl.html(str);
		});
	}
	
	
	
	//2-3 show씨앗_게임관련 아이템()
	function updateSeed(){	
		var showItems3=$(".showItemsSeed");	
			gameService.getItem(6,function(gameItems){
				
				console.log("JSP: ",gameItems);
				console.log("JSP11: ",gameItems.length);
				var str="";
				
				for(var i=0,len=gameItems.length||0; i<len;i++){
					console.log("===for")
					console.log("list.jsp의 gameItems상태:"+gameItems);
					
					str +="<tr>"
						+"	<th scope='row'>"+gameItems[i].item_name+"</th>"
						+"	<td>"+gameItems[i].item_price+"</td>"
						+"	<td>"+gameItems[i].item_memo+"</td>"
						+"</tr>"
//						+"  <td><input type='checkbox'  checked></td>"
				}
				showItems3.html(str); //화면에 출력해준다.
			});
		}
	
	
	//2-2 show비료_게임관련 아이템 ()
	function updateCompost(){	
	var showItems2=$(".showItemsCompost");	
		gameService.getItem(7,function(gameItems){
			
			console.log("JSP: ",gameItems);
			console.log("JSP11: ",gameItems.length);
			var str="";
			
			for(var i=0,len=gameItems.length||0; i<len;i++){
				console.log("===for")
				console.log("list.jsp의 gameItems상태:"+gameItems);
				
				str +="<tr>"
					+"	<th scope='row'>"+gameItems[i].item_name+"</th>"
					+"	<td>"+gameItems[i].item_price+"</td>"
					+"	<td>"+gameItems[i].item_memo+"</td>"
					+"</tr>"
//					+"  <td><input type='checkbox'  checked></td>"
			}
			showItems2.html(str); //화면에 출력해준다.
		});
	}
	
	
	
	//2-1 show물_게임관련 아이템 ()
	function showItems(){	
	var showItems1=$(".showItems");	
		gameService.getItem(5,function(gameItems){
			
			console.log("JSP: ",gameItems);
			console.log("JSP11: ",gameItems.length);
			var str="";
			
			for(var i=0,len=gameItems.length||0; i<len;i++){
				console.log("===for")
				console.log("list.jsp의 gameItems상태:"+gameItems);
				
				str +="<tr>"
					+"	<th scope='row'>"+gameItems[i].item_name+"</th>"
					+"	<td>"+gameItems[i].item_price+"</td>"
					+"	<td>"+gameItems[i].item_memo+"</td>"
					+"</tr>"
//					+"  <td><input type='checkbox'  checked></td>"
			}
			showItems1.html(str);
		});
	}

	//1. 고객상태 보기()
	function showStatus(){	
	var custStatus1=$(".custStatus");	
		gameService.getCustStatus("nana",function(custStatus){
			
			console.log("JSP: ",custStatus);
			console.log("JSP11: ",custStatus.length);
			var str="";
			
			for(var i=0,len=custStatus.length||0; i<len;i++){
				console.log("===for")
				console.log("list.jsp의 custStatus상태:"+custStatus);
				
				str +="<tr>"
					+"	<th scope='row'>"+custStatus[i].memberId+"</th>"
					+"	<td>"+custStatus[i].myTree+"</td>"
					+"	<td>"+custStatus[i].myMil+"</td>"
					+"	<td>"+custStatus[i].bar_status+"</td>" //cust에서는 bar상태는 0이고, 
					+"</tr>"
//					+"  <td><input type='checkbox'  checked></td>"
			}
			custStatus1.html(str);
		})
	}

	
	
	
	
	
	
});
</script>
</html>