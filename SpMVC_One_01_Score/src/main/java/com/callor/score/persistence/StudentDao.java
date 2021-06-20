package com.callor.score.persistence;

import com.callor.score.model.StudentVO;

public interface StudentDao extends GenericDao<StudentVO, String>{
	public int insert(StudentVO vo);
	public int update(StudentVO vo);
	public int delete(String num);
}
