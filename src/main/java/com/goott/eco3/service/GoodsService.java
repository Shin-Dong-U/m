package com.goott.eco3.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.goott.eco3.common.Criteria;
import com.goott.eco3.domain.GoodsCommentVO;
import com.goott.eco3.domain.GoodsVO;

public interface GoodsService {
	public Map<String, Object> goodsList(Criteria cri);
	
	public Map<String, Object> goodsDetail(int goodsSeq);
	
	public int insertGoods(GoodsVO vo);
	public List<Map<String, Object>> insertThumbnail(MultipartFile[] files, GoodsVO.GoodsThumbNailVO thumbVO);
	
	public Map<String, Object> goodsComment(int goodsSeq, int pageNum);
	
	public int updateReview(GoodsVO.GoodsCommentVO commentVO);
	public int insertReview(GoodsVO.GoodsCommentVO commentVO);
	public int deleteReview(GoodsVO.GoodsCommentVO commentVO);
	
	public void testTransaction();
}
