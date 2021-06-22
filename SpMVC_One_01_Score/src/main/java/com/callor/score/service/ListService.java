package com.callor.score.service;

import java.util.List;

import com.callor.score.model.ListDTO;
import com.callor.score.model.StudentVO;

public interface ListService {
	public List<ListDTO> selectAll();
}
