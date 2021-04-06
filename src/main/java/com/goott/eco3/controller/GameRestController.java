package com.goott.eco3.controller;

import java.util.List;

//import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.goott.eco3.domain.CustVO;
import com.goott.eco3.domain.GameItemVO;
import com.goott.eco3.service.GameService;


@RequestMapping("/game/*")
@RestController
//@AllArgsConstructor
public class GameRestController {
	
	
	private GameService gameService;
	
	@Autowired
	public GameRestController(GameService gameService) {
		this.gameService = gameService;
	}
	//Cust 레벨받아오기
	//http://localhost/controller/replies/lvl?lvl=3
//	@GetMapping(value="/{lvl}",
//			consumes = "application/json; charset=UTF-8",
//			produces = "text/plain; charset=UTF-8 " )
											//처리결과반환해주는거-내가 웹브라우저로 전달해주는거 and consumes -> 내가 웹 브라우저로부터받는거 
//	public ResponseEntity<String> get(@RequestBody CustVO custVO,
//									  @PathVariable("myTree") String myTree){	
											//public ModelAndView custId(String lvl) {
		
		
//		custVO.setMyTree(myTree);
//		System.out.println("get:" + myTree);
											//return new ResponseEntity<>(gameService.get(lvl),HttpStatus.OK);
//		return new ResponseEntity<>(gameService.getCustTreeLvl(myTree);
//	}
	
	
	
	//CustController_ @GetMapping("/game/list")
	//http://localhost/cust/game/list
	//get : custVO에서 사용자 아이디에따른 전부의 정보를 가져온후,->  myTree상태조회 하는 로직 
	//get_CustStatus
	@GetMapping(value="/list/{memberId}",			
			    produces= {"application/json; charset=UTF-8"}) //처리결과반환해주는거-내가 웹브라우저로 전달해주는거 and consumes -> 내가 웹 브라우저로부터받는거
	public ResponseEntity<List<CustVO>> getCustStatus(
			@PathVariable("memberId") String memberId){
		
			System.out.println("memberId: "+memberId);
//			List<CustVO> result = gameService.getCustStatus(memberId);
			System.out.println("@@@@@@@@@@@@@@@@ 오류나서 NULL 처리 했어요. 확인해보세요 !!!! @@@@@@@@@@@@@");
			List<CustVO> result = null;
			System.out.println("gameService: "+result);
			return new ResponseEntity<>(result,HttpStatus.OK);
	}
	
	//CustController_ @GetMapping("/game/list")
	//post로 변경하기 -- 버튼으로 만들어서 3개아이템 가져오기해보기
	//url주소 -> http://localhost/cust/game/item
	@GetMapping(value="/{item_seq}",			
				produces= {"application/json; charset=UTF-8"})
	public ResponseEntity<List<GameItemVO>> getItem(
			@PathVariable("item_seq") Long item_seq){
		
		System.out.println("item_seq :" + item_seq);
		
//		List<GameItemVO> result =  gameService.getItem(item_seq);
		List<GameItemVO> result =  null;
		System.out.println("@@@@@@@@@@@@@@@@ 오류나서 NULL 처리 했어요 확인해보세요 !!!! @@@@@@@@@@@@@");
		
		System.out.println("gameService:" + result);
		
		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	//마일리지가 차감 / 나무 체크,변화 / 상태바 체크, 변화 
	//@PathVariable : 366pg_url상에 경로의 일부를 파라미터로사용할 수 있다. 
	@GetMapping(value="/{myMil}/{myTree}/{bar_status}",	//nana의 마일리지 		
			produces= {"application/json; charset=UTF-8"})
	public ResponseEntity<GameItemVO> clickItem(
		@PathVariable("myMil") Long myMil,
		@PathVariable("myTree") String myTree,
		@PathVariable("bar_status") Long bar_status){
	
	System.out.println("myMil :" + myMil);
	System.out.println("myTree :" + myTree);
	System.out.println("bar_status :" + bar_status);
	
	//GameItemVO result =  gameService.getItem(myMil,myTree,bar_status);
	
	
	
	//여기 아랫부분부터 다시체크
	//System.out.println("gameService:" + result);
	
	//return new ResponseEntity<>(result, HttpStatus.OK);
	return null;
}
	
	
	
	
	
	//Cust의 Tree레벨에 따른 GameImage불러오기위해 1_lvl일경우 1_sesources를 불러온다. 
	
		//next ->
		//Cust테이블에 cust->mytree를 참조해서,
		//Game_IMAGE테이블에 이미지를 불러올 수 있게끔해주는 로직을 짜주면된다.
		//그러면 콘솔에 띄워주기-->이후 , js or java에서 비교해서 회원이 'A'일경우 -> 이미지'1'을 출력해주는것이다. 
		
}
