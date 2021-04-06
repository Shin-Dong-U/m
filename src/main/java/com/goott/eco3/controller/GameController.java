package com.goott.eco3.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.goott.eco3.service.GameService;

import lombok.extern.java.Log;

//@CrossOrigin(origins = {"http://localhost:3000","http://172.16.5.1:3000"})
@CrossOrigin(origins = {"http://localhost:3000"})
@RequestMapping("/game")
@Controller
@Log
public class GameController {

	private GameService gameService;
	
	@Autowired
	public GameController(GameService gameService) {
		this.gameService = gameService;
	}
	
	//ID넘기기
	@GetMapping(value="/userId",
	produces= {"application/json; charset=UTF-8"})
	public ResponseEntity<HashMap<String,Object>> sendUserId(HttpServletRequest request){
		
		String cust_id = (String) request.getSession().getAttribute("memberId");
		
		log.info("세션아이디: "+cust_id);
		//세션사용시 삭제요망
		cust_id = "basic";
		
		HashMap<String,Object> sessionId = new HashMap<>();
		
		sessionId.put("cust_id", cust_id);
		
		return new ResponseEntity<>(sessionId,HttpStatus.OK);
}
	
	
	
	
	//마일리지 조회
	@GetMapping(value="/info/{cust_id}",
	produces= {"application/json; charset=UTF-8"})
	public ResponseEntity<HashMap<String,Object>> getCustPointSum(
			@PathVariable("cust_id") String cust_id){
		
		HashMap<String,Object> getCustPointSumResult =  gameService.getCustPointSum(cust_id);
		
		HashMap<String,Object> userInfo = new HashMap<>();
		
		userInfo.put("userGameInfo", getCustPointSumResult);
		
		return new ResponseEntity<>(userInfo,HttpStatus.OK);
}
	
	//아이템 사용
	@GetMapping(value="/item/{item_seq}/{cust_id}",
	produces= {"application/json; charset=UTF-8"})
	public ResponseEntity<String> useItem(
			@PathVariable("item_seq") Long item_seq,
			@PathVariable("cust_id") String cust_id){
		
		gameService.useItem(item_seq,cust_id);
		
		return new ResponseEntity<>("성공",HttpStatus.OK);
}
	

	
	

}
