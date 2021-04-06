package com.goott.eco3.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goott.eco3.domain.GoodsVOtest;
import com.goott.eco3.mapper.BasketMapper;

import lombok.extern.java.Log;

@Service
@Log
public class BasketServiceImpl implements BasketService {
	
	private BasketMapper basketMapper;	
	
	@Autowired
	public BasketServiceImpl(BasketMapper basketMapper) {	
		this.basketMapper = basketMapper;
	}

	@Override
	public List<HashMap<String,Object>> getBasketList(String cust_id) {
		
		return basketMapper.getBasketList(cust_id);
	}

	@Override
	public GoodsVOtest getGoodsInfo(Long goods_seq) {
		
		return basketMapper.getGoodsInfo(goods_seq);
	}

	@Override
	public int deleteGoodsAtBasket(String cust_id, Long goods_seq) {
		log.info("장바구니 삭제: "+cust_id+" / "+goods_seq);
		return basketMapper.delGoodsAtBasket(cust_id,goods_seq);
	}

	@Override
	public int purGoodsAtBasket(String cust_id, Long goods_seq) {
		log.info("장바구니 구매된: "+cust_id+" / "+goods_seq);
		
		return basketMapper.purGoodsAtBasket(cust_id,goods_seq);
	}

	//상품 장바구니에 추가
	@Override
	public int addGoodsAtBasket(HashMap<String,Object> orderInfo) {
	
		Long checkExist = basketMapper.checkExistBasket(orderInfo);
		
		//Long checkExist = basketMapper.checkExistBasket(cust_id);

		if(checkExist==0L || checkExist==null) {
			int createBasket = basketMapper.createBasket(orderInfo);
			//int createBasket = basketMapper.createBasket(cust_id);
			log.info("createBasket: "+createBasket);
			return basketMapper.addGoodsAtBasket(orderInfo);
			
		}else if(checkExist!=0L) {
			if(basketMapper.checkSameGoods(orderInfo) !=0L) {
				return 0;
			}
			return basketMapper.addGoodsAtBasket(orderInfo);
		}else {
			return 0;
		}
		
		//return basketMapper.addGoodsAtBasket(cust_id,goods_seq,qty);
	}

	@Override
	public int changeQtyAtBasket(String cust_id, Long goods_seq, Long qty) {
		
		
		return basketMapper.changeQtyAtBasket(cust_id,goods_seq,qty);
	}

	@Override
	public int countBasketGoods(String cust_id) {
		
		int result = basketMapper.countBasketGoods(cust_id);
		
		if(result != 0) {
			return result;
		}
		
		return 0;
	}

}
