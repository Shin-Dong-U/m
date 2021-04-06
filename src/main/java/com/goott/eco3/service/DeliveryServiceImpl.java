package com.goott.eco3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goott.eco3.domain.DeliveryVO;
import com.goott.eco3.mapper.DeliveryMapper;

import lombok.extern.java.Log;

@Service
@Log
public class DeliveryServiceImpl implements DeliveryService{
	
	private DeliveryMapper deliveryMapper;
	
	@Autowired
	public DeliveryServiceImpl(DeliveryMapper deliveryMapper) {
		this.deliveryMapper = deliveryMapper;
	}
	
	//배송 리스트 조회 
	@Override
	public List<DeliveryVO> getDeliveryList(long invoice_no) {
		
		return deliveryMapper.getDeliveryList(invoice_no);
	}

	//결제완료된(3) 주문 리스트
	@Override
	public List<DeliveryVO> getDeliveryList( ) {
		
		return null;//deliveryMapper.getDeliveryList();
	
	}


	@Override
	public List<DeliveryVO> getDeliveryList(String delivery_seq) {
		// TODO Auto-generated method stub
		return null;
	}
	


}
