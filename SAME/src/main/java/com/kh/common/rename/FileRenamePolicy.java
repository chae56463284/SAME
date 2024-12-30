package com.kh.common.rename;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FileRenamePolicy implements com.oreilly.servlet.multipart.FileRenamePolicy{
	
	@Override
	public File rename(File originFile) {
		//파이명 수정 메서드
		
		//원본 파일명 
		String originName = originFile.getName();
		
		//수정된 파일명 : 파일업로드시간 + 5자리 랜덤값 을 합쳐서 파일명 추가
		//확장자 : 원본파일 확장자 그대로 사용
		//aaa.jpg ===> 2024121212415912345.jpg
		
		// 1. 파일 업로드 시간
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss")
										.format(new Date());
		
		// 2. 5자리 랜덤값 
		int random = (int) (Math.random()*90000 +10000);
		
		// 3. 확장자 
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime+random+ext;
		
		// 원본파일 파일명의 수정된 파일명으로 변견식켜 객체 반환
		return new File(originFile.getParent(), changeName);
	}


}
