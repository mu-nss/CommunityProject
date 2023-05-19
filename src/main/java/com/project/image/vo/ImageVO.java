package com.project.image.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ImageVO {

	private long no;
	private String title, content, id;
	private Date writeDate;
	// DB에 저장된 첨부파일명
	private String fileName;
	
	// 첨부되어 올라오는 파일
	private MultipartFile imageFile;
	
	// 삭제 할 이미지 파일명을 전달 받아서
	private String deleteName;
	
}
