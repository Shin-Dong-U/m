package com.goott.eco3.controller;

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

import com.goott.eco3.domain.AdminVO;
import com.goott.eco3.domain.MemberVO;
import com.goott.eco3.service.AdminService;

@RestController
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	/* 모든 관리자 정보 가져오기 */
	@GetMapping(value="/getAdmin/{pageNum}",produces={"application/json; charset=UTF-8"})
	public ResponseEntity<Map<String, Object>> getAdminList1(@PathVariable("pageNum")int pageNum){
		/* TEST형식 */
		Map<String, Object> adminList = adminService.getAdminList(pageNum);
		System.out.println("test: "+adminList);
		
		return new ResponseEntity<>(adminList, HttpStatus.OK);
	}
	
	/* 모든 업체 회원 정보 가져오기  */
	@GetMapping(value="/getCompany/{pageNum}",produces={"application/json; charset=UTF-8"})
	public ResponseEntity<Map<String, Object>> getCompanyList(@PathVariable("pageNum")int pageNum){
		/* TEST형식 */
		Map<String, Object> companyList = adminService.getCompanyList(pageNum);
		System.out.println("controller: "+ companyList);

		return new ResponseEntity<>(companyList, HttpStatus.OK);
	}
	
	/* 모든 일반 사용자 회원 정보 가져오기  */
	@GetMapping(value="/getCust/{pageNum}",produces={"application/json; charset=UTF-8"})
	public ResponseEntity<Map<String, Object>> getCustList(@PathVariable("pageNum")int pageNum){
		/* TEST형식 */
		Map<String, Object> custList = adminService.getCustList(pageNum);
		System.out.println("controller: "+ custList);
		
		return new ResponseEntity<>(custList, HttpStatus.OK);
		
	}
	
	/* 업체 승인 */
	@PostMapping(value="/confirmComp/{memberId}/{loginId}",produces={"text/plain; charset=UTF-8"})
	public ResponseEntity<String> confirmComp(@PathVariable("memberId") String memberId,
			@PathVariable("loginId") String loginId) {
		
		System.out.println("memberId: "+memberId+"|| loginId: "+loginId);
		//int value = adminService.confirmCompany(memberId, loginId);

		return adminService.confirmCompany(memberId, loginId) ==1
				?new ResponseEntity<>("success", HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	};

	/* 관리자 등업 */
	@PostMapping(value="/confirmAdmin/{loginId}",produces={"text/plain; charset=UTF-8"})
	public ResponseEntity<String>confirmAdmin(@RequestBody AdminVO adminVO, 
			@PathVariable("loginId") String loginId) {
		
		System.out.println("adminVO: "+adminVO+"|| loginId: "+loginId);
		//int value = adminService.regAdmin(adminVO, loginId);

		return adminService.regAdmin(adminVO, loginId) ==1
				?new ResponseEntity<>("success", HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	/* 관리자가 수정 */
	@PutMapping(value="/mofify/member/{loginId}", produces={"text/plain; charset=UTF-8"})
	public ResponseEntity<String>confirmAdmin(@RequestBody MemberVO memberVO, 
			@PathVariable("loginId")String loginId){
		
		System.out.println("memberId: "+memberVO);
		System.out.println("loginId: "+loginId);
		
		return adminService.modAdmin_cust(memberVO, loginId) ==1
				?new ResponseEntity<>("success", HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
			



















}
