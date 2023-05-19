package com.project.notice.service;


import java.util.List;

import com.project.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;

public interface NoticeService {
	
	public List<NoticeVO> list(PageObject pageObject) throws Exception;
	
	public NoticeVO view(long no) throws Exception;
	
	public int write(NoticeVO vo) throws Exception;
	
	public int update(NoticeVO vo) throws Exception;
	
	public int delete(long no) throws Exception;

}
