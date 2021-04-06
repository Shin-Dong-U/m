package com.goott.eco3.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.goott.eco3.common.Constants;
import com.goott.eco3.common.Criteria;
import com.goott.eco3.common.PageDTO;
import com.goott.eco3.domain.CompanyVO;
import com.goott.eco3.domain.GoodsCommentVO;
import com.goott.eco3.domain.GoodsVO;
import com.goott.eco3.domain.GoodsVO.GoodsDetailImgVO;
import com.goott.eco3.mapper.CompanyMapper;
import com.goott.eco3.mapper.GoodsMapper;

import lombok.extern.slf4j.Slf4j;

@Transactional
@Service
@Slf4j
public class GoodsServiceimpl implements GoodsService{

	@Autowired private GoodsMapper goodsDao; 
	@Autowired private CompanyMapper compDao;
	
	@Override
	public Map<String, Object> goodsList(Criteria cri) {
		Map<String, Object> resMap = new HashMap<>();
		
		int cnt = goodsDao.totalCountGoodsList(cri);
		
		PageDTO page = new PageDTO(cri, cnt);

		List<Map<String, Object>> goodsList = goodsDao.goodsList(cri);
		
		resMap.put("goodsList", goodsList);
		resMap.put("page", page);
		
		return resMap;
	}
	
	@Override
	public Map<String, Object> goodsDetail(int goodsSeq){
		Map<String, Object> goods = new HashMap<String, Object>();
		goods.put("goodsDetail", goodsDao.goodsDetail(goodsSeq));
		goods.put("thumbList", goodsDao.goodsDetailThumbImg(goodsSeq));
		goods.put("imgList", goodsDao.goodsDetailImg(goodsSeq));
		goods.put("optionList", goodsDao.goodsReqOption(goodsSeq));
		return goods;
	}
	
	@Override
	public Map<String, Object> goodsComment(int goodsSeq, int pageNum){
		final int DEFAULT_COMMENT_PAGE_AMOUNT = 5;
		int total = goodsDao.totalCountGoodsComment(goodsSeq);
		PageDTO page = new PageDTO(new Criteria(pageNum, DEFAULT_COMMENT_PAGE_AMOUNT), total);
		
		List<Map<String, Object>> commentList = goodsDao.goodsComment(goodsSeq, page.getCri().getStart());
		
		Map<String, Object> comment = new HashMap<String, Object>();
		comment.put("commentList", commentList);
		comment.put("page", page);
		
		return comment;
	}

	/**
	 * 상품등록 
	 * 1. 기본 정보로 상품을 등록. goodsSeq 획득
	 * 2. 상품 상세정보 img src 추출.
	 * 3. 이미지 파일 이동 tmp -> 상품번호 폴더 
	 * 4. 상품 상세 이미지 테이블에 데이터 insert (이미지 갯수만큼) 
	 * 5. 상품 상세 정보 변경 (변경 된 src 주소 적용) 후 UPDATE
	 * 
	 * Todo. 
	 * 코드 정리 ( 메서드 분리 등 ) 
	 * 
	 */
	@Override
	public int insertGoods(GoodsVO vo) {
		//등록 관련코드 차후 별도의 클래스에서 따로 관리. 
		final int FAIL_CODE = -1;
		String memberId = vo.getReguser();
		CompanyVO comp = compDao.getCompany(memberId);
		vo.setComp_seq(comp.getComp_seq());
		
		goodsDao.insertGoods(vo);//1. proc 호출하여 상품 등록.
		
		if(vo.getGoods_seq() != 0) {//goods_seq가 있으면 상품이 정상 등록 됨.
			List<String> orgSrcList = vo.getImgSrcList(vo.getGoods_detail());//2. 이미지 src list 획득
			List<String> newSrcList = new ArrayList<String>(orgSrcList.size());//5번 프로세스에서 사용.변경 된 경로. 
			
			for(int i = 0; i < orgSrcList.size(); i++) {
				String orgSrc = orgSrcList.get(i);
				String newSrc = vo.makeNewFilePath(orgSrc, vo.getGoods_seq());//3-1. 이동할 파일경로 지정
				newSrcList.add(newSrc);
				
				if(vo.isWebSrc(orgSrc)) { continue; }//웹 경로의 이미지는 아래의 로직 생략.
				
				//3-2. 파일 이동
				try {
					File orgFile = new File(orgSrc);
					File newFile = new File(newSrc);
					FileUtils.moveFile(orgFile, newFile);
				} catch (IOException e) {
					log.error(e.getMessage());
					newSrcList.remove(i);
					newSrcList.add("");//파일 이동에 실패 하였다면 src값을 "" 으로 변경.
				}
				
				//4. 상품 상세 이미지 테이블에 데이터 insert. (메서드 분리 필요) 
				//파라미터 셋팅.
				GoodsDetailImgVO imgvo = new GoodsDetailImgVO();
				imgvo.setGoods_seq(vo.getGoods_seq());
				imgvo.setImg_order(i + 1);
				imgvo.setImg_url(newSrc);
				imgvo.setReguser(vo.getReguser());
				vo.setGoodsDetailImgVO(imgvo);
				
				goodsDao.insertGoodsDetailImg(vo.getGoodsDetailImgVO());
			}
			//5. 상품 상세 정보 변경 후 업데이트
			vo.changeImgSrc(vo.getGoods_detail(), orgSrcList, newSrcList);//상세정보 변경
			goodsDao.updateGoodsOnlyGoodsDetailColumn(vo);
			
		}else { return FAIL_CODE; }
		
		return vo.getGoods_seq();
	}

