package com.goott.eco3.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

//@RestController
@Controller
public class TestController {

	//@GetMapping("/api/hello")
	//public String hello(){
	//return "안녕하세요. 현재 서버시간은! "+new Date() +"입니다. \n";
	//}
	
	@GetMapping("/test")
	public void test( ) {

	}
	@RequestMapping(value="/test/1", method= {RequestMethod.POST})
	public void String(@RequestParam("cal")String cal) {
		System.out.println("cal의 반환"+cal);
	}
	
	@RequestMapping(value="/kkkk", method= {RequestMethod.GET})
	public String String() {
		System.out.println();
		return "tttt";
	}

}
