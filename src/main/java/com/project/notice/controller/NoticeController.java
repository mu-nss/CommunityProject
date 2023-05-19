package com.project.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.notice.service.NoticeService;
import com.project.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice")
@Log4j
public class NoticeController {
	
	@Autowired
	@Qualifier("NoticeServiceImpl")
	private NoticeService service;
	
	// 공지사항 리스트
	@RequestMapping("/list.do")
	public String list(PageObject pageObject, Model model) throws Exception {
		model.addAttribute("list", service.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		
		return "notice/list";
	}
	
	// 공지사항 보기
	@GetMapping("/view.do")
	public String view(long no, Model model) throws Exception {
		model.addAttribute("vo", service.view(no));

		return "notice/view";
	}
	
	// 공지사항 등록 폼 - g
	@GetMapping("/write.do")
	public String writeForm() throws Exception {
		return "notice/write";
	}

	// 공지사항 등록 처리 - p
	@PostMapping("/write.do")
	public String write(NoticeVO vo, long perPageNum) throws Exception {
		service.write(vo);
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
	
	// 공지사항 수정 폼 - g
	@GetMapping("/update.do")
	public String updateForm(long no, Model model) throws Exception {
		model.addAttribute("vo", service.view(no));
		
		return "notice/update";
	}
	
	// 공지사항 수정 처리 - p
	@PostMapping("/update.do")
	public String update(NoticeVO vo, PageObject pageObject) throws Exception {
		int result = service.update(vo);
		
		if (result == 1) log.info("공지사항 수정 완료");
		else log.info("공지사항 수정 실패!! - 공지사항 글 번호를 확인해주세요.");
		
		return "redirect:view.do?no=" + vo.getNo()
				+ "&page=" + pageObject.getPage()
				+ "&perPageNum=" + pageObject.getPerPageNum()
				+ "&key=" + pageObject.getKey()
				+ "&word=" + pageObject.getWord();
	}
	
	// 공지사항 삭제 
	@GetMapping("/delete.do")
	public String delete(long no, long perPageNum) throws Exception {
		int result = service.delete(no);

		if (result == 1) log.info("공지사항 글 삭제 완료");
		else log.info("공지사항 글 삭제 실패!! - 공지사항 글 번호를 확인해주세요.");
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
}
