package com.goott.eco3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goott.eco3.domain.GoodsCommentVO;
import com.goott.eco3.service.GoodsCommentService;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/comment")
@Log
public class GoodsCommentController {
    
	 private GoodsCommentService mGoodsCommentService;
	
	
	 @Autowired
	public GoodsCommentController(GoodsCommentService mGoodsCommentService) {

		this.mGoodsCommentService = mGoodsCommentService;
	}

//	@GetMapping("/test")
//	public ModelAndView list () throws Exception {
//		ModelAndView mav = new ModelAndView("goods/goods_comment");
//		
//		List<GoodsCommentVO> result = mGoodsCommentService.commentListService();
//		
//		mav.addObject("commList", result);
//		
//		log.info("댓글리스트 :"+result);
//		return mav;
//	}
//	
//	//댓글 리스트
//    @GetMapping("/list")
//    @ResponseBody
//    private List<GoodsCommentVO> mCommentServiceList(Model model) throws Exception{
//        
//    	List<GoodsCommentVO> result = mGoodsCommentService.commentListService();
//    	
//    	System.out.println("댓글리스트 :"+result);
//    	
//        return result;
//    }
//    
    //댓글 작성 
    @RequestMapping("/insert") 
    @ResponseBody
    //private int mGoodsCommentServiceInsert(@RequestParam int GOODS_COMMENT_SEQ, @RequestParam String Memo, @RequestParam String Cust_id) throws Exception{
    private String mGoodsCommentServiceInsert(GoodsCommentVO goodsCommentVO) throws Exception{   

    	
    	log.info("댓글작성 내용: "+goodsCommentVO);
        
    	int result = mGoodsCommentService.GoodsCommentInsertService(goodsCommentVO);
        
    	log.info("댓글쓰기 확인 "+result);
    	
        return "/goods/5";
    }
    
    //댓글 수정 
    @RequestMapping("/update")  
    @ResponseBody
    private int mCommentServiceUpdateProc(@RequestParam int GOODS_COMMENT_SEQ, @RequestParam String Memo) throws Exception{
        
    	GoodsCommentVO comment = new GoodsCommentVO();
        comment.setGoods_comment_seq(GOODS_COMMENT_SEQ);
        comment.setMemo(Memo);
        
        return mGoodsCommentService.GoodsCommentUpdateService(comment);
    }
    
    //댓글 삭제  
    @RequestMapping("/delete/{GOODS_COMMENT_SEQ}") 
    @ResponseBody
    private int mGoodsCommentServiceDelete(@PathVariable int GOODS_COMMENT_SEQ) throws Exception{
        
        return mGoodsCommentService.GoodsCommentDeleteService(GOODS_COMMENT_SEQ);
    }
    
	
	
	
}
