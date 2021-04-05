package com.goott.eco3;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goott.eco3.mapper.SimpleMapper;

@Controller
public class TestController {
	
	@Autowired private SimpleMapper sm;
	
	@RequestMapping("/")
	public ModelAndView test() {
		System.out.println("@@" + sm.getCount());
		return new ModelAndView("index");
	}
}
