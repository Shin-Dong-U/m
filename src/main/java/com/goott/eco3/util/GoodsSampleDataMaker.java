package com.goott.eco3.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import com.goott.eco3.domain.GoodsVO;


/*
	쿠팡 사이트 전용 1회용 샘플데이터 생성 클래스입니다.
	
    현재 DB에 insert는 막혀있으며 main 메소드를 일반 메서드로 바꾼 후 service에서 호출 필요.
    (뒷단 작업이 작성 할 당시와 많이 바뀌어서 정상 작동 안할지도 몰라요. 테스트 안해 봄)  
    
    메인 함수 단독 실행 - 디버깅으로 구동원리는 파악 가능합니다.
	
	프로세스 
	1. LIST URL 획득 (쿠팡에서 '친환경' 검색 시 나오는 품목)
	
	2. LIST 목록에서 상품 키값만 획득 하여 LIST 담기
	
	3. 1개 품목에 대한 데이터 수집 프로세스
		- 상품 키를 통하여 상세 페이지 접근.
		- 상품 상세 정보 HTML 문구 획득
		- 테이블에 데이터 INSERT
		- 썸네일 이미지 주소 획득 -> 이미지 DOWNLOAD -> GOODS_DETAIL_THUMB_IMG 테이블 데이터 INSERT (이때 GOODS_SEQ는 위에 상품 값으로 설정)
 */
public class GoodsSampleDataMaker {
	
	private ChromeDriver driver;//크롬 브라우져 제어를 위한 드라이버
	
	private final String CHAR_SET = "UTF-8";
	
	//listUrl ~ currPage 까지의 String을 합치면 리스트페이지 호출 url 완성
	private String listUrl = "https://www.coupang.com/np/search?q=";
	private String searchStr;
	private String pageQuery = "&listSize=100&page=";
	private int currPage = 1;
	private int lastPage = 10; //손이 많이가서 하드코딩 했어요  
	
	//상품 상세정보 URL 리스트 
	private ArrayList<String> detailUrlList = new ArrayList<>();
	
	private String detailUrl = "https://www.coupang.com/vp/products/";
	
	//html정보가 담긴 Document 객체 (Jsoup)
	private Document doc;
	
	public GoodsSampleDataMaker() throws UnsupportedEncodingException{
		this.searchStr = URLEncoder.encode("친환경", CHAR_SET);
		init();
	}
	
	public GoodsSampleDataMaker(String searchStr) throws UnsupportedEncodingException{
		this.searchStr =  URLEncoder.encode(searchStr, CHAR_SET);
		init();
	}
	
	public void init() {
		// 크롬 드라이버 파일 경로 변수 
		Path path = Paths.get(System.getProperty("user.dir"), "src/main/resources/chromedriver/chromedriver.exe");  
		
		// WebDriver 설정
		System.setProperty("webdriver.chrome.driver", path.toString());
		
		// 크롬 옵션 설정 (생략 가능) 
		ChromeOptions options = new ChromeOptions();
		options.addArguments("--start-maximized"); //전체 화면 실행
		options.addArguments("--disable-popup-blocking");//팝업 무시
		options.addArguments("--disable-default-apps");// 기본앱 사용안함
		
		//WebDriver 객체 생성 (웹브라우져가 열림)
		this.driver = new ChromeDriver( options );
	}
	
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	
	
	public static void main(String[] args) throws IOException {
		GoodsSampleDataMaker maker = new GoodsSampleDataMaker();

		for(int i = 1; i <= maker.lastPage; i++) {
			maker.currPage = i; 
			maker.getProductIdList();//i 페이지내의 모든 상품 pk값이 list에 순서대로 담긴다
		}
		
		//각각의 상품 페이지에 접근해가며 정보 수집 및 데이터 insert
		for(int i = 0; i < maker.detailUrlList.size(); i++) {
			String tmpUrl = maker.getProductDetailUrl( maker.detailUrlList.get(i) );//상세페이지 url 획득
			GoodsVO vo = maker.getProductInfo(tmpUrl);//데이터 크롤링

//			데이터 확인
//			System.out.print(vo.getGoods_name() + " / ");
//			System.out.print(vo.getPrice() + " / ");
//			System.out.print(vo.getGoodsThumbNailVO().getImg_url().substring(0,10) + " / ");
//			System.out.println(vo.getGoods_detail().substring(0, 10));
//			상세정보 insert 
//			goodsDao.insertThumbnail(vo);
//			vo.getGoodsThumbNailVO.getGoods_seq(vo.getGoods_seq());
//			goodsDao.insertGoodsThumbNail(vo.getGoodsThumbNailVO());
		}
		
		maker.driver.quit();//브라우져 종료
	}
	
