package com.goott.eco3.util;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

/*
 * api 사용법 테스트 클래스입니다
 */
public class SeleniumTest2 {
	
	public ChromeDriver driver;
	
	public static void main(String[] args) {
		//param = (package workspace경로, chromedriver.exe 파일의 경로)
		//현재 package의 workspace 경로, Windows는 [ chromedriver.exe ]
        Path path = Paths.get(System.getProperty("user.dir"), "src/main/resources/chromedriver/chromedriver.exe");  // 현재 package의
        // WebDriver 경로 설정
        System.setProperty("webdriver.chrome.driver", path.toString());
		
//		String path = "C:\\dev\\lib\\chromedriver_win32\\chromedriver.exe";
		// 위에서 설정 한 웹드라이버 경로
//		System.setProperty("webdriver.chrome.driver", path);
		
		// 크롬 옵션 설정 (생략 가능) 
		ChromeOptions options = new ChromeOptions();
		options.addArguments("--start-maximized"); //전체 화면 실행
		options.addArguments("--disable-popup-blocking");//팝업 무시
		options.addArguments("--disable-default-apps");// 기본앱 사용안함
		
		//WebDriver 객체 생성 (웹브라우져가 열림)
		ChromeDriver driver = new ChromeDriver( options );
		
		//자바 스크립트 실행. (여기서는 빈탭 추가) 
		driver.executeScript("window.open('about:blank', '_blank');");
		driver.executeScript("window.open('about:blank', '_blank');");
		
		//탭 목록 받아오기 
		List<String> tabs = new ArrayList<String>(driver.getWindowHandles());
		tabs.forEach(x -> System.out.println(x));
		
		//1번탭으로 전환
		driver.switchTo().window(tabs.get(0));
		
		driver.get("https://heodolf.tistory.com/101");
		
		// 웹페이지에서 글 제목 가져오기
		// XPath를 이용하여 Elements 탐색 : XPath는 XML을 이용한 탐색 방식인데, CSS Selector보다 더 많은 기능을 제공함.
		WebElement page1Title = driver.findElementByXPath("//*[@id='content']/div[1]/div[1]/div/h1");
		if( page1Title != null) {
			System.out.println(page1Title.getText());
		}
		
		
		//2탭 전환
		driver.switchTo().window(tabs.get(1));
		
		driver.get("https://heodolf.tistory.com/102");
		
		WebElement page2Title = driver.findElementByXPath("//*[@id=\"content\"]/div[1]/div[1]/div/h1");
        if( page2Title != null  ) {
            System.out.println( page2Title.getText() );            
        }
        
		
        //3탭 테스트
        driver.switchTo().window(tabs.get(2));
        
        driver.get("https://www.coupang.com/vp/products/4876596110?itemId=6344477945&vendorItemId=73639808549&q=%EC%B9%9C%ED%99%98%EA%B2%BD&itemsCount=36&searchId=0bcc9da576ce4a248f83b3dadb4c1e56&rank=0&isAddedCart=");
        
        try {
        	System.out.println("@@@@");
			driver.executeScript("document.getElementsByName('detail')[0].click();");
			Thread.sleep(1500);
			
			String html = driver.getPageSource();
			Document doc = Jsoup.parse(html);
			Element e = doc.getElementById("productDetail");
			e.toString().replaceAll("'", "''");
			System.out.println(e.toString());
			
		} catch (InterruptedException  e1) {
			e1.printStackTrace();
		}
        
        
        try {
        	Thread.sleep(5000);
        }catch(InterruptedException e) {
        	e.printStackTrace();
        }finally {
        	driver.quit();
        }
	}
	
}
