package com.project.qna.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.qna.mapper.QnaMapper;
import com.project.qna.vo.QnaVO;
import com.webjjang.util.PageObject;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Inject
	private QnaMapper mapper;
	
	@Override
	public List<QnaVO> list(PageObject pageObject) throws Exception {
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		
		return mapper.list(pageObject);
	}
	
	@Override
	public int question(QnaVO vo) throws Exception {
		return mapper.question(vo);
	}
	
	@Override
	public QnaVO view(long no, int inc) throws Exception {
		if(inc == 1) mapper.increase(no);
		return mapper.view(no);
	}
	
	@Override
	public int answer(QnaVO vo) throws Exception {
		// ordNo -> ordNo + 1 : increaseOrdNo ordNo >= new ordNo
		// levNo -> levNo + 1 
		// no -> parentNo
		vo.setOrdNo(vo.getOrdNo() + 1);
		vo.setLevNo(vo.getLevNo() + 1);
		vo.setParentNo(vo.getNo());
		
		// 순서 번호 1 증가 시키기
		mapper.increaseOrdNo(vo);
		
		return mapper.answer(vo);
	}
	
	@Override
	public int update(QnaVO vo) throws Exception {
		return mapper.update(vo);
	}

	@Override
	public int delete(long no) throws Exception {
		return mapper.delete(no);
	}

}
