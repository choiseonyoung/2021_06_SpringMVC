package com.callor.score.persistence;

import java.util.List;

import com.callor.score.model.ListDTO;

public interface ListDao extends GenericDao<ListDTO, String> {
	
	public List<ListDTO> selectAll();
	public int insert(ListDTO vo);
	
}
