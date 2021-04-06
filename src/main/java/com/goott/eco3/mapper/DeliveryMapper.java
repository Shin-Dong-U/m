package com.goott.eco3.mapper;

import java.util.List;

import com.goott.eco3.domain.DeliveryVO;
import com.goott.eco3.domain.GoodsVO;

public interface DeliveryMapper {
	
	public List<DeliveryVO>  getallDeliveryList();

	public List<DeliveryVO> getDeliveryList(Long invoice_no);
	
	public List<GoodsVO> getPaidGoodsList();
	
	public List<DeliveryVO> getmyDeliveryList(String cust_id);
}
