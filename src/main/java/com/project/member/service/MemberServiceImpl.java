package com.project.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.member.mapper.MemberMapper;
import com.project.member.vo.LoginVO;
import com.project.member.vo.MemberVO;
import com.webjjang.util.PageObject;

import lombok.Setter;

@Service
@Qualifier("memberServiceImpl")
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public LoginVO login(LoginVO vo){
		return mapper.login(vo);
	}
	
	@Override
	public String idCheck(String id) throws Exception {
		return mapper.idCheck(id);
	}
	
	@Override
	public List<MemberVO> list(PageObject pageObject) throws Exception {
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		
		return mapper.list(pageObject);
	}

	@Override
	public MemberVO view(String id) throws Exception {
		return mapper.view(id);
	}

	@Override
	public int write(MemberVO vo) throws Exception {
		return mapper.write(vo);
	}

	@Override
	public int update(MemberVO vo) throws Exception {
		return 0;
	}

	@Override
	public int delete(String id) throws Exception {
		return mapper.delete(id);
	}

	@Override
	public int chageStatus(MemberVO vo) throws Exception {
		return mapper.chageStatus(vo);
	}

	@Override
	public int changeGradeNo(MemberVO vo) throws Exception {
		return mapper.changeGradeNo(vo);
	}

}
