package com.goott.eco3.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.goott.eco3.domain.CustVO;
import com.goott.eco3.mapper.CustMapper;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService{

	@Setter(onMethod_ = {@Autowired})
	private CustMapper custMapper;
	
	@Override
	public UserDetails loadUserByUsername(String memberId) 
		throws UsernameNotFoundException {
		
		log.warn("Load User By UserName :"+ memberId);
		
		//userName means userid
		CustVO custVO = custMapper.getCustAuth(memberId);
		
		log.warn("MemberMapper쿼리 사용: "+custVO);
		 
		return custVO == null ? null : new CustomUser(custVO);
	}
	

}
