package com.goott.eco3.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.goott.eco3.domain.GameImageVO;

public interface GameMapper {
	
	public Long getCustPointPlusSum(String cust_id);
	
	public Long getCustPointMinusSum(String cust_id);
	
	public Long getAfterResetCustPointMinusSum(String cust_id);
	
	public HashMap<String,Object> getCheckPlusCnt(String cust_id);
	
	public HashMap<String,Object> getCheckMinusCnt(String cust_id);
	
	public HashMap<String,Object> getCheckRealMinusCnt(String cust_id);
	
	public void resetMinus(String cust_id);
	
	public int insertUseItem(@Param("item_seq") Long item_seq, @Param("cust_id") String cust_id);
	
	public GameImageVO getGameImageInfo(int game_level);
	
	
}
