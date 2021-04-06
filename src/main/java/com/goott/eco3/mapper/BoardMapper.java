package com.goott.eco3.mapper;

import java.util.List;

import com.goott.eco3.domain.GoodsVO;


public interface BoardMapper {

	public List<GoodsVO> getsearchedGoodsList(String goods_name);
	
	public int getCateList(int cate_seq);

//	public String getSearchedlist(String goods_name);
}
