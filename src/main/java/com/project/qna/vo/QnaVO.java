package com.project.qna.vo;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {

	private long no;
	private String title;
	private String content;
	private String id;
	private String name; // 조인 필요
	private Date writeDate;
	private long hit;
	private long refNo;
	private long ordNo;
	private long levNo;
	private long parentNo;
}
