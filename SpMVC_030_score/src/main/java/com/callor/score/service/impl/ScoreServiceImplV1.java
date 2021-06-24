package com.callor.score.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.callor.score.dao.ext.ScoreDao;
import com.callor.score.model.ScoreDTO;
import com.callor.score.service.ScoreService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service("scoreServiceV1")
public class ScoreServiceImplV1 implements ScoreService {
	
	protected final ScoreDao scoreDao;

	@Override
	public List<ScoreDTO> selectViewAll() {
		List<ScoreDTO> list = scoreDao.selectViewAll();
		return list;
	}

}
