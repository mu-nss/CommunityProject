package com.project.qna.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.member.vo.LoginVO;
import com.project.qna.service.QnaService;
import com.project.qna.vo.QnaVO;
import com.webjjang.util.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/qna")
@Log4j
public class QnaController {

	@Setter(onMethod_ = @Autowired)
	private QnaService qnaServiceImpl;
	
	// 질문답변 리스트
	@GetMapping("/list.do")
	public String list(PageObject pageObject, Model model) throws Exception {
		model.addAttribute("list", qnaServiceImpl.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		
		return "qna/list";
	}
	
	// 질문답변 질문하기 폼 - g
	@GetMapping("/question.do")
	public String questionForm() throws Exception{
		return "qna/question";
	}

	// 질문답변 질문하기 처리 - p
	@PostMapping("/question.do")
	public String question(QnaVO vo, HttpSession session, long perPageNum) throws Exception {
		vo.setId(((LoginVO)session.getAttribute("login")).getId());
		
		qnaServiceImpl.question(vo); // DB 처리
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
	
	// 질문 & 답변 보기
	@GetMapping("/view.do")
	public String view(long no, int inc, Model model) throws Exception {
		QnaVO vo = qnaServiceImpl.view(no, inc);
		// enter 처리 : \n -> <br> 변환
		vo.setContent(vo.getContent().replace("\n", "<br>")); 
		
		model.addAttribute("vo", vo);
		
		return "qna/view";
	}
	
	// 답변하기 폼 - g
	@GetMapping("/answer.do")
	public String answerForm(long no, Model model) throws Exception {
		model.addAttribute("vo", qnaServiceImpl.view(no, 0));
		
		return "qna/answer";
	}
	
	// 답변하기 처리 - p
	@PostMapping("/answer.do")
	public String answer(PageObject pageObject, QnaVO vo, HttpSession session) throws Exception {
		vo.setId(((LoginVO)session.getAttribute("login")).getId());
		
		qnaServiceImpl.answer(vo);
		
		return "redirect:list.do?page=" + pageObject.getPage() 
				+ "&perPageNum=" + pageObject.getPerPageNum()
				+ "&key=" + pageObject.getKey()
				+ "&word=" + pageObject.getWord();
	}
	
	// 수정하기 폼 - p
	@GetMapping("/update.do")
	public String updateForm(long no, Model model) throws Exception {
		model.addAttribute("vo", qnaServiceImpl.view(no, 0)); // DB에서 데이터 가져오기
		
		return "qna/update";
	}

	// 수정하기 처리 - p
	@PostMapping("/update.do")
	public String update(QnaVO vo, PageObject pageObject) throws Exception {
		qnaServiceImpl.update(vo);
		
		return "redirect:view.do?no=" + vo.getNo() + "&inc=0"
				+ "&page=" + pageObject.getPage()
				+ "&perPageNum=" + pageObject.getPerPageNum()
				+ "&key=" + pageObject.getKey()
				+ "&word=" + pageObject.getWord();
	}
	
	// 질문답변 삭제
	@GetMapping("/delete.do")
	public String delete(long no, int perPageNum) throws Exception {
		qnaServiceImpl.delete(no);
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
}
