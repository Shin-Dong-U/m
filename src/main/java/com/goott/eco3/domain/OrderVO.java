package com.goott.eco3.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderVO {
	private Long order_seq;
	private String cust_id;
	private String paied_yn;
	private Timestamp regDate;
	private String regUser;
	private Timestamp editDate;
	private String editUser;
	private int status;
	private String ori_number;
}