	//조회 된 상품 pk 값을 list에 담는다. 
	public void getProductIdList() throws IOException{
		//리스트 페이지 접근
		this.doc = Jsoup.connect(this.listUrl + this.searchStr + this.pageQuery + this.currPage).get();
		
		//상품 pk값들이 담긴 dom객체에 접근
		String productsStr = doc.getElementById("productList").attr("data-products");
		
		//String -> 배열로 파싱
		productsStr = productsStr.substring(productsStr.indexOf(":[") + 2, productsStr.length() -3).replaceAll(" ", "");
		String[] products = productsStr.split(","); 
		
		//리스트에 add
		for(String s : products) { this.detailUrlList.add(s); }
	}
	
	//상품 상세 페이지 url 리턴
	public String getProductDetailUrl(String productId) {
		String url = this.detailUrl + productId;
		return url;
	}
	
	/*
	 * 상품정보 획득
	 * 1. 셀레니움 api를 통하여 페이지에서 상품 상세정보 버튼을 클릭 
	 * 2. 변경된 html을 jsoup 객체로 전달
	 * 3. jsoup으로 각 요소에 접근 필요한 데이터 추출 
	 */
	public GoodsVO getProductInfo(String url) throws IOException {
		//url에 접근
		driver.get(url);
		
		//javascript 실행. (쿠팡의 제품상세 버튼을 클릭시킨다.)
		driver.executeScript("document.getElementsByName('detail')[0].click();");
		
		//상세 정보 로딩 시간동안 대기
		try { Thread.sleep(1500); } catch (InterruptedException e) {}
		
		//페이지의 html을 스트링으로 받아온다.
		String html = driver.getPageSource();
		
// 		this.doc = Jsoup.connect(url).get();
		//html을 Document 객체로 파싱
		this.doc = Jsoup.parse(html);
		
		//상품명 획득
		String goodsName = doc.select(".prod-buy-header__title").text();
		
		//가격 획득 및 int type 형변환
		String tmpPrice = doc.select(".total-price > strong").text();
		int price = convertPriceStrToInt(tmpPrice);
		
		//썸네일 획득 
		String imgUrl = doc.select("#repImageContainer > .prod-image__detail").attr("src");
		
		//상세정보 획득 
		String detail = doc.getElementById("productDetail").toString().replaceAll("'","''");
		
		GoodsVO goodsVO = new GoodsVO();
		goodsVO.setGoodsThumbNailVO(new GoodsVO.GoodsThumbNailVO());
		goodsVO.setGoods_name(goodsName);
		goodsVO.setPrice(price);
		goodsVO.setComp_seq(1);
		goodsVO.setCategory(1);
		goodsVO.setReq_option("N");
		goodsVO.setReguser("SYSTEM");
		goodsVO.setGoods_detail(detail);
		
		goodsVO.getGoodsThumbNailVO().setImg_url(imgUrl);
		goodsVO.getGoodsThumbNailVO().setMain_yn("Y");
		goodsVO.getGoodsThumbNailVO().setReguser("SYSTEM");
		
		return goodsVO;
	}
	
	//가격 문자열 파싱 ex)(String)"13,500원" -> (int)13500  
	public int convertPriceStrToInt(String price) {
		StringBuilder sb = new StringBuilder();
		
		char[] priceChars = price.toCharArray();
		for(char c : priceChars) {
			if(c >= 48 && c <= 57) { sb.append(c); }
		}
		
		String tmpPrice = sb.toString();
		if(tmpPrice.length() == 0) { 
			tmpPrice = "0"; 
		}else if(tmpPrice.length() > 1 && tmpPrice.charAt(0) == '0') {
			tmpPrice = "0";
		}else if(tmpPrice.length() > 9) {
			tmpPrice = "0";
		}
		
		return Integer.parseInt(tmpPrice); 
	}
}
