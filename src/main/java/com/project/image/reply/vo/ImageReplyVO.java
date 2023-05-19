package com.project.image.reply.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ImageReplyVO {
	
	private Long rno;
	private Long no;
	private String reply;
	private String replyer;
	private Date replyDate;
	private Date updateDate;
	
}
