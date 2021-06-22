package com.callor.score.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.callor.score.model.ListDTO;
import com.callor.score.persistence.ListDao;
import com.callor.score.service.ListService;

@Service("listV1")
public class ListServiceImplV1 implements ListService {
	
	protected final ListDao listDao;
	
	public ListServiceImplV1(ListDao listDao) {
		this.listDao = listDao;
	}

	@Override
	public List<ListDTO> selectAll() {
		return listDao.selectAll();
	}
}
