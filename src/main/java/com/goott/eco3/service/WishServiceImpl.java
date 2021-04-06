package com.goott.eco3.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goott.eco3.mapper.WishMapper;

import lombok.extern.java.Log;

@Service
@Log
public class WishServiceImpl implements WishService {
	
	private WishMapper wishMapper;	
	
	@Autowired
	public WishServiceImpl(WishMapper wishMapper) {	
		this.wishMapper = wishMapper;
	}

	@Override
	public List<HashMap<String,Object>> getWishList(String cust_id) {
		
		return wishMapper.getWishList(cust_id);
	}

//	@Override
//	public GoodsVOtest getGoodsInfo(Long goods_seq) {
//		
//		return wishMapper.getGoodsInfo(goods_seq);
//	}

	@Override
	public int deleteGoodsAtWish(String cust_id, Long goods_seq) {
		log.info("장바구니 삭제: "+cust_id+" / "+goods_seq);
		return wishMapper.delGoodsAtWish(cust_id,goods_seq);
	}

	@Override
	public int purGoodsAtWish(String cust_id, Long goods_seq) {
		log.info("장바구니 구매된: "+cust_id+" / "+goods_seq);
		
		return wishMapper.purGoodsAtWish(cust_id,goods_seq);
	}

	//상품 담아두기에 추가
	@Override
	public int addGoodsAtWish(HashMap<String,Object> orderInfo) {
	
		Long checkExist = wishMapper.checkExistWish(orderInfo);
		//Long checkExist = basketMapper.checkExistBasket(cust_id);
		log.info("checkExist: "+checkExist);
		
		if(checkExist==0L || checkExist==null) {
			int createBasket = wishMapper.createWish(orderInfo);
			//int createBasket = basketMapper.createBasket(cust_id);
			log.info("createBasket: "+createBasket);
			return wishMapper.addGoodsAtWish(orderInfo);
			
		}else if(checkExist!=0L) {
			if(wishMapper.checkSameGoods(orderInfo) !=0L) {
				return 0;
			}
			return wishMapper.addGoodsAtWish(orderInfo);
		}else {
			return 0;
		}
		
		//return basketMapper.addGoodsAtBasket(cust_id,goods_seq,qty);
	}

	@Override
	public int changeQtyAtWish(String cust_id, Long goods_seq, Long qty) {
		
		
		return wishMapper.changeQtyAtWish(cust_id,goods_seq,qty);
	}

	@Override
	public int countWishGoods(String cust_id) {
		
		int result = wishMapper.countWishGoods(cust_id);
		
		if(result != 0) {
			return result;
		}
		
		return 0;
	}

	

}
