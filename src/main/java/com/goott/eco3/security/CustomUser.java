package com.goott.eco3.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.goott.eco3.domain.CustVO;

import lombok.Getter;

@Getter
public class CustomUser extends User{

	private static final long serialVersionUID=1L;
	private CustVO custVO;

	//생성자 ※username과 password 는 기본값으로사용한다.
	public CustomUser(String username, String password, 
			Collection<? extends GrantedAuthority> authorities) {
			
			super(username, password, authorities);
	}
	
	//새로운 custVO를 생성
	public CustomUser(CustVO custVO) {
		super(custVO.getMemberId(), 
			  custVO.getPassword(), 
			  custVO.getAuthList()
					.stream()
					.map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
					.collect(Collectors.toList())
		);
		this.custVO = custVO;
	}
	
	

	
	
}
