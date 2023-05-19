package com.project.board.service;


import java.util.List;

import com.project.board.vo.BoardVO;
import com.webjjang.util.PageObject;

public interface BoardService {
	
	public List<BoardVO> list(PageObject pageObject) throws Exception;
	
	public BoardVO view(long no, int inc) throws Exception;
	
	public int write(BoardVO vo) throws Exception;
	
	public int update(BoardVO vo) throws Exception;
	
	public int delete(long no) throws Exception;

}
