package com.project.image.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.image.reply.mapper.ImageReplyMapper;
import com.project.image.reply.vo.ImageReplyVO;
import com.webjjang.util.PageObject;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
@Qualifier("ImageReplyServiceImpl")
public class ImageReplyServiceImpl implements ImageReplyService{
	
	private ImageReplyMapper mapper;

	@Override
	public List<ImageReplyVO> list(PageObject pageObject, Long no) {
		// 이미지 번호에 맞는 전체 데이터 개수 처리 -> 안하면 데이터 안 나옴
		pageObject.setTotalRow(mapper.getTotalRow(no));
		
		return mapper.list(pageObject, no);
	}

	@Override
	public int write(ImageReplyVO vo) {
		return mapper.write(vo);
	}

	@Override
	public int update(ImageReplyVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int delete(long rno) {
		return mapper.delete(rno);
	}



}
