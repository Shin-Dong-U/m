package com.goott.eco3.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartVO {
	
	private BasketVO basketVO;
	private GoodsVO goodsVO;

}
