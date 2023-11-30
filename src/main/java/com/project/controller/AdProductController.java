package com.project.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.Criteria;
import com.project.domain.ProductVO;
import com.project.dto.PageDTO;
import com.project.service.AdProductService;
import com.project.util.FileUtils;
import com.project.service.AdCategoryService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/admin/product/*")
@Controller
@RequiredArgsConstructor
public class AdProductController {
	
	private final AdProductService adProductService;
	private final AdCategoryService adCategoryService;
	
	@Resource(name="uploadPath") // servlet-context.xml 의 bean 이름 참조를 해야 한다.
	private String uploadPath;
	
	@GetMapping("/pro_regist")
	public void pro_regist() {
		
	}
	
	@PostMapping("/pro_regist")
	public String pro_regist(ProductVO vo, MultipartFile uploadFile, RedirectAttributes rttr) {
		
		log.info("상품정보" + vo);
		
		// 1) 파일 업로드 작업
		String dateFolder = FileUtils.getDateFolder();
		
		String savedFileName = FileUtils.uploadFile(uploadPath, dateFolder, uploadFile);
		
		vo.setPro_img(savedFileName); // 이미지명
		vo.setPro_up_folder(dateFolder); // 폴더명
		
		// 2) 상품정보 저장
		adProductService.pro_regist(vo);
		
		return "redirect:/admin/product/pro_list";
	}
	
	@GetMapping("/pro_list")
	public void pro_list(Criteria cri, Model model) {
		// 페이징과 정보가 화면상에 뿌려지기 때문에
		
		cri.setAmount(2);
		
		log.info("페이징 정보" + cri);
		
		// 리스트 정보를 담은 객체를 생성하여 모델 속성으로 추가
		List<ProductVO> pro_list = adProductService.pro_list(cri);
		
		// 날짜폴더의 역슬래시를 슬래시로 바꾸는 작업
		// 브라우저에서 역슬래시로 되어있는 정보가 스프링으로 전달되면 과정에서 에러발생
		pro_list.forEach(vo -> {
			vo.setPro_up_folder(vo.getPro_up_folder().replace("\\", "/"));
		});
		
		model.addAttribute("pro_list", pro_list);
		
		// 페이징 정보를 담은 객체를 생성하여 모델 속성으로 추가
		int totalCount = adProductService.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
	}
	
	// 상품리스트 이미지 작업
	@ResponseBody // ajax로 요청을 받는다. <img src="매핑주소"> 형태로 받겠다
	@GetMapping("/imageDisplay") // "/admin/product/imageDisplay?dateFolderName=값1&fileName=값2"
	public ResponseEntity<byte[]> imageDisplay(String dateFolderName, String fileName) throws Exception {
		
		return FileUtils.getFile(uploadPath + dateFolderName, fileName);
	}
}
