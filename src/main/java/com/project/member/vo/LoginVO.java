package com.project.member.vo;

import lombok.Data;

@Data
public class LoginVO {

	private String id;
	private String pw;
	private String name;
	private String photo;
	private int gradeNo;
	private String gradeName;
	// 새로운 메세지를 저장하는 변수 -> 서브쿼리
	// 메세지 시스템에서 새 메세지를 읽으면 세션에 있는 새메시지 정보르 -1처리해야 함
	private long newMessage; 
	
	
}
