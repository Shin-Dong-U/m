package com.goott.eco3.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.goott.eco3.domain.CustVO;
import com.goott.eco3.domain.MemberVO;
import com.goott.eco3.mapper.CompanyMapper;
import com.goott.eco3.mapper.CustMapper;

import lombok.Setter;

@Service
public class CustServiceImpl implements CustService{

	@Autowired
	private CustMapper custDao;
	
	@Autowired
	private CompanyMapper compDao;
	
	@Setter(onMethod_ = { @Autowired})
	private PasswordEncoder pwEncoder;
	
	@Override
	public List<Map<String, Object>> getCustList(Map<String, Object> searchInfo) {
		return custDao.getCustList(searchInfo);
	}

	@Override
	public CustVO getCustId(CustVO custVO) {
		
		return custDao.getCustId(custVO);
	}
	
	/* 로그인 */
	@Override
	public CustVO getCustLogin(CustVO custVO) {
		return custDao.getCustLogin(custVO);
	}
	
	/* 아이디 확인 */
	public String checkCustId(String memberId) {
		return custDao.checkCustId(memberId);
	}
	
	/* 비밀번호 확인 */
	@Override
	public int checkCustPassword(CustVO custVO) {
		String db_password = custDao.checkCustPassword(custVO.getMemberId());
		//System.out.println("password 입력값: "+custVO.getPassword());
		//System.out.println("password DB 값: "+db_password);
		boolean value = pwEncoder.matches(custVO.getPassword(), db_password);
		System.out.println("value 값: "+value);
		return pwEncoder.matches(custVO.getPassword(), db_password)
				? 1 
				: 0;
	}

	/* 특정 회원 정보 가져오기 */
	@Override
	public MemberVO getCust(MemberVO memberVO) {
		//MemberVO memberVO = new MemberVO();
		//memberVO.setCustVO(custDao.getCust(memberId));
		memberVO.setCustVO(custDao.getCust(memberVO.getCustVO().getMemberId()));
		if(memberVO.getCustVO().getAdmin_yn().equals("Y")) {
			memberVO.setAdminVO(custDao.getAdmin(memberVO.getCustVO().getMemberId()));
		}
		if(memberVO.getCustVO().getCompany_yn().equals("Y")) {
			memberVO.setCompVO(compDao.getCompany(memberVO.getCustVO().getMemberId()));
		}
		return memberVO;
	}
	
	/* 회원가입 */
	@Override
	public int joinCust(MemberVO memberVO) {
		passwordEncoding(memberVO.getCustVO());
		int ecoCust = custDao.joinCust(memberVO.getCustVO());
		int ecoCustAuth = custDao.joinCustAuth(memberVO.getCustVO().getMemberId());
		
		if(memberVO.getCustVO().getCompany_yn().equals("Y")) {
			System.out.println("custId: "+memberVO.getCompVO().getCust_id());
			memberVO.getCompVO().setCust_id(memberVO.getCustVO().getMemberId());
			//int ecoCompany = compDao.joinCompany(memberVO.getCompVO());
			if(compDao.joinCompany(memberVO.getCompVO())!=1) {return 0;}
			//admin 관리자에서 실행
			//int ecoCompanyAuth = compDao.joinCompanyAuth(memberVO.getCompVO().getCust_id());
		}
		return ecoCust == 1 &ecoCustAuth ==1 ? 1 : 0;
	}
	
	/* 회원 수정 */
	@Override
	public int modifyCust(CustVO custVO) {
		passwordEncoding(custVO);	
		return custDao.modifyCust(custVO);
	}

	/* 회원 탈퇴 */
	@Override
	public int deleteCust(String memberId) {
		int v1 = custDao.deleteCust(memberId);
		int v2 = custDao.deleteCustAuth(memberId);
		return (v1==1 && v2==1) ? 1 :0;
	}

	public void passwordEncoding(CustVO custVO) {
		if(custVO.getPassword() !=null && !custVO.getPassword().equals("")) {
			System.out.println("hh"+custVO.getPassword());
			String Encoder=pwEncoder.encode(custVO.getPassword());
			custVO.setPassword(Encoder);
		}
		//custVO.setPassword(passwordEncoder.encode(custVO.getPassword()));
	}


}
