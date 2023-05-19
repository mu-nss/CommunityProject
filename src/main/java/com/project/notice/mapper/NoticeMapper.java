package com.project.notice.mapper;

import java.util.List;

import com.project.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;

public interface NoticeMapper {
	
	// 공지사항 리스트
	public List<NoticeVO> list(PageObject pageObject) throws Exception;
	// 공지사항 전체 데이터 개수
	public long getTotalRow(PageObject pageObject) throws Exception;
	
	// 공지사항 보기
	public NoticeVO view(long no) throws Exception;
	
	// 공지사항 등록
	public int write(NoticeVO vo) throws Exception;
	
	// 공지사항 수정
	public int update(NoticeVO vo) throws Exception;
	
	// 공지사항 삭제
	public int delete(long no) throws Exception;
}
