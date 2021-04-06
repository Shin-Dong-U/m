package com.goott.eco3.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.goott.eco3.service.ChartService;

import lombok.extern.java.Log;

//@CrossOrigin(origins = {"http://localhost:3000","http://172.16.5.1:3000"})
@CrossOrigin(origins = {"http://localhost:3000"})
@RequestMapping("/chart/*")
@RestController
@Log
public class ChartController {

	
	private ChartService chartService;
	
	@Autowired
	public ChartController(ChartService chartService) {
		this.chartService = chartService;
	}
	
	//월별 판매 정보 get
	@GetMapping(value="/month/sale/{searchRange}",
			produces= {"application/json; charset=UTF-8"})
	public ResponseEntity<Map<String, Object>> getMonthSale(
			@PathVariable("searchRange") int searchRange){
		
		Map<String, Object> result = chartService.getMonthSale(searchRange);
		log.info("결과"+result);
		return new ResponseEntity<>(result,HttpStatus.OK);
	}

	
	
	
}
