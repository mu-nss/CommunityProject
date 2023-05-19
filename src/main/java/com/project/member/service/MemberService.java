package com.project.member.service;


import java.util.List;

import com.project.member.vo.LoginVO;
import com.project.member.vo.MemberVO;
import com.webjjang.util.PageObject;

public interface MemberService {
	
	// 로그인
	public LoginVO login(LoginVO vo);
	
	// 아이이 중복 체크
	public String idCheck(String id) throws Exception;
	
	public List<MemberVO> list(PageObject pageObject) throws Exception;
	
	public MemberVO view(String id) throws Exception;
	
	public int write(MemberVO vo) throws Exception;
	
	public int update(MemberVO vo) throws Exception;
	
	public int delete(String id) throws Exception;
	
	// 상태 변경
	public int chageStatus(MemberVO vo) throws Exception;
	
	// 등급 변경
	public int changeGradeNo(MemberVO vo) throws Exception;
}
