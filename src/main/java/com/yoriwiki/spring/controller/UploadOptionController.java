package com.yoriwiki.spring.controller;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yoriwiki.spring.domain.UploadOptionVO;
import com.yoriwiki.spring.service.UploadOptionService;

@Controller
@RequestMapping("/uploadFile/*")
public class UploadOptionController {

	@Autowired
	private UploadOptionService uploadOptionService;

	@GetMapping("")
	public String showUploadOptions(Model model) {
		UploadOptionVO uploadOption = uploadOptionService.getUploadOption("picture"); // 1번 upload_option 레코드 조회
		UploadOptionVO uploadOption1 = uploadOptionService.getUploadOption("video");
		model.addAttribute("pictureOption", uploadOption);
		model.addAttribute("videoOption", uploadOption1);

		return "UploadOption";
	}

	@PostMapping("uploadoptions")
	public String updateUploadOptions(@RequestParam("id") String id,

			@RequestParam("max_size") int maxSize,

			@RequestParam("allowed_extensions") String allowedExtensions,

			@RequestParam("max_upload_count") int maxUploadCount) {
		System.out.println("============11============");

		UploadOptionVO uploadOption = uploadOptionService.getUploadOption(id); // 1번
		// upload_option 레코드 조회
		uploadOption.setId(id);
		uploadOption.setMaxSize(maxSize);
		uploadOption.setAllowedExtensions(allowedExtensions);
		uploadOption.setMaxUploadCount(maxUploadCount);
		System.out.println("============22============");
		uploadOptionService.updateUploadOption(uploadOption); // 1번 upload_option 레코드 업데이트

		return "redirect:/uploadFile/uploadoptions";
	}

	@PostMapping("uploadoptions2")
	public String updateUploadOptions1(

			@RequestParam("id") String id1,

			@RequestParam("max_size") int maxSize1,

			@RequestParam("allowed_extensions") String allowedExtensions1,

			@RequestParam("max_upload_count") int maxUploadCount1) {

		UploadOptionVO uploadOption1 = uploadOptionService.getUploadOption(id1); //
		// 2번 upload_option 레코드 조회
		uploadOption1.setId(id1);
		uploadOption1.setMaxSize(maxSize1);
		uploadOption1.setAllowedExtensions(allowedExtensions1);
		uploadOption1.setMaxUploadCount(maxUploadCount1);
		System.out.println("============22============");
		uploadOptionService.updateUploadOption1(uploadOption1); // 1번 upload_option
		// 레코드 업데이트

		return "redirect:/uploadFile/uploadoptions";
	}

	@GetMapping("uploadfile")
	public String uploadfile(Model model) {

		return "FileUpload";
	}

	@PostMapping("uploadfile")
	public String handleFileUpload(@RequestParam("file") MultipartFile file, @RequestParam("id") String id,
			RedirectAttributes redirectAttributes) {
		// 파일 업로드 처리 전 파일 업로드 옵션 정보를 조회
		try {
			UploadOptionVO uploadOption = uploadOptionService.getUploadOption(id);
			long maxFileSize = uploadOption.getMaxSize();
			String[] allowedExtensions = uploadOption.getAllowedExtensions().split(","); // 파일 업로드 처리 코드 작성 try {
			System.out.println(file.getSize());
			if (file.getSize() > maxFileSize) {
				redirectAttributes.addFlashAttribute("message", "파일 크기가 초과되었습니다.");
				return "redirect:/uploadFile/uploadfile";
			}
			String originalFileName = file.getOriginalFilename();
			String fileExtension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
			if (!Arrays.asList(allowedExtensions).contains(fileExtension.toLowerCase())) {
				redirectAttributes.addFlashAttribute("message", "허용되지 않은 파일 확장자입니다.");
				return "redirect:/upload/uploadfile";
			} // 파일 저장 등의 로직 수행 // ...
			redirectAttributes.addFlashAttribute("message", "파일 업로드가 완료되었습니다.");
			return "redirect:/uploadFile/uploadfile";
		} catch (MaxUploadSizeExceededException e) {
			redirectAttributes.addFlashAttribute("message", "파일 크기가 초과되었습니다.");
			return "redirect:/uploadFile/uploadfile";
		}
	}
}
