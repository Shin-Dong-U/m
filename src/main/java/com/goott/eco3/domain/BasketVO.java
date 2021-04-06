package com.goott.eco3.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BasketVO {
	
	private long basket_seq;
	private String cust_Id;	
	private Timestamp regDate;
	private String regUser;
	private Timestamp editDate;
	private String editUser;

}
