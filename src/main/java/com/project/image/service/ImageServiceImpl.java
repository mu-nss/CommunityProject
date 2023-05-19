package com.project.image.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.image.mapper.ImageMapper;
import com.project.image.vo.ImageVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ImageServiceImpl implements ImageService {
	
	@Inject
	private ImageMapper mapper;

	@Override
	public List<ImageVO> list(PageObject pageObject) throws Exception {
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		
		return mapper.list(pageObject);
	}

	@Override
	public ImageVO view(long no) throws Exception {
		return mapper.view(no);
	}

	@Override
	public int imageChange(ImageVO vo) throws Exception {
		return mapper.imageChange(vo);
	}

	@Override
	public int write(ImageVO vo) throws Exception {
		return mapper.write(vo);
	}

	@Override
	public int update(ImageVO vo) throws Exception {
		return mapper.update(vo);
	}

	@Override
	public int delete(long no) throws Exception {
		return mapper.delete(no);
	}

}
