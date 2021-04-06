package com.goott.eco3.controller;

import java.util.HashMap;
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

import com.goott.eco3.domain.GoodsVOtest;
import com.goott.eco3.domain.PaymentVO;
import com.goott.eco3.service.OrderService;

import lombok.extern.java.Log;

@RequestMapping("/checkout/*")
@RestController
@Log
public class OrderController {

	
	private OrderService orderService;
	
	@Autowired
	public OrderController(OrderService orderService) {
		this.orderService = orderService;
	}
	
	//test
	@GetMapping(value="/content/{cust_id}/{total_price}",
			produces= {"application/json; charset=UTF-8"})
	public ResponseEntity<HashMap<String,Object>> addOrderBasket(
			@PathVariable("cust_id") String cust_id,
			@PathVariable("total_price") int total_price){
		log.info("주문요청 cust_Id / tota_price: "+cust_id+" / "+total_price);
		HashMap<String,Object> result = new HashMap<String,Object>();
		result.put("order_seq", orderService.addOrder(cust_id, total_price));
		return new ResponseEntity<>(result,HttpStatus.OK);
	}
	
	
	//장바구니상품 주문 신청
//	@PostMapping(value="/content/{cust_id}/{total_price}",
//	produces= {"text/plain; charset=UTF-8"})
//	public ResponseEntity<String> addOrderBasket(
//			@PathVariable("cust_id") String cust_id,
//			@PathVariable("tota_price") Long total_price){
//		log.info("주문요청 cust_id ");
//		//log.info("주문요청 cust_Id / tota_price: "+cust_Id+" / "+total_price);
//		//orderService.addOrder(cust_Id, total_price);
//		return new ResponseEntity<>("성공",HttpStatus.OK);
//}
	
	
	//바로주문
	@PostMapping(value="/now",			
			consumes= {"application/json; charset=UTF-8"},
			produces=  {"application/json; charset=UTF-8"})
	public ResponseEntity<Long> ordernow(
			@RequestBody HashMap<String,Object> orderNowInfo){
				
		log.info("바로주문 정보: "+orderNowInfo);
		
		String cust_id = (String) orderNowInfo.get("cust_id");
		int total_price = (int) orderNowInfo.get("total_price");
		Long order_seq = orderService.addOrder(cust_id,total_price);
		
		return order_seq>0?
				new ResponseEntity<>(order_seq,HttpStatus.OK):
				new ResponseEntity<>(0L,HttpStatus.INTERNAL_SERVER_ERROR);	

	}
	
	//주문 상품 조회
	//남은과제: 주문상태별 보기(그룹화)
	@GetMapping(value="/orderlist/{cust_Id}",
			produces= {"application/json; charset=UTF-8"})
	public ResponseEntity<List<GoodsVOtest>> getOrdersList(
			@PathVariable("cust_Id") String cust_Id){
		log.info("주문 리스트 cust_Id: "+cust_Id);
		
		return new ResponseEntity<>(orderService.getOrderList(cust_Id),HttpStatus.OK);
	}

	//결제하기
	//성공시 update 결제여부  Y
	//주문상태 결제여부 update 구매여수 Y	
	//업체에 주문정보 보내기
	
