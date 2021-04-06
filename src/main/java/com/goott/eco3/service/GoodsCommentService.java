package com.goott.eco3.service;

import java.util.List;

import com.goott.eco3.domain.GoodsCommentVO;



public interface GoodsCommentService {

	public List<GoodsCommentVO> commentListService();

	public int GoodsCommentInsertService(GoodsCommentVO comment);

	public int GoodsCommentUpdateService(GoodsCommentVO comment);
	
	public int GoodsCommentDeleteService(int GOODS_COMMENT_SEQ);

}
