package com.goott.eco3.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.goott.eco3.service.WishService;

import lombok.extern.java.Log;
@CrossOrigin(origins ="http://localhost:3000")
@RequestMapping("/wish/*")
@RestController
@Log
public class WishController {

	
	private WishService wishService;
	
	@Autowired
	public WishController(WishService wishService) {
		this.wishService = wishService;
	}
	
	
	//담아두기 리스트 조회
	@GetMapping(value="/list/{cust_id}",			
			produces= {"application/json; charset=UTF-8"})
	public ResponseEntity<List<HashMap<String,Object>>> getWishtList(
			@PathVariable("cust_id")String cust_id){
		
		log.info("custId: "+cust_id);
		List<HashMap<String,Object>> result = wishService.getWishList(cust_id);
		log.info("jsp로 넘겨질 데이터: "+result);
		
		return new ResponseEntity<>(result,HttpStatus.OK);
		
	}
	
//	//담아두기  특정 상품 조회
//	@GetMapping(value="/{goods_seq}",
//			produces= {"application/json; charset=UTF-8"})
//	public ResponseEntity<GoodsVOtest> getBasketGoods(
//			@PathVariable("goods_seq") long goods_seq){
//		log.info("선택 상품번호: "+goods_seq);
//		return new ResponseEntity<>(wishService.getGoodsInfo(goods_seq),HttpStatus.OK);
//	}

	//담아두기에서 특정 상품 빼기 
	@GetMapping(value="/{cust_id}/{goods_seq}",
		//	consumes= {"application/json; charset=UTF-8"},
			produces= {"text/plain; charset=UTF-8"})
	public ResponseEntity<String> delGoodsAtBasket(
			@PathVariable("cust_id") String cust_id,
			@PathVariable("goods_seq") Long goods_seq){
		
		log.info("담아두기 소유id: "+cust_id);
		log.info("담아두기 제거상품 번호"+goods_seq);
		
		return wishService.deleteGoodsAtWish(cust_id,goods_seq)>0? //insert,update,delete는 행의 갯수를 반환
				new ResponseEntity<>("성공",HttpStatus.OK):
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//담아두기에서 구매한 상품빼기
	@GetMapping(value="/pur/{cust_id}/{goods_seq}",
			produces= {"text/plain;charset=UTF-8"})
	public ResponseEntity<String> purGoodsAtBasket(
			@PathVariable("cust_id") String cust_id,
			@PathVariable("goods_seq") Long goods_seq) {
		
		log.info("담아두기 소유id: "+cust_id);
		log.info("담아두기 구매된 상품 번호"+goods_seq);
		
		return wishService.purGoodsAtWish(cust_id,goods_seq)>0?
				new ResponseEntity<>("성공",HttpStatus.OK):
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	//담아두기 수량 변경
	@GetMapping(value="/{cust_id}/{goods_seq}/{qty}",
			produces= {"text/plain; charset=UTF-8"})
	public ResponseEntity<String> changeQtyAtBasket(
			@PathVariable("cust_id") String cust_id,
			@PathVariable("goods_seq") Long goods_seq,
			@PathVariable("qty") Long qty){
		log.info("담아두기 수량변경  소유 id: "+cust_id+"변경 아이템: "+goods_seq+"변경 수량: "+qty);
		
		return wishService.changeQtyAtWish(cust_id,goods_seq,qty)>0?
				new ResponseEntity<>("성공",HttpStatus.OK):
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//선택상품 담아두기에 넣기
	@PostMapping(value="/new",
			produces= {"text/plain;charset=UTF-8"})
	public ResponseEntity<String> addGoodsAtBasket(
			@RequestBody HashMap<String,Object> orderInfo){
		log.info("담아두기 추가 orderInfo"+orderInfo);
		log.info("담아두기 추가 소유 id: "+ orderInfo.get("cust_id"));
		log.info("담아두기 추가 상품번호: "+orderInfo.get("goods_seq"));
		log.info("담아두기 추가 상품수량: "+orderInfo.get("qty"));
		log.info("담아두기 추가 옵션: "+orderInfo.get("orderOption"));
		int result=wishService.addGoodsAtWish(orderInfo);
		String sendResult = null;
		if(result==0) {
			sendResult = "exist";
		}else {
			sendResult = "notexist";
		}
		log.info("결과: "+result+"/"+sendResult);
		return new ResponseEntity<>(sendResult,HttpStatus.OK);
	}
	
	//담아두기 수량 파악
		@GetMapping(value="/count/{cust_id}",
				produces= {"application/json; charset=UTF-8"})
		public ResponseEntity<Integer> countBasketGoods(
				@PathVariable("cust_id") String cust_id){
			
			int result = wishService.countWishGoods(cust_id);
			
			
			return 	new ResponseEntity<>(result,HttpStatus.OK);
		}
//	
	
	
}