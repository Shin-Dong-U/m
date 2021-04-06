package com.goott.eco3.domain;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayReadyVO {
	 //response
    private String tid, next_redirect_pc_url;
//    private String next_redirect_pc_url;
//    private String next_redirect_mobile_url;
//    private String next_redirect_pc_url;
//    private String android_app_scheme;
//    private String ios_app_schme;
    private Date created_at;
}
