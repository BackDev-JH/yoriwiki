package com.yoriwiki.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yoriwiki.spring.domain.BoardVO;
import com.yoriwiki.spring.service.AdminService;
import com.yoriwiki.spring.util.Criteria;
import com.yoriwiki.spring.util.PageMaker;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService service;

//	@GetMapping("excel.do")
//	public void Excel(@ModelAttribute("searchVO") BoardVO searchVO, HttpServletRequest request,
//			HttpServletResponse response, ModelMap model) throws Exception {
//		System.out.println("================");
//		service.getReserveExcel(searchVO, request, response);
//	}
//
//	@GetMapping("list")
//	public String getList(Criteria cri, Model model) {
//		cri.setPageNum(1); // 페이지 번호를 1로 초기화 
//		List<BoardVO> list = service.getListByPaging(cri);
//		int totalCount = service.getSearchTotalCount(cri);
//		PageMaker pageMaker = new PageMaker(cri, totalCount);
//		model.addAttribute("cri", cri);
//		model.addAttribute("list", list);
//		model.addAttribute("pageMaker", pageMaker);
//		return "admin";
//	}
//
//	@GetMapping("admin")
//	public String getListByPaging(@ModelAttribute("pageNum") int pageNum, Criteria cri, Model model) {
//		cri.setPageNum(pageNum);
//		List<BoardVO> list = service.getListByPaging(cri);
//		double totalCount = service.getSearchTotalCount(cri);
//		PageMaker pageMaker = new PageMaker(cri, totalCount);
//		model.addAttribute("list", list);
//		model.addAttribute("pageMaker", pageMaker);
//		return "admin";
//	}
//
//	@GetMapping("list/search")
//	public String GetList1(Criteria cri, Model model, BoardVO dto) {
//
//		int totalCount = service.getSearchTotalCount(cri);
//		PageMaker pageMaker = new PageMaker(cri, totalCount);
//
//		log.info("pageMaker" + pageMaker);
//		log.info("totalCount" + totalCount); //
//		log.info(service.getListByPaging(cri));
//
//		model.addAttribute("cri", cri);
//		model.addAttribute("list", service.searchListByPaging(cri));
//		model.addAttribute("pageMaker", pageMaker);
//		model.addAttribute("startPage", pageMaker.getStartPage());
//		model.addAttribute("endPage", pageMaker.getEndPage());
//
//		return "admin";
//	}

	@GetMapping("excel.do")
	public void Excel(@ModelAttribute("searchVO") BoardVO searchVO, HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("================");
		service.getReserveExcel(searchVO, request, response);

	}

	@GetMapping("")
	public String getList(Criteria cri, Model model) {
		cri.setPageNum(1); // 페이지 번호를 1로 초기화
		List<BoardVO> list = service.getListByPaging(cri);
		double totalCount = service.getSearchTotalCount(cri);
		PageMaker pageMaker = new PageMaker(cri, totalCount);
		model.addAttribute("cri", cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		return "admin";
	}

	@GetMapping("admin/")
	public String getListByPaging(@ModelAttribute("pageNum") int pageNum, Criteria cri, Model model) {
		cri.setPageNum(pageNum);
		List<BoardVO> list = service.getListByPaging(cri);
		double totalCount = service.getSearchTotalCount(cri);
		PageMaker pageMaker = new PageMaker(cri, totalCount);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		return "admin";
	}
	
	@PostMapping("/remove")
	public String removePost(int boardNum) {
		service.removePost(boardNum);
		return "redirect:/admin";
	}
	
	@PostMapping("/modify")
	public String modifyPost(int boardNum) {
		service.modifyPost(boardNum);
		return "redirect:/admin";
	}
}
