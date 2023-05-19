package com.project.qna.service;

import java.util.List;

import com.project.qna.vo.QnaVO;
import com.webjjang.util.PageObject;

public interface QnaService {

	public List<QnaVO> list(PageObject pageObject) throws Exception; 

	public int question(QnaVO vo) throws Exception; 
	
	public QnaVO view(long no, int inc) throws Exception;
	
	public int answer(QnaVO vo) throws Exception;
	
	public int update(QnaVO vo) throws Exception;
	
	public int delete(long no) throws Exception;
}
