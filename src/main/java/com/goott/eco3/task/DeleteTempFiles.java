package com.goott.eco3.task;


import java.io.File;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class DeleteTempFiles {
	
//	private String directoryPath = "/var/webapp/upload/img/temp";
	private String directoryPath = "c:\\upload\\img\\temp";
	private File folder = new File(directoryPath);
	
	@Scheduled(cron = "0 00 05 * * *", zone = "Asia/Seoul")//매일 5시 temp 폴더 정리 (초 분 시 일 월 요일)
	public void start() {
		log.warn("Temp File Delete Scheduler -----------------------");
		deleteTempFiles(this.folder);
		log.warn("----------------------------------------");
	}
	
	public void deleteTempFiles(File f) {
		if(f == null) { f = this.folder; }
		File[] files = f.listFiles();
		
		for(File file : files) {
			if(file.isDirectory()) { deleteTempFiles(file); }//폴더면 재귀호출
			file.delete();
		}
	}
}
