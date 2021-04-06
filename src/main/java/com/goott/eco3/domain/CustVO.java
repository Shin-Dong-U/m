package com.goott.eco3.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustVO {

	private String memberId;	// 아이디
	private String password;	// 비밀번호
	private String name;		// 이름
	private String phone;       // ex)01011112222
	private String email;       // email 
	private String addr_post;   // 우편번호
	private String addr_city;   // 주소 도 , 시 , 동
	private String addr_detail; // 주소 상세 정보
	private String birth;       // 생년월일  ex)990101 
	private Long sex;           // 성별 [1]-남자 [2]-여자
	private String company_yn;  // 일반고객or회사 [y]-회사 [n]-일반사용자
	private String member_yn;   // 회원탈퇴 여부
	private Timestamp regDate;  // 가입 날짜
	private String regUser;     // 가입한 회원
	private Timestamp editDate; // 수정 날짜
	private String editUser;    // 수정한 회원
	private Long myTree;      	// Tree 정보 [A]-새싹 [E]-나무
	private Long myMil;         // Mileage정보 
	private Long bar_status;	// Mileage상태 bar 0~9
	private String admin_yn;	// 일반 사용자 or 관리자 [y]-admin [n]-user
	private Long seed_yn;		// 씨앗 여부 [y]- [n]-

	private List<CustAuthVO> authList;		//권한[admin, company, customer]
}
