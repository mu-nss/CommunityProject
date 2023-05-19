package com.project.member.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVO {

	private String id;
	private String pw;
	private String name;
	private String gender;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private String tel;
	private String email;
	private Date regDate; // 가입일
	private Date conDate;
	private String status;
	private String photo;
	// 사용자가 올린 사진을 저장하는 변수
	// 회원가입 폼의 jsp에서 name="photoFile"로
	private MultipartFile photoFile;
	private int gradeNo;
	private String gradeName;
	
}
