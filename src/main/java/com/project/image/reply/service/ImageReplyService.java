package com.project.image.reply.service;

import java.util.List;

import com.project.image.reply.vo.ImageReplyVO;
import com.webjjang.util.PageObject;

public interface ImageReplyService {
	
	public List<ImageReplyVO> list(PageObject pageObject, Long no); 
	
	public int write(ImageReplyVO vo);
	
	public int update(ImageReplyVO vo);
	
	public int delete(long rno);
}
