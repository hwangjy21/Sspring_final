package com.myweb.www.handler;

import java.io.File;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.myweb.www.domain.FileVO;
import com.myweb.www.repository.FileDAO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Component
@EnableScheduling
public class FileSweeper {

	private final String BASE_PATH = "D:\\_myweb\\_java\\fileupload\\";
	
	@Inject
	private FileDAO fdao;
	@Scheduled(cron = "0 0 6 * * ?")
	public void fileSweeper() {
		
List<FileVO> dbList = fdao.selectListAllFiles();
List<String> currFiles = new ArrayList<String>();

for(FileVO fvo: dbList) {
	
	String filePath = fvo.getSaveDir()+"\\"+fvo.getUuid();
	String fileName = fvo.getFileName();
	currFiles.add(BASE_PATH+filePath+"_"+fileName);
	
	if(fvo.getFileType()>0) {
		currFiles.add(BASE_PATH+filePath+"_th_"+fileName);
		
	}
}
		LocalDate now = LocalDate.now();
		String today = now.toString();
		today = today.replace("-", File.separator);
		
		File dir = Paths.get(BASE_PATH+today).toFile();
		File[] allFileObjects = dir.listFiles();
		for(File file : allFileObjects) {
			
			String storedFileName = file.toPath().toString();
			if(!currFiles.contains(storedFileName)) {
				file.delete();
			}
		}
		
	}
	
}
