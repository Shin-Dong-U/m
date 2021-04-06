package com.goott.eco3.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.goott.eco3.domain.CustVO;
import com.goott.eco3.domain.MemberVO;
import com.goott.eco3.service.CustService;


@RestController
@RequestMapping("/cust")
public class CustController {

	@Autowired
	private CustService custService;
	
	/* 특정 회원 정보 가져오기 */
	@GetMapping(value="/get/{memberId}", 
			produces={"application/json; charset=UTF-8", "text/html; charset=utf-8"})
	public ResponseEntity<Map<String,MemberVO>> getMember(@PathVariable("memberId") String memberId){
		Map<String,MemberVO> memberMap = new HashMap<String,MemberVO>();
		MemberVO memberVO = new MemberVO();
		
		memberVO.getCustVO().setMemberId(memberId);
	
		memberVO = custService.getCust(memberVO);
		memberMap.put("memberVO", memberVO);
		return new ResponseEntity<>(memberMap, HttpStatus.OK);
	}
	
	
	/* 로그인 */
	@PostMapping(value="/login", produces = "application/json; charset=UTF-8")	
	public ResponseEntity<Map<String,CustVO>> loginCust(@RequestBody CustVO custVO) {
		
		Map<String,CustVO> custMap = new HashMap<String,CustVO>();
		custMap.put("custVO", custService.getCustLogin(custVO));
		
		return new ResponseEntity<>(custMap,HttpStatus.OK);
	}

	/* 아이디확인 */
	@GetMapping(value="/idCheck/{memberId}", produces = {"text/plain; charset=UTF-8"})	
	public ResponseEntity<String> idCheck(@PathVariable("memberId") String memberId) {
		System.out.println("memberId: "+memberId);
		String idCheck=custService.checkCustId(memberId);
		System.out.println("idCheck: "+idCheck);
		
		return new ResponseEntity<>(idCheck,HttpStatus.OK);

	}
	
	/* 비밀번호 확인 */
	@PostMapping(value="/pwCheck", produces = {"text/plain; charset=UTF-8"})	
	public ResponseEntity<String> pwCheck(@RequestBody CustVO custVO) {
		System.out.println("CustVO: "+custVO.toString());
		
		return custService.checkCustPassword(custVO) == 1
				?new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	/* 회원가입  - cust와 company */
	@PostMapping(value="/join", produces="text/plain; charset=UTF-8")
	public ResponseEntity<String> joinCust(@RequestBody MemberVO memberVO) {
		System.out.println("memberVO: "+memberVO);
		return custService.joinCust(memberVO) == 1
				?new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	/* 회원 수정 - cust와 company */
	@PutMapping(value="/modify", produces="text/plain; charset=UTF-8")
	public ResponseEntity<String> modifyCust(@RequestBody CustVO custVO){
		
		System.out.println("custVO:" + custVO.toString());
	

		return custService.modifyCust(custVO) == 1
			?new ResponseEntity<>("success",HttpStatus.OK)
			:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	/* 회원 탈퇴 */
	@PutMapping(value="/delete/{memberId}", produces="text/plain; charset=UTF-8")
	public ResponseEntity<String> deleteCust(@PathVariable("memberId") String memberId ){
		System.out.println("memberId: "+memberId);
		
		return custService.deleteCust(memberId) == 1
			?new ResponseEntity<>("success",HttpStatus.OK)
			:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	//null값으로 , 그냥 gameInfo에 화면만 출력하게해준것
	//http://localhost/cust/gameInfo?id=basic
	@GetMapping("/gameInfo")
	public ModelAndView custId(String id) {
		CustVO custVO = new CustVO();
		custVO.setMemberId(id);
		
		CustVO custId = custService.getCustId(custVO);
		
		System.out.println("custId:" + custId);
		
		ModelAndView mav = new ModelAndView("/cust/gameInfo");
		
		return mav;
	}
	
	//만약 회원의 게임 나무레벨이 A라면, GAME_IMAGE에 있는 값을 불러와라! 
	//CustVO custId = service.getCustId(custVO);
	//사용자가 읽기만하는 값을 뷰단에 구현하면되므로, post가 아닌 get을 사용해서 그냥 화면에 뿌려주면된다.
	//이후에 업데이트는 따로 로직 구현하기
	@GetMapping("/gameInfo")
	//public ModelAndView custId(String id) {
	public void custId(@ModelAttribute("custId")  CustVO custVO, Model model) {
		
		System.out.println("/....get custId");
		model.addAttribute("custId", service.getCustId(custVO));
		//CustVO custVO = new CustVO();
		//custVO.setMemberId(id);
		
		//System.out.println("custId:" + custId.getMemberId());
		//System.out.println("custId:" + custId.getMytree());
		//System.out.println("custId:" + custId.getMymil());
		
		//ModelAndView mav = new ModelAndView("/cust/gameInfo");
		
	}
	 */


}
