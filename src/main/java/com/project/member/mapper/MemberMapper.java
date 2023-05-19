package com.project.member.mapper;

import java.util.List;

import com.project.member.vo.MemberVO;
import com.project.member.vo.LoginVO;
import com.webjjang.util.PageObject;

public interface MemberMapper {
	
	// 로그인 
	public LoginVO login(LoginVO vo);
	
	// 아이디 중복 체크
	public String idCheck(String id) throws Exception;
	
	// 회원관리 리스트
	public List<MemberVO> list(PageObject pageObject) throws Exception;
	// 회원 전체 데이터 개수
	public long getTotalRow(PageObject pageObject) throws Exception;
	
	// 회원 정보 보기
	public MemberVO view(String id) throws Exception;
	
	// 회원가입
	public int write(MemberVO vo) throws Exception;
	
	// 내 정보 수정
	public int update(MemberVO vo) throws Exception;
	
	// 회원 탈퇴
	public int delete(String id) throws Exception;
	
	// 상태 변경
	public int chageStatus(MemberVO vo) throws Exception;

	// 등급 변경
	public int changeGradeNo(MemberVO vo) throws Exception;

}
