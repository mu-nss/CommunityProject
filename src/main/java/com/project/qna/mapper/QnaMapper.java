package com.project.qna.mapper;

import java.util.List;

import com.project.qna.vo.QnaVO;
import com.webjjang.util.PageObject;

public interface QnaMapper {

	// 질문답변 리스트
	public List<QnaVO> list(PageObject pageObject) throws Exception; 
	// 질문답변 전체 데이터 개수 
	public long getTotalRow(PageObject pageObject) throws Exception;
	
	// 질문답변 - 질문하기
	public int question(QnaVO vo) throws Exception;
	
	// 질문답변 보기
	public QnaVO view(long no) throws Exception;
	// 조회수 1 증가 
	public int increase(long no) throws Exception;
	
	// 질문답변 - 답변하기
	public int answer(QnaVO vo) throws Exception;
	// 순서 번호 증가
	public int increaseOrdNo(QnaVO vo) throws Exception;
	
	// 질문답변 수정
	public int update(QnaVO vo) throws Exception;
	
	// 질문답변 삭제
	public int delete(long no) throws Exception;
	
}
