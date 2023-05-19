package com.project.image.mapper;

import java.util.List;

import com.project.image.vo.ImageVO;
import com.webjjang.util.PageObject;

public interface ImageMapper {
	
	// 이미지 리스트
	public List<ImageVO> list(PageObject pageObject)throws Exception;
	// 전체 데이터 개수
	public long getTotalRow(PageObject pageObject)throws Exception;
	
	// 이미지 보기
	public ImageVO view(long no)throws Exception;
		
	// 이미지만 변경하는 처리
	public int imageChange(ImageVO vo)throws Exception;
		
	// 이미지 등록
	public int write(ImageVO vo)throws Exception;
		
	// 이미지 수정
	public int update(ImageVO vo)throws Exception;
		
	// 이미지 삭제
	public int delete(long no)throws Exception;
}
