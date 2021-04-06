package com.goott.eco3.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.goott.eco3.common.Constants;
import com.goott.eco3.common.Criteria;
import com.goott.eco3.domain.GoodsVO;
import com.goott.eco3.domain.GoodsVO.GoodsThumbNailVO;
import com.goott.eco3.service.GoodsService;

import lombok.extern.java.Log;

@RestController
@RequestMapping("/goods/rest")
@Log
public class RestGoodsController {
	
	@Autowired private GoodsService goodsService;

	//상품리스트
	@GetMapping(value="", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)	
	public ResponseEntity<Map<String, Object>> goodsList(@ModelAttribute Criteria cri) {
		Map<String, Object> goods = goodsService.goodsList(cri);
		
		return new ResponseEntity<>(goods, HttpStatus.OK);
	}
	
	//리뷰리스트
	@GetMapping(value="/{goodsSeq}/review", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)	
	public ResponseEntity<Map<String, Object>> getReview(@PathVariable int goodsSeq, @RequestParam int pageNum) {
		Map<String, Object> comment = goodsService.goodsComment(goodsSeq, pageNum);
		return new ResponseEntity<>(comment, HttpStatus.OK);
	}
	
	//리뷰 수정
	@Secured({"ROLE_CUST","ROLE_COMPANY", "ROLE_ADMIN"})
	@PostMapping(value="/{goodsSeq}/review/{goodsCommentSeq}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)	
	public ResponseEntity<Integer> updateReview(HttpServletRequest request 
												, @PathVariable int goodsSeq
												, @RequestBody GoodsVO.GoodsCommentVO commentVO) {
		String memberId = (String)request.getSession().getAttribute("memberId");
		if(memberId == null || memberId.equals("")) { new ResponseEntity<>(HttpStatus.BAD_REQUEST); }
		commentVO.setCust_id(memberId);
		
		int record = goodsService.updateReview(commentVO);
		return record == 1 ? new ResponseEntity<>(HttpStatus.OK)
				:  new ResponseEntity<>(HttpStatus.BAD_REQUEST);//적당한 오류 코드 번호 찾아서 수정 필요.
	}
	
	//리뷰 삭제
	@Secured({"ROLE_CUST","ROLE_COMPANY", "ROLE_ADMIN"})
	@DeleteMapping(value="/{goodsSeq}/review/{goodsCommentSeq}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)	
	public ResponseEntity<Integer> deleteReview(HttpServletRequest request 
			, @PathVariable int goodsSeq
			, @RequestBody GoodsVO.GoodsCommentVO commentVO) {
		String memberId = (String)request.getSession().getAttribute("memberId");
		if(memberId == null || memberId.equals("")) { new ResponseEntity<>(HttpStatus.BAD_REQUEST); }
		commentVO.setCust_id(memberId);
		
		int record = goodsService.deleteReview(commentVO);
		return record == 1 ? new ResponseEntity<>(HttpStatus.OK)
				:  new ResponseEntity<>(HttpStatus.BAD_REQUEST);//적당한 오류 코드 번호 찾아서 수정 필요.
	}
	
	//리뷰등록
	@Secured({"ROLE_CUST","ROLE_COMPANY", "ROLE_ADMIN"})
	@PutMapping(value="/{goodsSeq}/review", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)	
	public ResponseEntity<Integer> insertReview(HttpServletRequest request, @PathVariable int goodsSeq
												, @RequestBody GoodsVO.GoodsCommentVO commentVO) {
		String memberId = (String)request.getSession().getAttribute("memberId");
		if(memberId == null || memberId.equals("")) { new ResponseEntity<>(HttpStatus.BAD_REQUEST); }
		commentVO.setCust_id(memberId);
		
		int record = goodsService.insertReview(commentVO); 
		return record == 1 ? new ResponseEntity<>(HttpStatus.OK)
				:  new ResponseEntity<>(HttpStatus.BAD_REQUEST);//적당한 오류 코드 번호 찾아서 수정 필요.
	}
	
	//Naver smart editor에서 temp 폴더로 파일 임시 저장
	@Secured({"ROLE_COMPANY", "ROLE_ADMIN"})
	@PostMapping(value="/form/upload/images", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)	
	public ResponseEntity<String> goodsDetailImagesUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile[] multifile) throws IOException {
		
		String dftFilePath = Constants.TEMP_UPLOAD_Url + File.separator;
//		String dftFilePath = "/var/webapps/upload/img/temp/";
		
		//파일정보
		String sFileInfo = "";
		//파일명을 받는다 - 일반 원본파일명
		String filename = request.getHeader("file-name");
		//파일 확장자
		String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
		//확장자를소문자로 변경
		filename_ext = filename_ext.toLowerCase();
		//최종파일경로 + 파일명
		String rlFileNm = "";
			
		//이미지 검증 배열변수
		String[] allow_file = {"jpg","png","bmp","gif"};

		//돌리면서 확장자가 이미지인지 
		int cnt = 0;
		for(int i=0; i<allow_file.length; i++) {
			if(filename_ext.equals(allow_file[i])){
				cnt++;
			}
		}

		//이미지가 아님
		if(cnt == 0) {
//			Todo. 이미지가 아니라면 return fail_status 으로 변경.
//			out.println("NOTALLOW_"+filename);
		} else {
			//이미지이므로 신규 파일로 디렉토리 설정 및 업로드	
			//파일 기본경로
//			String dftFilePath = request.getServletContext().getRealPath("/");
			
			//파일 기본경로 _ 상세경로
			String filePath = dftFilePath;
			File file = new File(filePath);
			
			if(!file.exists()) { file.mkdirs(); }
			
			String realFileNm = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today= formatter.format(new java.util.Date());
			realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			rlFileNm = filePath + realFileNm;
			
			///////////////// 서버에 파일쓰기 ///////////////// 
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(rlFileNm);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			
			while((numRead = is.read(b,0,b.length)) != -1){
				os.write(b,0,numRead);
			}
			
			if(is != null) {
				is.close();
			}
			os.flush();
			os.close();
			///////////////// 서버에 파일쓰기 /////////////////
	
			// 정보 출력
			sFileInfo += "&bNewLine=true";
			//sFileInfo += "&sFileName="+ realFileNm;;
			// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
			sFileInfo += "&sFileName="+ filename;
			sFileInfo += "&sFileURL=" + "/upload/img/temp/" + realFileNm;
		
			}
		
		return new ResponseEntity<>(sFileInfo, HttpStatus.OK);
	}
	
	//상품등록
	@Secured({"ROLE_COMPANY", "ROLE_ADMIN"})
	@PutMapping(value="/form", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Integer> insertGoods(HttpServletRequest request, @RequestBody GoodsVO goodsVO){
//		String[] option_name = request.getParameterValues("req_option_name");
//		String[] option_price = request.getParameterValues("req_price");
		
		String memberId = (String)request.getSession().getAttribute("memberId");
//		Integer compSeq = (Integer)request.getSession().getAttribute("compSeq");

//		goodsVO.setComp_seq(compSeq);
		goodsVO.setReguser(memberId);
		
		String msg = "";
		int goods_seq = goodsService.insertGoods(goodsVO);
		
		return goods_seq > 0 ? new ResponseEntity<>(goods_seq, HttpStatus.OK)
					   : new ResponseEntity<>(-1, HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//썸네일 테스트 
	@PostMapping(value="/{goodsSeq}/form/upload/images/thumb", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)	
	public ResponseEntity<List<Map<String, Object>>> goodsThumnailImagesUpload(@PathVariable int goodsSeq, @RequestBody MultipartFile[] uploadFile, HttpServletRequest request){
		GoodsThumbNailVO thumbVO = new GoodsThumbNailVO();
		String memberId = (String)request.getSession().getAttribute("memberId");
		thumbVO.setReguser(memberId);
		thumbVO.setGoods_seq(goodsSeq);

		List<Map<String, Object>> thumbList = goodsService.insertThumbnail(uploadFile, thumbVO);
		
		return new ResponseEntity<>(thumbList, HttpStatus.OK);
	}
	
	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	
}
