package com.callor.score.service.impl;

import org.springframework.stereotype.Service;

import com.callor.score.persistence.ListDao;
import com.callor.score.service.ListService;

@Service("listV1")
public class ListServiceImplV1 implements ListService {
	
	protected final ListDao listDao;
	
	public ListServiceImplV1(ListDao listDao) {
		this.listDao = listDao;
	}
	
	public void viewList() {
		listDao.selectAll();
	}
}
