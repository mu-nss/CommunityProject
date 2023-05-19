package com.project.board.vo;

import java.util.Date;
import lombok.Data;

@Data
public class BoardVO {

	private long no;
	private String title;
	private String content;
	private String writer;
	private Date writeDate;
	private int hit;
	
	// 댓글 개수
	private long replyCnt;
	// 첨부 파일 리스트 추가 필요 - 게시판 첨부 파일 정보
//	private List<BoardAttachVO> attachList;
}
