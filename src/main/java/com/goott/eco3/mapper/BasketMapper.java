package com.goott.eco3.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.goott.eco3.domain.GoodsVOtest;

public interface BasketMapper {
	
	public List<HashMap<String,Object>> getBasketList(String cust_id);
	
	public GoodsVOtest getGoodsInfo(Long goods_seq);
	
	public int delGoodsAtBasket(@Param("cust_id") String cust_id, @Param("goods_seq") Long goods_seq);
	
	public int purGoodsAtBasket(@Param("cust_id") String cust_id, @Param("goods_seq") Long goods_seq);
	
	//public int addGoodsAtBasket(@Param("cust_id") String cust_id, @Param("goods_seq") Long goods_seq, @Param("qty") Long qty);
	
	public int addGoodsAtBasket(HashMap<String,Object> orderInfo);
	
	public Long checkExistBasket(HashMap<String,Object> orderInfo);
	
	public Long checkSameGoods(HashMap<String,Object> orderInfo);
	
	//public int createBasket(String cust_id);
	public int createBasket(HashMap<String,Object> orderInfo);
	
	public int changeQtyAtBasket(@Param("cust_id") String cust_id, @Param("goods_seq") Long goods_seq, @Param("qty") Long qty);
	
	public int countBasketGoods(String cust_id);

}
