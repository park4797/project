package com.project.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;

// file upload 관련 필요한 메소드 구성
public class FileUtils {

	// 날짜폴더 생성을 위한 날짜정보
	public static String getDateFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 패턴 변경
		Date date = new Date(); // date 객체 생성
		
		String str = sdf.format(date); // date 객체에 패턴 적용
		
		// File.separator : 각 운영체제별로 경로 구분자 반환
		return str.replace("-", File.separator);
	}
	
	// MultipartFile 큰 파일을 쪼개서 업로드 할 수 있게 해준다.
	public static String uploadFile(String uploadFolder, String dateFolder, MultipartFile uploadFile) {
		
		String originUploadFileName = ""; // 실제 업로드한 파일이름(파일이름 중복 방지)
		
		// 파일과 폴더관련 작업
		File file = new File(uploadFolder, dateFolder); // ex) C:/dev/devTools/upload, 2023/11/02
		
		if(file.exists() == false) {
			file.mkdir(); // 경로내 폴더가 존재하지 않으면 생성
		}
		
		// 실제업로드한 파일이름을 클라이언트에 전송할 파일 이름으로 변수선언
		String clientFileName = uploadFile.getOriginalFilename();
		
		// 파일명 중복방지를 위해 고유한 문자열 생성
		UUID uuid = UUID.randomUUID();
		
		originUploadFileName = uuid.toString() + "_" + clientFileName;
		
		try {
			// file : "C:/dev/devTools/upload/2023/11/02" + originUploadFileName(업로드 파일명)
			File saveFile = new File(file, originUploadFileName);
			
			// 파일업로드(파일복사)
			uploadFile.transferTo(saveFile); // uploadFile을 저장
			
			// 썸네일 작업
			if(checkImageType(saveFile)) {
				// 썸네일로 사용할 s_가 붙은 새로운 객체 생성
				FileOutputStream thumbnail = new FileOutputStream(new File(file, "s_" + originUploadFileName));
				
				// 썸네일로 사용할 파일 생성
				Thumbnailator.createThumbnail(uploadFile.getInputStream(), thumbnail, 100, 100);
				
				thumbnail.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return originUploadFileName; // 상품테이블에 파일명 이름이 저장된다(pro_img)
	}
	
	// 확장자를 이용해 업로드되는 파일 중 이미지파일과 일반파일을 구분
	private static boolean checkImageType(File saveFile) {
	
		boolean isImageType = false; // 변수의 값이 true면 이미지 파일
		
		try {
			// saveFile의 MIME 타입을 얻는다.
			String contentType = Files.probeContentType(saveFile.toPath());
			
			isImageType = contentType.startsWith("image"); // 위 구문이 image로 시작한다면 true
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return isImageType;
	}
	
	/* 
	 프로젝트 외부폴더에서 관리되고 있는 상품이미지를 브라우저의 <img src="매핑주소"> 태그로부터 요청이 들어왔을때, 바이트 배열로 보내주는 작업
	<img src="test.jpg"> 는 외부폴더에서 관리되고 있기 때문에 사용하지 않는다. -> 상품 등록시 DB에 filename이 저장되기 때문에 경로에서 불러오면 되기때문
	 */
	// String uploadPath : 업로드 폴더 경로, String fileName : 날짜폴더경로를 포함한 파일명(DB)
	// ResponseEntity class : 1) header 데이터에 대한 설명 등, 2) body, 3) StatusCode 으로 구성
	public static ResponseEntity<byte[]> getFile(String uploadPath, String fileName) throws Exception {
		
		ResponseEntity<byte[]> entity = null;
		
		// 이미지 파일을 참조하는 객체 생성
		File file = new File(uploadPath, fileName);
		
		if(!file.exists()) {
			return entity; // 존재하지 않으면 null로 리턴
		}
		
		// Files.probeContentType(file.toPath()); : 위 file 객체를 통해 참조
		// 만약 파일이 jpg 파일일경우 image/jpeg로 생성된다.
		HttpHeaders headers = new HttpHeaders(); // header 정보를 얻기 위한 객체 생성
		headers.add("Content-type", Files.probeContentType(file.toPath()));// jsp의 header처럼 Content-type MIME 정보를 맞춰준다. 
		
		// FileCopyUtilsl : 스트림 복사를 위한 유틸리티 메소드
		entity = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		
		return entity;
	}
}
