package com.goott.eco3.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CustomDataVO {
	private String cust_id;
	private Long order_seq;
}
