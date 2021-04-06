package com.goott.eco3.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.goott.eco3.common.Criteria;
import com.goott.eco3.domain.AdminVO;
import com.goott.eco3.domain.CompanyVO;
import com.goott.eco3.domain.CustVO;
import com.goott.eco3.domain.MemberVO;

public interface AdminMapper {
	
	/* 모든 관리자 정보 가져오기 */
	public List<MemberVO> getAdminList(Criteria cri); 
	
	/* 모든 일반사용자 목록 갯수 */
	public int totalAdminList();
	
	/* 모든 업체 정보 가져오기 */
	public List<MemberVO> getCompanyList(Criteria cri);
	
	/* 모든 일반사용자 목록 갯수 */
	public int totalCompanyList();
	
	/* 모든 일반사용자 정보 가져오기 */
	public List<MemberVO> getCustList(Criteria cri); 
	
	/* 모든 일반사용자 목록 갯수 */
	public int totalCountCustList();
	
	/* 업체 승인 */
	public int confirmCompany(@Param("memberId")String memberId, @Param("loginId")String loginId);
	
	/* 업체 권한 승인 */
	public int joinCompanyAuth(String memberId);
	
	/* 사용자 권한 승인 */
	public int modCustCompany(@Param("memberId")String memberId, @Param("loginId")String loginId);
	
	/* 관리자 등업 */
	public int regAdmin(@Param("adminVO")AdminVO adminVO, @Param("loginId")String loginId);
	
	/* 관리자 권한 승인 */
	public int joinAdminAuth(String cust_id);
	
	/* 관리자 cust변경 */
	public int confirmCustAdmin(@Param("memberId")String memberId, @Param("loginId")String loginId);
	
	
	/* 관리자가 사용자 변경 */
	public int modAdmin_cust(@Param("custVO")CustVO custVO, @Param("loginId")String loginId);
	
	/* 관리자가 업체 변경 */	
	public int modAdmin_comp(@Param("compVO")CompanyVO compVO, @Param("loginId")String loginId);
	
	/* 관리자가  관리자 변경 */	
	public int modAdmin_admin(@Param("adminVO")AdminVO adminVO, @Param("loginId")String loginId);
	
	/* 회원  탈퇴 -> 복구 */
	public int  regCust_Auth(String memberId);
	
	/* 회원이 존재 하는가?  */
	public String getCustAuth(String memberId);
	
	/* 관리자 -> 일반 사용자로 이동: cust_auth에서 권한 삭제 */
	public int removeAdmin_custAuth(String memberId);
	
	/* 관리자 -> 일반 사용자로 이동: admin에서 내용 삭제 */
	public int removeAdmin_admin(String cust_id);
	
	/* 관리자 -> 일반 사용자로 이동: cust에서 admin_yn 변경 */
	public int modCust_adminYN(@Param("memberId")String memberId, @Param("loginId")String loginId);
	
	
}
