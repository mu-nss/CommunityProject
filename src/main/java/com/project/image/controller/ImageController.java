package com.project.image.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.image.service.ImageService;
import com.project.image.vo.ImageVO;
import com.project.member.vo.LoginVO;
import com.webjjang.util.PageObject;
import com.webjjang.util.file.FileUtil;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/image")
@Log4j
public class ImageController {
	
	@Setter(onMethod_ = {@Autowired})
	private ImageService imageServiceImpl;
	
	// 이미지 리스트
	@GetMapping("/list.do")
	public String list(PageObject pageObject, Model model) throws Exception{
		// 기본값이 10이면 8로 세팅
		if(pageObject.getPerPageNum() == 10) pageObject.setPerPageNum(8);
		
		model.addAttribute("list", imageServiceImpl.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		
		return "image/list";
	} 
	
	// 이미지 보기
	@GetMapping("/view.do")
	public String view(long no, Model model) throws Exception{
		model.addAttribute("vo", imageServiceImpl.view(no));
		
		return "image/view";
	}
	
	// 이미지 등록 폼 - g
	@GetMapping("/write.do")
	public String writeForm() throws Exception{
		return "image/write";
	}
	
	// 이미지 등록 처리 - p
	@PostMapping("/write.do")
	public String write(ImageVO vo, HttpSession session, HttpServletRequest request, long perPageNum) throws Exception{
		// 작성자 아이디 세팅
		 vo.setId(((LoginVO) session.getAttribute("login")).getId());
		
		// 이미지 파일명 세팅 - 실제로 파일 올리기
		vo.setFileName(FileUtil.upload("/upload/image", vo.getImageFile(), request));
		imageServiceImpl.write(vo);
		
		// 이미지 업로드 되는 시간을 벌어서 기다리는 처리
		Thread.sleep(8000);
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
	
	// 이미지만 변경 
	@PostMapping("/imageChange.do")
	public String imageChange(PageObject pageObject, ImageVO vo, HttpServletRequest request) throws Exception{
		
		// 서버에 파일 업로드
		vo.setFileName(FileUtil.upload("/upload/image", vo.getImageFile(), request));
		
		// DB에 수정
		imageServiceImpl.imageChange(vo);
		
		// 원래 있던 파일은 삭제
		FileUtil.remove(FileUtil.getRealPath("", vo.getDeleteName(), request));
		
		return "redirect:view.do?no=" + vo.getNo() 
				+ "&page=" + pageObject.getPage()
				+ "&perPageNum=" + pageObject.getPerPageNum()
				+ "&key=" + pageObject.getKey()
				+ "&word=" + pageObject.getWord();
	}
	
	// 이미지 수정 폼 - g
	@GetMapping("/update.do")
	public String updateForm(long no, Model model) throws Exception{
		model.addAttribute("vo", imageServiceImpl.view(no));

		return "image/update";
	}
	
	// 이미지 수정 처리 - p
	@PostMapping("/update.do")
	public String update(ImageVO vo, PageObject pageObject) throws Exception{
		imageServiceImpl.update(vo);
		
		//검색 처리하면서 key와 word를 넘어가는지 확인
		return "redirect:view.do?no=" + vo.getNo() 
				+ "&page=" + pageObject.getPage()
				+ "&perPageNum=" + pageObject.getPerPageNum()
				+ "&key=" + pageObject.getKey()
				+ "&word=" + pageObject.getWord();
	}
	
	// 이미지 삭제 - g
	@GetMapping("/delete.do")
	public String delete(ImageVO vo, HttpServletRequest request, int perPageNum) throws Exception{
		imageServiceImpl.delete(vo.getNo());
		FileUtil.remove(FileUtil.getRealPath("", vo.getDeleteName(), request));
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
}
