package com.project.board.mapper;

import java.util.List;

import com.project.board.vo.BoardVO;
import com.webjjang.util.PageObject;

public interface BoardMapper {
	
	// 게시판 리스트
	public List<BoardVO> list(PageObject pageObject) throws Exception;
	// 게시판 전체 데이터 개수
	public long getTotalRow(PageObject pageObject) throws Exception;
	
	// 게시판 보기
	public BoardVO view(long no) throws Exception;
	// 조회수 증가
	public int increase(long no) throws Exception;
	
	// 게시판 등록
	public int write(BoardVO vo) throws Exception;
	
	// 게시판 수정
	public int update(BoardVO vo) throws Exception;
	
	// 게시판 삭제
	public int delete(long no) throws Exception;
}