	@PostMapping(value="/payments/complete",
			consumes= {"application/json; charset=UTF-8"},
			produces= {"text/plain; charset=UTF-8"})
	public ResponseEntity<String> payments(@RequestBody PaymentVO payment){
		log.info("결제완료 컨트롤러: "+payment);
	
		
		log.info("Imp_uid: "+payment.getImp_uid());
		log.info("Paid_amount: "+payment.getPaid_amount());
		log.info("Status(): "+payment.getStatus());
		log.info("Success(): "+payment.isSuccess());
		
		String imp_uid = payment.getImp_uid();
		Long paid_amount = payment.getPaid_amount();
		String status = payment.getStatus();
		Boolean success = payment.isSuccess();
		String cust_id = payment.getCustom_data().getCust_id();
		Long order_seq = payment.getCustom_data().getOrder_seq();
		log.info("cust_id: "+cust_id);
		log.info("order_seq: "+order_seq);
		log.info("타입확인 paid_amount: "+paid_amount.getClass().getName());
		//가격확인
		Long totalPrice = orderService.getTotalPrice(cust_id,order_seq);
		log.info("db저장 가격 : "+totalPrice);
		log.info("타입확인 totalPrice: "+totalPrice.getClass().getName());
		boolean successCheck = (success==true);
		boolean statusCheck = (status.equals("paid"));
		boolean priceCheck = (paid_amount.equals(totalPrice));
		
		log.info("결제 확인: "+successCheck);
		log.info("상태 확인: "+statusCheck);
		log.info("가격 확인: "+priceCheck);
		if(successCheck && statusCheck && priceCheck) {
			log.info("결제완료");
			//ordermain의 orderstatus 3으로 업데이트
			int result = orderService.paidUpdate(cust_id,order_seq);
			log.info("업데이트 성공 유무: "+result);	
			return new ResponseEntity<>("결제완료!",HttpStatus.OK);
		}

		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	//checkout 정보 get
	@GetMapping(value="/address/{cust_Id}/{order_seq}",
			produces= {"application/json; charset=UTF-8"})
	public ResponseEntity<HashMap<String,Object>> getCheckoutInfo(
			@PathVariable("cust_Id") String cust_Id,
			@PathVariable("order_seq") Long order_seq){
		log.info("주문 getCheckoutInfo cust_Id / order_seq: "+cust_Id+"/"+order_seq);
		HashMap<String,Object>result = orderService.getCheckoutInfo(cust_Id,order_seq);
		log.info("결과"+result);
		return new ResponseEntity<>(result,HttpStatus.OK);
	}
	
	//메인 주문정보 조회
	@GetMapping(value="/orderedlist/{cust_Id}",
			produces= {"application/json; charset=UTF-8"})
	public ResponseEntity<List<HashMap<String,Object>>> getOrderedList(
			@PathVariable("cust_Id") String cust_Id){
		log.info("주문 getOrderedList cust_Id: "+cust_Id);
		List<HashMap<String,Object>> result = orderService.getOrderedList(cust_Id);
		log.info("getOrderedList 결과"+result);
		return new ResponseEntity<>(result,HttpStatus.OK);
	}
	
	//메인 주문정보 조회 업체
		@GetMapping(value="/orderedlist",
				produces= {"application/json; charset=UTF-8"})
		public ResponseEntity<List<HashMap<String,Object>>> getOrderedListCom(
				){ 
			List<HashMap<String,Object>> result = orderService.getOrderedListAll();
			log.info("getOrderedList 결과"+result);
			return new ResponseEntity<>(result,HttpStatus.OK);
		}
	
	
	
	//세부주문정보 조회
	@GetMapping(value="/paidlist/{order_seq}",
			produces= {"application/json; charset=UTF-8"})
	public ResponseEntity<List<HashMap<String,Object>>> getPaidList(
			@PathVariable("order_seq") Long order_seq){
		log.info("주문 getPaidList order_seq: "+order_seq);
		List<HashMap<String,Object>> result = orderService.getPaidList(order_seq);
		log.info("결과"+result);
		return new ResponseEntity<>(result,HttpStatus.OK);
	}
	
	//주문취소
		@PostMapping(value="/cancel/{order_seq}",
				produces= {"text/plain; charset=UTF-8"})
		public ResponseEntity<String> orderCancel(
				@PathVariable("order_seq") Long order_seq){
			log.info("주문 취소 번호 order_seq: "+order_seq);
			int result = orderService.orderCancel(order_seq);
			log.info("주문취소 결과: "+ result);
			return result>0?
					new ResponseEntity<>("성공",HttpStatus.OK):
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
		}
		
		//주문확정 포인트 적립
		@PatchMapping(value="/commit/{order_seq}/{point}/{cust_id}",
					produces= {"text/plain; charset=UTF-8"})
			public ResponseEntity<String> orderCommit(
				@PathVariable("order_seq") Long order_seq,
				@PathVariable("point") Long point,
				@PathVariable("cust_id") String cust_id){
					log.info("주문 확정 번호 order_seq: "+order_seq);
					int result = orderService.orderCommit(order_seq,point,cust_id);
					log.info("확정 결과: "+ result);
					return result>0?
							new ResponseEntity<>("성공",HttpStatus.OK):
							new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
				}
}
