package com.goott.eco3.security;

import org.springframework.ui.Model;

import lombok.extern.java.Log;

//@Controller
@Log
public class CustomLogout {

	
	//@GetMapping("/sample/logout")
	public String loginInput(String error, String logout, Model model) {
		
		log.info("error: "+ error);
		log.info("logout: "+ logout);
		
		if(error != null) {
			model.addAttribute("error","Login Error Check Your Account");
		}
		
		if(logout !=null) {
			model.addAttribute("logout","Logout!!!");
		}
		
		return "/home/index";
	}
	
}
