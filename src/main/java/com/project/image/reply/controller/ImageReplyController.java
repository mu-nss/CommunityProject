package com.project.image.reply.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.project.image.reply.service.ImageReplyService;
import com.project.image.reply.vo.ImageReplyVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/imagereply")
@Log4j
public class ImageReplyController {
	
	@Autowired
	@Qualifier("ImageReplyServiceImpl")
	private ImageReplyService service;
	
	// 이미지 댓글 리스트
	@GetMapping(
		value = "/list.do", 
		produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE}
	)
	public ResponseEntity<Map<String, Object>> list(PageObject pageObject, Long no) {
		// 페이지에 맞는 list 데이터 가져오기
		List<ImageReplyVO> list = service.list(pageObject, no);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageObject", pageObject);
		map.put("list", list);
		log.info(map);
		
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	// 이미지 댓글 등록
	@PostMapping(value = "/write.do", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> write(@RequestBody ImageReplyVO vo) {
		service.write(vo);
		
		return new ResponseEntity<>("write success", HttpStatus.OK);
	}
	
	// 이미지 댓글 수정
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value = "/update.do", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> update(@RequestBody ImageReplyVO vo) {
		int result = service.update(vo);
		
		return (result == 1) 
				? new ResponseEntity<>("update success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 이미지 댓글 삭제
	@RequestMapping(method = {RequestMethod.DELETE}, value = "/delete.do", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> delete(long rno) {
		int result = service.delete(rno);
		
		return (result == 1) 
				? new ResponseEntity<>("delete success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
