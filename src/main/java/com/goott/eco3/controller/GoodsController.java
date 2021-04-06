package com.goott.eco3.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goott.eco3.common.Criteria;
import com.goott.eco3.service.CommonService;
import com.goott.eco3.service.GoodsService;

@RequestMapping("/goods")
@Controller
public class GoodsController {
	
	@Autowired private GoodsService goodsService;
	@Autowired private CommonService commonService;
	
	@GetMapping("")
	public ModelAndView goodsList(HttpServletRequest request, HttpServletResponse response, Criteria cri) {
		ModelAndView mav = new ModelAndView("/goods/goods_list");
//		mav.addAllObjects(goodsService.goodsList(cri));
		mav.addObject("cateList", commonService.categoryList());
		mav.addObject("cri", cri);
		
		return mav;
	}
	
	@GetMapping("/{goodsSeq}")
	public ModelAndView goodsDetail(HttpServletRequest request, HttpServletResponse response, @PathVariable int goodsSeq) {
		ModelAndView mav = new ModelAndView("/goods/goods_detail");
		mav.addAllObjects(goodsService.goodsDetail(goodsSeq));
		
		return mav;
	}
	
	@GetMapping("/form")
	public ModelAndView goodsInsert() {
		ModelAndView mav = new ModelAndView("company/goods_insert");
		mav.addObject("cateList", commonService.categoryList());
		return mav;
	}
	
	/*
	//안쓸듯...
	@PostMapping(value="/form/upload/images")//, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)	
	public String goodsDetailImagesUpload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
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
//			out.println("NOTALLOW_"+filename);
			System.out.println("NOTALLOW");
		} else {
			//이미지이므로 신규 파일로 디렉토리 설정 및 업로드	
			//파일 기본경로
//			String dftFilePath = request.getServletContext().getRealPath("/");
			String dftFilePath = "c:\\upload\\temp\\";
			//파일 기본경로 _ 상세경로
			String filePath = dftFilePath + "editor" + File.separator +"multiupload" + File.separator;
			File file = new File(filePath);
			
			if(!file.exists()) { file.mkdirs(); }
			
			String realFileNm = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today= formatter.format(new java.util.Date());
			realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			rlFileNm = filePath + realFileNm;
			///////////////// 서버에 파일쓰기 ///////////////// 
			InputStream is = request.getInputStream();
			OutputStream os=new FileOutputStream(rlFileNm);
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
//			sFileInfo += "&sFileURL=" + "/editor/multiupload/" + realFileNm;
			sFileInfo += "&sFileURL=" + "/upload/img/editor/multiupload/" + realFileNm;
		}
		return sFileInfo;
	}
	
	@GetMapping(value="/form/upload/images/thumb")//, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)	
	public String goodsThumbnailImagesUpload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		return "goods/thumb_upload";
	}
	*/
}