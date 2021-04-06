package com.goott.eco3.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.goott.eco3.common.Criteria;
import com.goott.eco3.domain.GoodsCommentVO;
import com.goott.eco3.domain.GoodsVO;
import com.goott.eco3.domain.GoodsVO.GoodsDetailImgVO;

public interface GoodsMapper {
	public int totalCountGoodsList(Criteria cri);
	public List<Map<String, Object>> goodsList(Criteria cri);
	
	public void test(Map<String, Object> param);
	public void insertGoods(GoodsVO goodsVO);
	public int realDeleteGoods(int goodsSeq);
	public int insertGoodsThumbNail(GoodsVO.GoodsThumbNailVO goodsVO);
	
	public Map<String, Object> goodsDetail(int goodsSeq);
	public List<Map<String, Object>> goodsDetailThumbImg(int goodsSeq);
	public List<Map<String, Object>> goodsDetailImg(int goodsSeq);
	public List<Map<String, Object>> goodsReqOption(int goodsSeq);	
	public List<Map<String, Object>> goodsCategoryList();
	
	public int totalCountGoodsComment(@Param("goodsSeq") int goodsSeq);
	public List<Map<String, Object>> goodsComment(@Param("goodsSeq") int goodsSeq, @Param("start") int start);	
	public int updateReview(GoodsVO.GoodsCommentVO commentVO);
	public int insertReview(GoodsVO.GoodsCommentVO commentVO);
	public int deleteReview(GoodsVO.GoodsCommentVO commentVO);
	
	public int insertGoodsDetailImg(GoodsDetailImgVO imgVO);
	public int updateGoodsOnlyGoodsDetailColumn(GoodsVO goodsVO);
}
