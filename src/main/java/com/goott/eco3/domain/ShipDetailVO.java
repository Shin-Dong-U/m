package com.goott.eco3.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ShipDetailVO {

	private String delivery_seq;
	private String order_seq;
	private String reguser;
	private Timestamp regdate;
	private Timestamp editdate;
	private String edituser;
}
