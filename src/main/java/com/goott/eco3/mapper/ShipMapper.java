package com.goott.eco3.mapper;

import java.util.List;

import com.goott.eco3.domain.ShipVO;

public interface ShipMapper {
	
	public int insertShipInfo(ShipVO shipVO);
	
	public List<ShipVO> getPaidShipList();
	
	public int updateShipInfo(ShipVO shipVO);
	
	public List<ShipVO> getShipList(Long order_seq);
	
	public Long findShipNum(ShipVO shipVO);
	
	public int updateCheckoutShipInfo(ShipVO shipVO);

}