	@Override
	public int updateReview(GoodsVO.GoodsCommentVO commentVO) {
		return goodsDao.updateReview(commentVO);
	}
	
	@Override
	public int deleteReview(GoodsVO.GoodsCommentVO commentVO) {
		return goodsDao.deleteReview(commentVO);
	}

	@Override
	public int insertReview(GoodsVO.GoodsCommentVO commentVO) {
		return goodsDao.insertReview(commentVO);
	}

	@Override
	public List<Map<String, Object>> insertThumbnail(MultipartFile[] files, GoodsVO.GoodsThumbNailVO thumbVO) {
		String defaultFolder = Constants.UPLOAD_URL;
//		String uploadFolder = defaultFolder + "\\" + thumbVO.getGoods_seq();
//		String defaultFolder = "/var/webapps/upload/img";
		String uploadFolder = defaultFolder + File.separator + thumbVO.getGoods_seq();
		
		for(int i = 0; i < files.length; i++) { 
			MultipartFile multipartFile = files[i];
			
			String uploadFileName = multipartFile.getOriginalFilename();
			String uuid = UUID.randomUUID().toString();
			
//			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1 );
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf(File.separator) + 1 );
			uploadFileName = "thumb_" + uuid + "_" + uploadFileName;
			
			File saveFile = new File(uploadFolder, uploadFileName);
			
			try {
				File folder = new File(uploadFolder);
				
				if(!folder.exists()) { folder.mkdir(); }
				
				multipartFile.transferTo(saveFile);
				
				thumbVO.setImg_url(saveFile.getPath().substring(2).replaceAll("\\\\", "/"));// c:\\upload\\img\\ -> /upload/img/ 형식으로 변경
//				String imgUrl = saveFile.getPath();
//				thumbVO.setImg_url(imgUrl.substring( imgUrl.indexOf("/upload/img") ));// 리눅스 환경 
				
				if(i == 0) {thumbVO.setMain_yn("Y"); }
				
				goodsDao.insertGoodsThumbNail(thumbVO);
			} catch (IllegalStateException | IOException e) {
				log.error(e.getMessage());
			}
		}
		List<Map<String, Object>> thumbList = goodsDao.goodsDetailThumbImg(thumbVO.getGoods_seq());
		
		return thumbList;
	}

	//트랜잭션 정상 작동 확인 용
	public void testTransaction() {
		Map<String, Object> param = new HashMap<>();
		param.put("no", 777);
		param.put("val", "kkkk");
		goodsDao.test(param);
		goodsDao.test(param);
	}

}
