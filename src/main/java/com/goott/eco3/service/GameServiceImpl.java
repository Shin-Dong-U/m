package com.goott.eco3.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goott.eco3.domain.GameImageVO;
import com.goott.eco3.mapper.GameMapper;

@Service
public class GameServiceImpl implements GameService{

	
	private GameMapper gameMapper;

	@Autowired
	public GameServiceImpl(GameMapper gameMapper) {
		this.gameMapper = gameMapper;
	}

	@Override
	public HashMap<String,Object> getCustPointSum(String cust_id) {
		HashMap<String,Object> resultPlusCnt = gameMapper.getCheckPlusCnt(cust_id);
		HashMap<String,Object> resultMinusCnt =gameMapper.getCheckMinusCnt(cust_id);
		HashMap<String,Object> resultRealMinusCnt =gameMapper.getCheckRealMinusCnt(cust_id);
		System.out.println("플러스 카운트: "+resultPlusCnt+'/'+resultMinusCnt);
		
	
		
		int plusCnt = Integer.parseInt(String.valueOf(resultPlusCnt.get("plusCnt")));
		int minusCnt = Integer.parseInt(String.valueOf(resultMinusCnt.get("minusCnt")));
		int realMinusCnt = Integer.parseInt(String.valueOf(resultRealMinusCnt.get("minusCnt")));
			
		
		
		Long plus = 0L;
		Long minus = 0L;
		Long result=0L;
		Long realMinus =0L;
		if(minusCnt !=0 && plusCnt !=0) {
			plus = gameMapper.getCustPointPlusSum(cust_id);
			minus = gameMapper.getCustPointMinusSum(cust_id);
			if(realMinusCnt !=0) {
				realMinus = gameMapper.getAfterResetCustPointMinusSum(cust_id);
			}
			result = plus - minus;
		}else if(plusCnt !=0) {
			plus = gameMapper.getCustPointPlusSum(cust_id);
			result = plus - minus;
		}else {
			result = plus - minus;
		}
		
		
		HashMap<String,Object> userPointInfo = new HashMap<String,Object>();
		userPointInfo.put("point_amount", result);
		userPointInfo.put("totalUsedItem_amount",minus);
		
		if(realMinus<1000L) {
			userPointInfo.put("gage_bar",(realMinus)/10);
			GameImageVO gameImageInfo = gameMapper.getGameImageInfo(1);
			userPointInfo.put("game_level",gameImageInfo.getGame_level());
			userPointInfo.put("level_name",gameImageInfo.getLevel_name());
			userPointInfo.put("img_src",gameImageInfo.getImg_src());
		}else if(1000L<=realMinus&&realMinus<2000L) {
			userPointInfo.put("gage_bar",(realMinus-1000L)/10);
			GameImageVO gameImageInfo = gameMapper.getGameImageInfo(2);
			userPointInfo.put("game_level",gameImageInfo.getGame_level());
			userPointInfo.put("level_name",gameImageInfo.getLevel_name());
			userPointInfo.put("img_src",gameImageInfo.getImg_src());
		}else if(2000L<=realMinus&&realMinus<3000L) {
			userPointInfo.put("gage_bar",(realMinus-2000L)/10);
			GameImageVO gameImageInfo = gameMapper.getGameImageInfo(3);
			userPointInfo.put("game_level",gameImageInfo.getGame_level());
			userPointInfo.put("level_name",gameImageInfo.getLevel_name());
			userPointInfo.put("img_src",gameImageInfo.getImg_src());
		}else if(3000L<=realMinus&&realMinus<4000L) {
			userPointInfo.put("gage_bar",(realMinus-3000L)/10);
			GameImageVO gameImageInfo = gameMapper.getGameImageInfo(4);
			userPointInfo.put("game_level",gameImageInfo.getGame_level());
			userPointInfo.put("level_name",gameImageInfo.getLevel_name());
			userPointInfo.put("img_src",gameImageInfo.getImg_src());
		}else if(4000L<=realMinus&&realMinus<5000L) {
			userPointInfo.put("gage_bar",(realMinus-4000L)/10);
			GameImageVO gameImageInfo = gameMapper.getGameImageInfo(5);
			userPointInfo.put("game_level",gameImageInfo.getGame_level());
			userPointInfo.put("level_name",gameImageInfo.getLevel_name());
			userPointInfo.put("img_src",gameImageInfo.getImg_src());
		}else if(5000L<=realMinus) {
			gameMapper.resetMinus(cust_id);
			minus = 0L;
			userPointInfo.put("gage_bar",(realMinus)/10);
			GameImageVO gameImageInfo = gameMapper.getGameImageInfo(1);
			userPointInfo.put("game_level",gameImageInfo.getGame_level());
			userPointInfo.put("level_name",gameImageInfo.getLevel_name());
			userPointInfo.put("img_src",gameImageInfo.getImg_src());
			
		}
		
		
		
		return userPointInfo;
	}

	@Override
	public int useItem(Long item_seq,String cust_id) {
		
		int insertResult = gameMapper.insertUseItem(item_seq,cust_id);
	
		return insertResult>0? 1 : 0;
	}
	
	
	
	
}
