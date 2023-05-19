package com.project.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.board.service.BoardService;
import com.project.board.vo.BoardVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board")
@Log4j
public class BoardController {
	
	@Autowired
	@Qualifier("BoardServiceImpl")
	private BoardService service;
	
	// 게시판 리스트
	@RequestMapping("/list.do")
	public String list(PageObject pageObject, Model model) throws Exception {
		// list 데이터 가져오기
		model.addAttribute("list", service.list(pageObject));
		// pageObject 데이터
		model.addAttribute("pageObject", pageObject);
		
		return "board/list";
	}
	
	// 게시판 보기
	@GetMapping("/view.do")
	public String view(long no, int inc, Model model) throws Exception {
		model.addAttribute("vo", service.view(no, inc));
		
		return "board/view";
	}
	
	// 게시판 등록 폼- g
	@GetMapping("/write.do")
	public String writeForm() throws Exception {
		return "board/write";
	}
	
	// 게시판 등록 처리 - p
	@PostMapping("/write.do")
	public String write(BoardVO vo, long perPageNum) throws Exception {
		service.write(vo);
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
	
	// 게시판 수정 폼 - g
	@GetMapping("/update.do")
	public String updateForm(long no, Model model) throws Exception {
		model.addAttribute("vo", service.view(no, 0));
		
		return "board/update";
	}
	
	// 게시판 수정 처리 - p
	@PostMapping("/update.do")
	public String update(BoardVO vo, PageObject pageObject) throws Exception {
		int result = service.update(vo);
		
		if (result == 1) log.info("게시판 수정 완료");
		else log.info("게시판 수정 실패 - 게시판 글 번호를 확인 필요");
		
		return "redirect:view.do?no=" + vo.getNo() + "&inc=0"
				+ "&page=" + pageObject.getPage()
				+ "&perPageNum=" + pageObject.getPerPageNum()
				+ "&key=" + pageObject.getKey()
				+ "&word=" + pageObject.getWord();
	}
	
	// 게시판 삭제
	@GetMapping("/delete.do")
	public String delete(long no, long perPageNum) throws Exception {
		int result = service.delete(no);
		
		if (result == 1) log.info("게시판 글 삭제 완료");
		else log.info("게시판 글 삭제 실패!! - 게시판 글 번호를 확인해주세요.");
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
}
