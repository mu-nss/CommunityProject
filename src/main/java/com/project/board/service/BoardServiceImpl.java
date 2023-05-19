package com.project.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.board.mapper.BoardMapper;
import com.project.board.vo.BoardVO;
import com.webjjang.util.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("BoardServiceImpl")
@Log4j
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = {@Autowired})
	private BoardMapper mapper; // DB 처리
	
	@Override
	public List<BoardVO> list(PageObject pageObject) throws Exception {
		// 전체 데이터 개수를 가져오는 처리
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		log.info(pageObject);
		
		return mapper.list(pageObject);
	}

	@Override
	public BoardVO view(long no, int inc) throws Exception {
		if(inc == 1) mapper.increase(no);
		return mapper.view(no);
	}

	@Override
	public int write(BoardVO vo) throws Exception {
		return mapper.write(vo);
	}

	@Override
	public int update(BoardVO vo) throws Exception {
		return mapper.update(vo);
	}

	@Override
	public int delete(long no) throws Exception {
		return mapper.delete(no);
	}


}
