package com.goott.eco3.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminVO {
	private String cust_id;			// eco.cust custId와 동일
	private String name;            // custName이름과 동일
	private String acc_level;       // 관리자 등급 1:총관리자 2:중앙관리자 3: 신입관리자
	private Timestamp regDate;      // 가입 일자
	private String regUser;         // 가입 유저
	private Timestamp editDate;     // 수정 날짜
	private String editUser;        // 수정 자 
	
	
}
