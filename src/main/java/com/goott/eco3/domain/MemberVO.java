package com.goott.eco3.domain;

import lombok.Data;

@Data
public class MemberVO {
	private CustVO custVO = new CustVO();
	private CompanyVO compVO = new CompanyVO();
	private AdminVO adminVO= new AdminVO();
}
