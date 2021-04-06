package com.goott.eco3.service;

import java.util.List;
import java.util.Map;

import com.goott.eco3.domain.CustVO;
import com.goott.eco3.domain.MemberVO;

public interface CustService {
	
	public List<Map<String, Object>> getCustList(Map<String, Object> searchInfo);
	

	public CustVO getCustId(CustVO custVO);

	/* 특정 회원 정보 가져오기 */
	public MemberVO getCust(MemberVO memberVO);
	
	/* 로그인 */
	public CustVO getCustLogin(CustVO custVO);
	
	/* 아이디 확인 */
	public String checkCustId(String memberId);
	
	/* 비밀번호 확인 */
	public int checkCustPassword(CustVO custVO);
	
	/* 회원가입 */
	public int joinCust(MemberVO memberVO);
	
	/* 회원 수정 */
	public int modifyCust(CustVO custVO);
	
	/* 회원 삭제 */
	public int deleteCust(String memberId);
	
}
