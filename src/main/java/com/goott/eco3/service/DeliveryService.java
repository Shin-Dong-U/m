package com.goott.eco3.service;

import java.util.List;

import com.goott.eco3.domain.DeliveryVO;

public interface DeliveryService {
	
	public List<DeliveryVO> getDeliveryList(long invoice_no);
	
	public List<DeliveryVO> getDeliveryList();
	

	public List<DeliveryVO> getDeliveryList(String delivery_seq);

}
