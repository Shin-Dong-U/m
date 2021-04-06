package com.goott.eco3.service;

import java.util.HashMap;
import java.util.List;

import com.goott.eco3.domain.GoodsVOtest;

public interface OrderService {
	
	public Long addOrder(String cust_Id, int total_price);
	
	public List<GoodsVOtest> getOrderList(String custId);
	
	public int paidUpdate(String cust_id, Long order_seq);
	
	public HashMap<String,Object> getCheckoutInfo(String cust_Id,Long order_seq);
	
	public Long getTotalPrice(String cust_id, Long order_seq);
	
	public List<HashMap<String,Object>> getPaidList(Long order_seq);
	
	public int orderCancel(Long order_seq);
	
	public int orderCommit(Long order_seq, Long point,String cust_id);
	
	public List<HashMap<String,Object>> getOrderedList(String cust_id);
	
	public List<HashMap<String,Object>> getOrderedListAll();
}
