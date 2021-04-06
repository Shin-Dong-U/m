package com.goott.eco3.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.goott.eco3.service.CommonService;

import lombok.extern.java.Log;

@Controller
@Log
@CrossOrigin(origins ="http://localhost:3000")
//@RequestMapping("/orders/*")
public class PageController {
	@Autowired private CommonService commonService;
	
//	@GetMapping("/goods/{goods_seq}")
//	public String goodsDetail(Model model,HttpServletRequest request,
//				@PathVariable("goods_seq") int goods_seq) {
//		model.addAttribute("goods_seq", goods_seq);
//		//${goods_seq} 해당상품번호 jsp에서 출력
//		log.info("goodsDetail페이지 이동");
//		
//		return "goods/goods_detail";
//	}

	@GetMapping("/deli/delilist")
	public String list3(Model model) {
		log.info("alldelivery페이지 이동");
		return "deli/delilist";
	}
	
	@GetMapping("/paidGoods/list")
	public String list4(Model model) {
		log.info("paidGoods페이지 이동");
		return "paidGoods/list";
	}
//	@GetMapping("/page/searchedGoodslist")
//	public String search(Model model) {
//		log.info("searchedGoodsList페이지 이동");
//		return  "board/searchedGoodslist";
//	}

	@GetMapping("/game/tree")
	public void game() {
		log.info("game페이지 이동");
		//return "orders/basket/list";
	}

	@GetMapping("/orders/basket/list")
	public void list(Model model,HttpServletRequest request ) {
		String cust_id = (String) request.getSession().getAttribute("memberId");
		log.info("session cust_id: "+cust_id);
		log.info("list페이지 이동");
		
		//return "orders/basket/list";
	}
	
	@GetMapping("/orders/basket/wishlist")
	public void wishlist(Model model,HttpServletRequest request ) {
		String cust_id = (String) request.getSession().getAttribute("memberId");
		log.info("session cust_id: "+cust_id);
		log.info("wishlistlist페이지 이동");
		
		//return "orders/basket/list";
	}
	
	@GetMapping("/orders/order/checkout")
	public void checkout(@RequestParam Long order_seq,Model model) {
		log.info("checkout페이지 이동");
		
		model.addAttribute("order_seq",order_seq);
		
		//return "orders/order/checkout";
	}
	
	@GetMapping("/orders/order/orderCheck")
	public void orderCheck(@RequestParam Long order_seq,Model model) {
		model.addAttribute("order_seq",order_seq);
		log.info("orderCheck페이지 이동");
	}

	
	@GetMapping("/orders/ship/writeShipInfo")
	public void writeShipInfo(@RequestParam Long order_seq,Model model) {
		model.addAttribute("order_seq",order_seq);
		log.info("writeShipInfo페이지 이동");
	}
	
	@GetMapping("/delivery/deliveryCheck")
	public void deliveryCheck(Model model) {
		log.info("deliveryCheck페이지 이동");
	}
	
	
	@GetMapping("/orders/order/pay")
	public String pay(Model model) {
		log.info("pay페이지 이동");
		return "orders/order/pay";
	}

//	@GetMapping("/home/contact")
//	public void contact(Model model) {
//		log.info("contact페이지 이동");
//		
//	}

	@GetMapping({"", "/home/index"})
	public String index(Model model) {
		log.info("index페이지 이동");
        return "home/index";
	}
	
	@GetMapping("/cust/my-account")
	public ModelAndView myAccount(Model model) {
		log.info("my-account페이지 이동");
		ModelAndView mav = new ModelAndView("cust/my-account");
		mav.addObject("cateList", commonService.categoryList());
		return mav;
		
	}
	
	@GetMapping("/home/my-account-order")
	public void myAccountorder(Model model) {
		log.info("my-account페이지 이동");
		
	}
//	@GetMapping("/board/catelist")
//	public void CateList(Model model) {
//		log.info("CateList페이지 이동");
//		
//	}
	
	@GetMapping("/products/product-detail-order")
	public void productDetail(Model model) {
		log.info("product-detail페이지 이동");
		
	}
//	@GetMapping("/products/product-list")
//	public void productList(Model model) {
//		log.info("product-list페이지 이동");
//		
//	}
//	@GetMapping("/orders/wishlist")
//	public void wishlist(Model model) {
//		log.info("wishlist페이지 이동");
//		
//	}

	/* 로그인 페이지 이동 */
	@RequestMapping(value="/home/login", method= {RequestMethod.POST, RequestMethod.GET})
	public void login(HttpServletRequest request) {	
		String referrer = request.getHeader("Referer");	
		if(referrer!=null) {
			String result = referrer.substring(referrer.lastIndexOf("/")+1);
			if(result.equals("login")||result.equals("register")) return;
			
			System.out.println("이전페이지url: "+referrer);
		    request.getSession().setAttribute("prevPage", referrer);
		}
		log.info("login페이지 이동");
	}
	
	/* 회원가입 이동 */
	@GetMapping("/home/register")
	public void register() {
		log.info("register페이지 이동");
	}
	
	/* 내 정보 페이지 이동 */
	@GetMapping("cust/account")
	public void account() {
		log.info("account페이지 이동");
	}
	
	/* 카카오 로그인 이동*/
	//@GetMapping("/home/kakao")
	//public String kakaoLogin() {
	//	return "/home/kakao_login";
	//}
	

	/* 관리자 페이지 이동 */
	@GetMapping("/admin/admin")
	public void admin() {
		
	}
	/* list 페이지 이동 */
//	@GetMapping("/cust/list")
//	public void custList() {
//
//	}

	@GetMapping("/game/item")
	public void item(Model model) {
		System.out.println("item페이지이동");
	}


	
	

	/*
	 * @GetMapping("/goods/detail") public void goodsDetail(Model model) {
	 * log.info("상품상세페이지이동"); }
	 * 
	 * @GetMapping("/goods/list") public void goodsList(Model model) {
	 * log.info("상품리스트페이지이동"); }
	 */
}
