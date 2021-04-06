package com.goott.eco3.service;

import java.util.HashMap;

public interface GameService {

	public HashMap<String,Object> getCustPointSum(String cust_id);
	
	public int useItem(Long item_seq, String cust_id);
	
	
	
}
