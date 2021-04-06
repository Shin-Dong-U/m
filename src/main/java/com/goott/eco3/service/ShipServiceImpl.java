package com.goott.eco3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goott.eco3.domain.ShipVO;
import com.goott.eco3.mapper.ShipMapper;

import lombok.extern.java.Log;
@Service
@Log
public class ShipServiceImpl implements ShipService {

	private ShipMapper shipMapper;
	
	@Autowired
	public ShipServiceImpl(ShipMapper shipMapper) {
		this.shipMapper = shipMapper;
	}

	@Override
	public int checkShipInfo(ShipVO shipVO) {
		log.info("service shipVO: "+shipVO);
//		if(shipVO.getOrder_seq()!=null) {
//			int updateResult =  shipMapper.updateCheckoutShipInfo(shipVO);
//			return updateResult;
//		}else {
//			int insertShipInfoResult = shipMapper.insertShipInfo(shipVO);
//			return insertShipInfoResult;
//		}
		
		Long delivery_seq = shipMapper.findShipNum(shipVO);
		
		log.info("배송번호: "+delivery_seq);
		
		if(delivery_seq != null) {
			shipVO.setDelivery_seq(delivery_seq);
			log.info("서비스 shipVO"+shipVO);
			return shipMapper.updateCheckoutShipInfo(shipVO);
		}		
		int insertShipInfoResult = shipMapper.insertShipInfo(shipVO);
		return insertShipInfoResult;
	}


	@Override
	public List<ShipVO> getPaidShipList() {
		 
		return shipMapper.getPaidShipList();
	}

	@Override
	public int updateShipInfo(ShipVO shipVO) {
		log.info("check"+shipVO);
		return shipMapper.updateShipInfo(shipVO);
	}

	@Override
	public List<ShipVO> getShipList(Long order_seq) {
		log.info("check"+order_seq);
		return shipMapper.getShipList(order_seq);
	}
	@Override
	public int insertShipInfo(ShipVO shipVO) {
		
		return shipMapper.insertShipInfo(shipVO);
	}

	

}
