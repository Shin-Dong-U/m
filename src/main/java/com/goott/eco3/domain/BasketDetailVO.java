package com.goott.eco3.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BasketDetailVO {

	private long basket_seq;
	private long goods_seq;
	private long qty;
	private String purchase_YN;
	private String delete_YN;
	private Timestamp regDate;
	private String regUser;
	private Timestamp editDate;
	private String editUser;
}
