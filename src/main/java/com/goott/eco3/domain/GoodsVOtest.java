package com.goott.eco3.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GoodsVOtest {
	
	private Long goods_seq;
	private Long comp_seq;
	private String goods_name;
	private String goods_detail;
	private Long price;
	private Long qty;
	private String merterial;
	private int category;
	private int ecoScore;
	private Timestamp regDate;
	private String regUser;
	private String editUser;
	private Timestamp editDate;
	private String danger_YN;
	private String sale_YN;
	private String req_option;
}
