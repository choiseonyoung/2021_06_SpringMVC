package com.callor.score.persistence;

import com.callor.score.model.ScoreVO;

public interface ScoreDao extends GenericDao<ScoreVO, String> {
	public int insert(ScoreVO vo);
}
