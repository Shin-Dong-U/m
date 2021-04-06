package com.goott.eco3.service;

//import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.goott.eco3.common.Criteria;
import com.goott.eco3.common.PageDTO;
import com.goott.eco3.domain.AdminVO;
import com.goott.eco3.domain.CustVO;
import com.goott.eco3.domain.MemberVO;
import com.goott.eco3.mapper.AdminMapper;
import com.goott.eco3.mapper.CompanyMapper;
import com.goott.eco3.mapper.CustMapper;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired 
	private AdminMapper adminDao;
	
	@Autowired 
	private CustMapper custDao;
	
	@Autowired 
	private CompanyMapper compDao;
	
//	@Autowired 
//	private GoodsMapper goodsDao;
	
	
	@Setter(onMethod_ = { @Autowired})
	private PasswordEncoder pwEncoder;
	
	/*
	@Transactional
	@Override
	public int getSampleData() throws Exception {
		GoodsSampleDataMaker sampleMaker = new GoodsSampleDataMaker();
		
		
		ArrayList<String> idList = new ArrayList<String>();
		
		for(int i = 1; i < 10; i++) {
			sampleMaker.setCurrPage(i);
			
			String[] productsId = sampleMaker.getProductIdList();
			
			for(String id : productsId) {idList.add(id);}
		}
		
		String tmpUrl;
		for(String id : idList) {
			GoodsVO goodsVO = new GoodsVO();
			tmpUrl = sampleMaker.getProductDetailUrl(id);
			goodsVO = sampleMaker.getProductInfo(tmpUrl);
			
			goodsDao.insertGoods(goodsVO);
			goodsDao.insertGoodsThumbNail(goodsVO);
		}
		
		
		return 0;
	}
	
	*/
	/* 모든 관리자 정보 가져오기 */
	@Transactional
	@Override
	public Map<String, Object> getAdminList(int pageNum) {
		Criteria cri = new Criteria(pageNum,10);
		PageDTO page = new PageDTO(cri, adminDao.totalAdminList());
		
		List<MemberVO> compList = adminDao.getAdminList(cri);
		Map<String, Object> custMap = new HashMap<>();
		custMap.put("memberVO", compList);
		custMap.put("page", page);
		
		return custMap;
	}
	
	/* 모든 업체 정보 가져오기 */
	@Transactional
	@Override
	public Map<String, Object> getCompanyList(int pageNum) {
		Criteria cri = new Criteria(pageNum,10);
		PageDTO page = new PageDTO(cri, adminDao.totalCompanyList());
		
		List<MemberVO> adminList = adminDao.getCompanyList(cri);
		Map<String, Object> custMap = new HashMap<>();
		custMap.put("memberVO", adminList);
		custMap.put("page", page);
		
		return custMap;
	}

	/* 모든 일반사용자 정보 가져오기 */
	@Transactional
	@Override
	public Map<String, Object> getCustList(int pageNum) {
		Criteria cri = new Criteria(pageNum,10);
		PageDTO page = new PageDTO(cri, adminDao.totalCountCustList());
		
		
		List<MemberVO> custList = adminDao.getCustList(cri);
		Map<String, Object> custMap = new HashMap<>();
		custMap.put("memberVO", custList);
		custMap.put("page", page);
		
		return custMap;
	}
	
	
	/* 업체 관한 및 승인 */
	@Transactional
	@Override
	public int confirmCompany(String memberId, String loginId) {	
		if(adminDao.confirmCompany(memberId,loginId)==1 
			&& adminDao.joinCompanyAuth(memberId)==1
				&& adminDao.modCustCompany(memberId, loginId)==1)return 1;
		else{
			return 0;
		}
	}
	
	/* 관리자 권한 및 등업 */
	@Transactional
	@Override
	public int regAdmin(AdminVO adminVO, String loginId) {
		adminVO.setName(custDao.getCustName(adminVO.getCust_id()));
		int v1 = adminDao.regAdmin(adminVO, loginId);
		int v2 = adminDao.joinAdminAuth(adminVO.getCust_id());
		int v3 = adminDao.confirmCustAdmin(adminVO.getCust_id(), loginId);
		System.out.println(v1+"|"+v2+"|"+v3);
		if(v1==1 && v2==1 && v3==1) {
			return 1;
		}else {
			return 0;
		}
		//if(adminDao.regAdmin(adminVO, loginId)==1 
		//		&& adminDao.joinAdminAuth(adminVO.getCust_id())==1
		//			&& adminDao.confirmCustAdmin(loginId)==1) return 1;
		//else{
		//	return 0;
		//}
	}
	
	/* 관리자 - 변경 */
	@Transactional
	@Override
	public int modAdmin_cust(MemberVO memberVO, String loginId) {
		String memberId = memberVO.getCustVO().getMemberId();
		
		CustVO newCustVO = custDao.getCust(memberId);

		int v1=0, v2=0, v3 =0;
		passwordEncoding(memberVO.getCustVO());
		
		//회원 정보 변경
		v3 = adminDao.modAdmin_cust(memberVO.getCustVO(), loginId);
		
		//회원탈퇴???
		//회원 가입여부 *존재*
		if(memberVO.getCustVO().getMember_yn().equals("Y")) {
			String exgist_auth=adminDao.getCustAuth(memberVO.getCustVO().getMemberId());
			if(exgist_auth.equals("false")) {	//cust_auth에 권한이 존재하지 않는다.
				adminDao.regCust_Auth(memberVO.getCustVO().getMemberId());
			}
		}else {
			String exgist_auth=adminDao.getCustAuth(memberVO.getCustVO().getMemberId());
			if(exgist_auth.equals("true")) {	//cust_auth에 권한이 존재한다.
				custDao.deleteCustAuth(memberVO.getCustVO().getMemberId());
			}
			
			if(newCustVO.getCompany_yn().equals("Y")) {
				compDao.removeCompany(memberId);
			}else if(newCustVO.getAdmin_yn().equals("Y")) {
				
			}
		}
		
		
		//관리자 정보 변경
		if(newCustVO.getAdmin_yn().equals("Y")) {
			v1=adminDao.modAdmin_admin(memberVO.getAdminVO(),loginId);
			//관리자 ->일반 사용자로 변경
			if(memberVO.getAdminVO().getAcc_level().equals("-1")) {
				adminDao.modCust_adminYN(memberId, loginId);
				adminDao.removeAdmin_custAuth(memberId);
				adminDao.removeAdmin_admin(memberId);
			}
		}
		
		//업체 정보 변경
		if(newCustVO.getCompany_yn().equals("Y")) {
			v2=adminDao.modAdmin_comp(memberVO.getCompVO(),loginId);
		}
		

		
		System.out.println("v1: "+v1+" v2: "+v2+" v3:"+v3);
		return 1;
	}


	//비밀번호 BcryptEncoder
	public void passwordEncoding(CustVO custVO) {
		if(custVO.getPassword() !=null && !custVO.getPassword().equals("")) {
			System.out.println("encode하기 전 PW: "+custVO.getPassword());
			String Encoder=pwEncoder.encode(custVO.getPassword());
			custVO.setPassword(Encoder);
		}
	}


}
