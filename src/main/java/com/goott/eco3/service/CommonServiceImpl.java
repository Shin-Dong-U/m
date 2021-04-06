package com.goott.eco3.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goott.eco3.mapper.GoodsMapper;

@Service
public class CommonServiceImpl implements CommonService{

	@Autowired GoodsMapper goodsMapper;
	
	//Todo. 캐쉬 올라가게 설정. 
	@Override
	public List<Map<String, Object>> categoryList() {
		return goodsMapper.goodsCategoryList();
	}

}
