package com.project.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.notice.mapper.NoticeMapper;
import com.project.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("NoticeServiceImpl")
@Log4j
public class NoticeServiceImpl implements NoticeService {

	@Setter(onMethod_ = {@Autowired})
	private NoticeMapper mapper;
	
	@Override
	public List<NoticeVO> list(PageObject pageObject) throws Exception {
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		log.info(pageObject);
		
		return mapper.list(pageObject);
	}

	@Override
	public NoticeVO view(long no) throws Exception {
		return mapper.view(no);
	}

	@Override
	public int write(NoticeVO vo) throws Exception {
		return mapper.write(vo);
	}

	@Override
	public int update(NoticeVO vo) throws Exception {
		return mapper.update(vo);
	}

	@Override
	public int delete(long no) throws Exception {
		return mapper.delete(no);
	}


}
