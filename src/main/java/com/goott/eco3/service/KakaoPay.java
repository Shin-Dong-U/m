package com.goott.eco3.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.goott.eco3.domain.KakaoPayReadyVO;

import lombok.extern.java.Log;

@Service
@Log
public class KakaoPay {
	 private static final String HOST = "https://kapi.kakao.com";
	    
	    private KakaoPayReadyVO kakaoPayReadyVO;
	    
	    public String kakaoPayReady() {
	    	log.info("kakaoPayReady 시작!!");
	        RestTemplate restTemplate = new RestTemplate();
	 
	        // 서버로 요청할 Header
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Authorization", "KakaoAK " + "0e4b8e3e8cdfbfad34b070a14b2f72b3");
	        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
	        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
	        log.info("kakaoPayReady 헤더 끝!");
	        
	        // 서버로 요청할 Body
	        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	        params.add("cid", "TC0ONETIME"); //가맹점코드 (실제 운영시 카카오제휴 필요 현재는 테스트용 입력)
	        params.add("partner_order_id", "1001");//가맹점 주문번호
	        params.add("partner_user_id", "gorany");//가맹점 회원 id
	        params.add("item_name", "S9"); //상품명
	        params.add("quantity", "1"); //상품수량
	        params.add("total_amount", "2100");  //상품총액
	        params.add("tax_free_amount", "100"); //상품 비과세 금액
	        params.add("approval_url", "https://developers.kakao.com/success"); //결제성공시 redirect url
	        params.add("cancel_url", "https://developers.kakao.com/fail"); //결제 취소시
	        params.add("fail_url", "https://developers.kakao.com/cancel"); //결제 실패시
	        log.info("kakaoPayReady 바디 끝!");
	        
	        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
	        log.info("kakaoPayReady 헤더 try!");
	        try {
	            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
	            log.info("kakaoPayReady 헤더 try 안!");
	            log.info("" + kakaoPayReadyVO);
	            
	            return kakaoPayReadyVO.getNext_redirect_pc_url();
	 
	        } catch (RestClientException e) {
	        	log.info("RestClientException !");
	            e.printStackTrace();
	        } catch (URISyntaxException e) {
	        	log.info("URISyntaxException !");
	            
	            e.printStackTrace();
	        }
	        
	        return "/pay";
	        
	    }
}
