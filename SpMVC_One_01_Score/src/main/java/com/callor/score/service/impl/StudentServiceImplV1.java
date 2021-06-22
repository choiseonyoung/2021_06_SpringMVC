package com.callor.score.service.impl;

import org.springframework.stereotype.Service;

import com.callor.score.model.StudentVO;
import com.callor.score.persistence.StudentDao;
import com.callor.score.service.StudentService;

@Service("student")
public class StudentServiceImplV1 implements StudentService{

	protected final StudentDao studentDao;
	public StudentServiceImplV1(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	
	@Override
	public Integer insert(StudentVO vo) {
		return studentDao.insert(vo);
	}

}
