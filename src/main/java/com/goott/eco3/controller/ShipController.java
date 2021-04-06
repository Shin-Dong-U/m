package com.goott.eco3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.goott.eco3.domain.ShipVO;
import com.goott.eco3.service.ShipService;

import lombok.extern.java.Log;

@RestController
@RequestMapping("/ship/*")
@Log
public class ShipController {
	
	private ShipService shipService;

	@Autowired
	public ShipController(ShipService shipService) {
		this.shipService = shipService;
	}
	//배송정보 입력시점 결제시
	@PostMapping(value="/new",
			//웹브라우저로부터 받아서 메소드가 사용하는 값의 MIME유형을 지정
			consumes= {"application/json; charset=UTF-8"},
			//이 메소드가 웹브라우저로 전달할 데이터의 MIME 타입 유형을 지정
			produces= {"text/plain; charset=UTF-8"})			
	public ResponseEntity<String> shipInsertResult(@RequestBody ShipVO shipVO){
		
		log.info("shipVO: "+shipVO);
		
		
		int shipInsertResult = shipService.insertShipInfo(shipVO);
		
		return shipInsertResult==1
				? new ResponseEntity<>("성공",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//배송정보 리스트 보기(업체)
	@GetMapping(value="/company/list",
			produces= {"application/json; charset=UTF-8"})
	public ResponseEntity<List<ShipVO>> getPaidShipList(){
		log.info("getPaidShipList 시작");
		List<ShipVO> result = shipService.getPaidShipList();
		return new ResponseEntity<>(result,HttpStatus.OK);
	}
	 
	//배송정보수정(업체)	
	@PatchMapping(value="/company/info",
			//웹브라우저로부터 받아서 메소드가 사용하는 값의 MIME유형을 지정
			consumes= {"application/json; charset=UTF-8"},
			//이 메소드가 웹브라우저로 전달할 데이터의 MIME 타입 유형을 지정
			produces= {"text/plain; charset=UTF-8"})			
	public ResponseEntity<String> updateShipInfo(@RequestBody ShipVO shipVO){
		
		log.info("shipVO: "+shipVO);
		int result = shipService.updateShipInfo(shipVO);
		log.info("con: "+result);
		return result==1
				? new ResponseEntity<>("성공",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	//배송정보 보기(회원)
		@GetMapping(value="/user/{order_seq}",
				produces= {"application/json; charset=UTF-8"})
		public ResponseEntity<List<ShipVO>> getShipList(
				@PathVariable("order_seq") Long order_seq
				){
			log.info("getShipList 시작");
			List<ShipVO> result = shipService.getShipList(order_seq);
			return new ResponseEntity<>(result,HttpStatus.OK);
		}
	 

}
