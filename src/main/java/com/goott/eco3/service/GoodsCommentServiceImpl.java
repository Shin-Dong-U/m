package com.goott.eco3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goott.eco3.domain.GoodsCommentVO;
import com.goott.eco3.mapper.GoodsCommentMapper;

@Service
public class GoodsCommentServiceImpl implements GoodsCommentService{
	
	GoodsCommentMapper mGoodsCommentMapper;
	
	@Autowired
	public GoodsCommentServiceImpl(GoodsCommentMapper mGoodsCommentMapper) {
		this.mGoodsCommentMapper = mGoodsCommentMapper;
	}

	@Override
	public List<GoodsCommentVO> commentListService() {
		return mGoodsCommentMapper.commentList();
	}

	@Override
	public int GoodsCommentInsertService(GoodsCommentVO comment) {
		return mGoodsCommentMapper.commentInsert(comment);
	
	}

	@Override
	public int GoodsCommentUpdateService(GoodsCommentVO comment) {
		return mGoodsCommentMapper.commentUpdate(comment);
	}

	@Override
	public int GoodsCommentDeleteService(int GOODS_COMMENT_SEQ) {
		return  mGoodsCommentMapper.commentDelete(GOODS_COMMENT_SEQ);
	}

}
