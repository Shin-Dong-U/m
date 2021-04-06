package com.goott.eco3.mapper;

import java.util.List;
import java.util.Map;

import com.goott.eco3.domain.AdminVO;
import com.goott.eco3.domain.CustVO;


public interface CustMapper {
	
	public List<Map<String, Object>> getCustList(Map<String, Object> searchInfo);
	
	//public String getId(String id);
	public CustVO getCustId(CustVO custVO);  

	/* 특정 회원정보 가져오기 */
	public CustVO getCust(String memberId);
	
	/* 특정 회원정보 가져오기 */
	public AdminVO getAdmin(String memberId);
	
	/* 특정 회원정보 가져오기 */
	public String getCustName(String memberId);
	
	/* 특정 회원 권한  가져오기 */
	public CustVO getCustAuth(String memberId);
	
	/* 로그인  */
	public CustVO getCustLogin(CustVO custVO);
	
	/* 아이디 확인 */
	public String checkCustId(String memberId);
	
	/* 비밀번호 확인 */
	public String checkCustPassword(String memberId);
	
	/* 회원 가입:eco.cust */
	public int joinCust(CustVO custVO);
	
	/* 회원 가입:eco.cust_auth */
	public int joinCustAuth(String memberId);
	
	/* 회원 수정 */
	public int modifyCust(CustVO custVO);
	
	/* 회원 삭제 */
	public int deleteCust(String memberId);
	
	
	/* 회원 삭제 */
	public int deleteCustAuth(String memberId);
	
}
