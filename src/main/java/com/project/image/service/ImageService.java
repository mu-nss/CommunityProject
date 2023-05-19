package com.project.image.service;

import java.util.List;

import com.project.image.vo.ImageVO;
import com.webjjang.util.PageObject;

public interface ImageService {

	public List<ImageVO> list(PageObject pageObject)throws Exception;
	
	public ImageVO view(long no)throws Exception;
	
	public int imageChange(ImageVO vo)throws Exception;
	
	public int write(ImageVO vo)throws Exception;
	
	public int update(ImageVO vo)throws Exception;
	
	public int delete(long no)throws Exception;
	
}
