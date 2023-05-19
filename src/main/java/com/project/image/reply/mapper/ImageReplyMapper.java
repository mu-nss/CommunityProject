package com.project.image.reply.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.image.reply.vo.ImageReplyVO;
import com.webjjang.util.PageObject;

public interface ImageReplyMapper {

	// 이미지 댓글 리스트
	// MyBatis의 DB처리 메소드들은 파라메터를 한개만 받도록 작성되어 있다
	// 그런데 2개 이상의 데이터를 넘길 떄 @Param을 이용하면 한개로 만들어서 넘겨준다. 주로 map을 사용한다.
	public List<ImageReplyVO> list(
		@Param("pageObject") PageObject pageObject, 
		@Param("no") Long no
	);
	
	// 이미지 번호에 맞는 전체 댓글 개수 가져오기
	public Long getTotalRow(long no);
	
	// 이미지 댓글 등록
	public int write(ImageReplyVO vo);
	
	// 이미지 댓글 수정
	public int update(ImageReplyVO vo);
	
	// 이미지 댓글 삭제
	public int delete(long rno);
}
