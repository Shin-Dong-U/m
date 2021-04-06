package com.goott.eco3.service;

//import java.util.HashMap;
//import java.util.List;
import java.util.Map;

import com.goott.eco3.domain.AdminVO;
import com.goott.eco3.domain.MemberVO;

public interface AdminService {
//	public int getSampleData() throws Exception ;
	/* 모든 관리자 정보 가져오기 */
	//public List<HashMap<String, Object>> getAdminList(); //(PageDTO page);
	
	/* 모든 관리자 정보 가져오기 */
	//public List<MemberVO> getAdminList(); 
	public Map<String, Object> getAdminList(int pageNum); 
		
	/* 모든 업체 정보 가져오기 */
	//public List<MemberVO> getCompanyList(); 
	public Map<String, Object> getCompanyList(int pageNum); 
	
	/* 모든 일반사용자 정보 가져오기 */
	//public List<MemberVO> getCustList(int pageNum); 
	public Map<String, Object> getCustList(int pageNum); 
	
	/* 업체 권한 및 승인 */
	public int confirmCompany(String memberId, String loginId);
	
	/* 관리자 권한 및 등업 */
	public int regAdmin(AdminVO adminVO, String loginId);
	

	/* 관리자 - 변경 */
	public int modAdmin_cust(MemberVO memberVO, String loginId);

	
}
