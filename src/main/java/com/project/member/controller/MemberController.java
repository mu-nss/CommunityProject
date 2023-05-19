package com.project.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.member.service.MemberService;
import com.project.member.vo.LoginVO;
import com.project.member.vo.MemberVO;
import com.webjjang.util.PageObject;
import com.webjjang.util.file.FileUtil;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {
	
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService service;
	
	// 로그인 폼
	@GetMapping("/login.do")
	public String loginForm() {
		log.info("로그인 폼   --- ");
		return "member/login";
	}

	// 로그인 처리 - vo에서 id와 pw를 받고 세션에 넘겨서 처리
	@PostMapping("/login.do")
	public String login(String id, String pw, HttpSession session, RedirectAttributes rttr) throws Exception {
		LoginVO vo = new LoginVO();
		vo.setId(id);
		vo.setPw(pw);
		
		session.setAttribute("login", service.login(vo));
		
		if (session.getAttribute("login") == null) {
			throw new Exception("로그인 오류 - 아이디와 비번을 확인해주세요.");
		}else {
			rttr.addFlashAttribute("msg", "로그인 성공");
		}
		
		return "redirect:/main/main.do";
	}
	
	// 아이디 중복 체크
	@GetMapping("/idCheck")
	public String idCheck(String id, Model model) throws Exception{
		
		model.addAttribute("id", service.idCheck(id));
		
		return "member/idCheck";
	}
	
	// 로그아웃 처리
	@GetMapping("/logout.do")
	public String logout(HttpSession session) throws Exception{
		session.removeAttribute("login");
		return "redirect:/main/main.do";
	}
	
	// 회원 리스트 
	@GetMapping("/list.do")
	public String list(@ModelAttribute PageObject pageObject, Model model) throws Exception {
		model.addAttribute("list", service.list(pageObject));
		return "member/list";
	}
	
	// 회원 정보 보기 / 내 정보 보기
	@GetMapping("/view.do")
	public String view(String id, Model model, HttpSession session) throws Exception {
		if(id == null) {
			model.addAttribute("title", "My Profile"); // 내 정보 보기
			id = ((LoginVO)session.getAttribute("login")).getId();
		} else {
			model.addAttribute("title", "Member Profile"); // 회원 정보 보기
		}
		model.addAttribute("vo", service.view(id));
		return "member/view";
	}
	
	// 회원가입 폼
	@GetMapping("/write.do")
	public String writeForm() throws Exception {
		return "member/write";
	}
	
	// 회원가입 처리
	@PostMapping("/write.do")
	public String write(MemberVO vo, HttpServletRequest request) throws Exception {
		// 회원 사진 저장 위치
		String PATH = "/upload/member";
		
		// 서버에 파일 저장하기
		vo.setPhoto(FileUtil.upload(PATH, vo.getPhotoFile(), request));
		
		// 회원가입 처리
		service.write(vo);
		
		return "redirect:/member/login.do";
	}
	
	// 회원 정보 수정 폼
	// 회원 정보 수정 처리
	
	// 회원 정보 삭제 처리
	@GetMapping("/delete.do")
	public String delete(String id, long perPageNum) throws Exception {
		log.info("회원 정보 삭제");
		
		int result = service.delete(id);
		if (result == 1) log.info("회원 정보 삭제 완료");
		else log.info("회원 정보 삭제를 실패했습니다.");
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
	
	// 상태 변경
	@PostMapping("/chageStatus.do")
	public String chageStatus(PageObject pageObject, MemberVO vo) throws Exception {
		service.chageStatus(vo);
		
		return "redirect:view.do?id=" + vo.getId() 
				+ "&page=" + pageObject.getPage()
				+ "&perPageNum=" + pageObject.getPerPageNum();
 	}

	// 등급 변경
	@PostMapping("/changeGradeNo.do")
	public String changeGradeNo(PageObject pageObject, MemberVO vo) throws Exception {
		service.changeGradeNo(vo);
		
		return "redirect:view.do?id=" + vo.getId() 
				+ "&page=" + pageObject.getPage()
				+ "&perPageNum=" + pageObject.getPerPageNum();
	}

}
