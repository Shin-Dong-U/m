package com.goott.eco3.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GameItemVO {

	private Long item_seq;
	private String item_name;
	private Long item_price;
	private String item_memo;
	
}
