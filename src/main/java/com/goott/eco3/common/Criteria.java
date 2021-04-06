package com.goott.eco3.common;

import lombok.ToString;

@ToString
public class Criteria {
	private static final int DEFAULT_PAGE_NUM = 1;
	private static final int DEFAULT_AMOUNT = 20;
	
	private int pageNum;	//현재 페이지 번호
	private int amount;		//페이지당 출력할 레코드 수
	
	private int start;//건너뛸 행수.
	
	private String CustType;	//검색범위 (관리자:[A]-admin 일반사용자:[C]-cust 회사:[P]-company)
	private String CustSearchType;      //검색[]:CustName
	private String CustSearchKeyword;      //검색 단어
	
	private String category;//상품카테고리
	private String keyword;//검색문구
	
	public Criteria() {
		this(DEFAULT_PAGE_NUM, DEFAULT_AMOUNT);	//게시물 번호를 입력
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		init();
	}

	private void init() {
		this.start = (pageNum * amount ) - (amount);
	}
	
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		init();
	}
	
	public void setAmount(int amount) {
		this.amount = amount;
		init();
	}
	
	public void setCategory(String category) {
		this.category = category;
		validCategory();
	}
	
	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public String getCustType() {
		return CustType;
	}

	public void setCustType(String custType) {
		CustType = custType;
	}

	public String getCustSearchType() {
		return CustSearchType;
	}

	public void setCustSearchType(String custSearchType) {
		CustSearchType = custSearchType;
	}

	public String getCustSearchKeyword() {
		return CustSearchKeyword;
	}

	public void setCustSearchKeyword(String custSearchKeyword) {
		CustSearchKeyword = custSearchKeyword;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getPageNum() {
		return pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public String getCategory() {
		return category;
	}
	
	public String[] getTypeArr() {
		return CustType == null ? new String[] {} : CustType.split("");
	}
	
	//카테고리 값 체크
	public void validCategory() {
		if(this.category == null || this.category.length() == 0) {
			return;
		}else if(this.category.length() > 2) {
			this.category = "";
		}else if(!(this.category.charAt(0) >= 48 && this.category.charAt(0) <= 57)){//숫자가 아니면	
			this.category = "";
		}
	}
}


