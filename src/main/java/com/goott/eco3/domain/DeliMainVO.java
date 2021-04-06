package com.goott.eco3.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DeliMainVO {

	private Long delivery_seq;
	private Long invoice_no;
	private String delivery_status;
	private Timestamp regDate;
	private String regUser;
	private Timestamp editDate;
	private String editUser;
	private String sender_name;
	private String sender_phone;
	private String sender_addr_post;
	private String sender_addr_city;
	private String sender_addr_detail;
	private String cust_name;
	private String cust_phone;
	private String cust_addr_post;
	private String cust_addr_city;
	private String cust_addr_detail;
	private int    delivery_company;
}
