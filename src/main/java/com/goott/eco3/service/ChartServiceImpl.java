package com.goott.eco3.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goott.eco3.mapper.ChartMapper;

import lombok.extern.java.Log;

@Service
@Log
public class ChartServiceImpl implements ChartService {
	
	private ChartMapper chartMapper;

	@Autowired
	public ChartServiceImpl(ChartMapper chartMapper) {
		this.chartMapper = chartMapper;
	}

	@Override
	public Map<String, Object> getMonthSale(int searchRange) {
//		List<HashMap<String, Object>> sales = new ArrayList<HashMap<String, Object>>(12);
//		for(int i=1 ; i<=12 ;i++) {
//			String dateRange1= null;
//			String dateRange2= null;
//			if(i<9) {
//				dateRange1= "20210"+i+"01";
//				dateRange2= "20210"+(i+1)+"01";
//			}else if(i<10) {
//				dateRange1= "20210"+i+"01";
//				dateRange2= "2021"+(i+1)+"01";
//			}else if(i<12) {
//				dateRange1= "2021"+i+"01";
//				dateRange2= "2021"+(i+1)+"01";
//			}else {
//				dateRange1= "2021"+i+"01";
//				dateRange2= "2021"+i+"31";
//			}
//			
//			HashMap<String, Object> salesResult = chartMapper.getMonthSale(dateRange1,dateRange2);
//			sales.add(salesResult);
//		}
		//List<HashMap<String, Object>> sales = chartMapper.getMonthSale(searchRange);
		List<HashMap<String, Object>> sales = chartMapper.getMonthSale(2020);
		List<HashMap<String, Object>> sales2 = chartMapper.getMonthSale(2021);
		Map<String, Object> data = new HashMap<>();
		data.put("sales2020", sales);
		data.put("sales2021", sales2);
		
		
		return data;
	}

}
