package com.callor.score.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.callor.score.dao.extend.ViewListDao;
import com.callor.score.model.ViewListDTO;
import com.callor.score.service.ViewListService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service("viewlistService")
public class ViewListServiceImpl implements ViewListService {

	protected final ViewListDao vlDao;
	
	@Override
	public List<ViewListDTO> selectAll() {
		List<ViewListDTO> list = vlDao.selectAll();
		return list;
	}

}
