package com.goott.eco3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.goott.eco3.service.BoardService;

@Controller
@RequestMapping("/board/*")

public class boardController {

		private BoardService boardService;
		
		@Autowired
		public boardController(BoardService boardService) {
			this.boardService = boardService;
		}
		

		//검색
//
//		@GetMapping("/searchedlist")
//			public String searchedlist(@RequestParam("goods_name") String goods_name, Model model) {
//			//int countArticle(String searchOption, String keyword);
//			
//			System.out.println("start");
//			System.out.println("검색: "+ goods_name);
//			
//			model.addAttribute("goods_name", goods_name);
//			return "board/cateGoodslist";	
//		}
//		

		
		
		
		//카테고리 클릭->해당 카테고리 상품목록 페이지
		@GetMapping("/catelist")
			public String cateList(@RequestParam("cate_seq") int cate_seq, Model model) {
			
			System.out.println("start");
			System.out.println("선택 카테고리: "+ cate_seq);
			
			model.addAttribute("cate_seq",cate_seq);
			return "board/cateGoodslist";
		}
		//${cate_seq}
		
		


		


		
		
	
	
}
