package com.goott.eco3.domain;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class GoodsVO {
	private int goods_seq;
	private long comp_seq;
	private String goods_name;
	private long price;
	private int qty;
	private String material;
	private int category;
	private int eco_score;
	private Timestamp regdate;
	private String reguser;
	private String edituser;
	private Timestamp editdate;
	private String danger_yn;
	private String sale_yn;
	private String req_option;
	private String goods_detail;
	
	private GoodsThumbNailVO goodsThumbNailVO;
	private GoodsReqOption goodsReqOption;
	private GoodsCommentVO goodsCommentVO;
	private GoodsDetailImgVO goodsDetailImgVO;
	
	//썸네일이미지
	@Data
	public static class GoodsThumbNailVO{
		private int goods_seq;
		private int goods_thumb_nail_seq;
		private String img_url;
		private String main_yn;
		private Timestamp regdate;
		private String reguser;
		private Timestamp editdate;
		private String edituser;
	}
	
	//필수옵션
	@Data
	public static class GoodsReqOption{
		private int goods_seq;
		private int goods_req_option_seq;
		private int price;
		private Timestamp regdate;
		private String reguser;
		private Timestamp editdate;
		private String edituser;
	}
	
	//댓글
	@Data
	public static class GoodsCommentVO{
		private int goods_seq;
		private String cust_id;
		private String star;
		private Timestamp regdate;
		private int goods_comment_seq;
		private String memo;
		private String goods_comment_img_url;
	}
	
	//상세 이미지 
	@Data
	public static class GoodsDetailImgVO{
		private int goods_seq;
		private int img_order;
		private String img_url;
		private Timestamp regdate;
		private String reguser;
		private Timestamp editdate;
		private String edituser;
		private String goods_detail_img_key;
		
		//goods_seq + 현재시간(밀리세컨)을 리턴.
		public void makeKey(int goods_seq) {
			this.goods_seq = goods_seq;
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSSS");
			long time = System.currentTimeMillis();
			this.goods_detail_img_key = goods_seq + sdf.format(time);
		}
	}
	
	//상세페이지의 이미지 경로를 list로 반환
	public List<String> getImgSrcList(String goods_detail){
		List<String> list = new ArrayList<>();
		String tmpStr = goods_detail; 
		
		StringBuilder sb = new StringBuilder();
		
		while(true) {
			int tmpStartIdx = tmpStr.indexOf("<img src=\"") + 10;
			int tmpEndIdx = tmpStr.indexOf("\"", tmpStartIdx);
			
			if(tmpStartIdx < 10 || tmpEndIdx < 0) { break; }

			String tmpSrc = tmpStr.substring(tmpStartIdx, tmpEndIdx);
			
			list.add(tmpSrc);
			
			tmpStr = tmpStr.substring(tmpEndIdx);
			
		}
		
		return list;
	}
	
	//이동할 폴더 명 생성
	// '/upload/temp/파일명' -> '/upload/상품번호폴더/파일명
	public String makeNewFilePath(String orgFilePath, int goods_seq) {
		//예외처리. local이 아닌 경로의 이미지는 변경 X 
		if(isWebSrc(orgFilePath)) {
			return orgFilePath;
		}
		
		int targetStartIdx = orgFilePath.indexOf("temp");
		int targetEndIdx = orgFilePath.indexOf("temp") + 4;
		String newFilePath = "";
		
		String tmpFront = orgFilePath.substring(0, targetStartIdx);
		String tmpBack = orgFilePath.substring(targetEndIdx);
		
		newFilePath = tmpFront + goods_seq + tmpBack;
		
		return newFilePath;
	}
	
	// 상대경로가 들어오면 절대경로로 변환 file의 rute 경로는 c:/upload 
	// ex) /upload/temp/test_img.jpg -> c:\\upload\\temp\\test_img.jpg 
	public String convertRealFilePath(String relativePath) throws IOException {
		return new File("/upload/temp/test_img.jpg").getCanonicalPath();
	}
	
	
	
	//기존 경로 - > 새로운 경로로 img src 변경
	public void changeImgSrc(String goods_detail, List<String> orgSrcList, List<String> newSrcList) {
		StringBuilder sb = new StringBuilder();
		String tmpStr = goods_detail;
		
		for(int i = 0; i < orgSrcList.size(); i++) {
			String tsrc = orgSrcList.get(i);
			int tsIdx = tmpStr.indexOf(tsrc);
			int teIdx = tsIdx + tsrc.length();
			
			
			sb.append(tmpStr.substring(0, tsIdx));
			sb.append(newSrcList.get(i));
			
			tmpStr = tmpStr.substring(teIdx);
					
		}
		sb.append(tmpStr);
		
		this.goods_detail = sb.toString();
	}
	
	//http:// or https:// 경로인지 판별 
	public boolean isWebSrc(String imgSrc) {
		return (imgSrc.contains("http://") || imgSrc.contains("https://"));
	}
	
}