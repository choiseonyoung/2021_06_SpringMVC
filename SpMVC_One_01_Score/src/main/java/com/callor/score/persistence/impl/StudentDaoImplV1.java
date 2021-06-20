package com.callor.score.persistence.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.callor.score.model.StudentDTO;
import com.callor.score.model.StudentVO;
import com.callor.score.persistence.StudentDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository("studentDaoV1")
public class StudentDaoImplV1 implements StudentDao {

	public StudentDTO select(String num) {
		// TODO 리스트 클릭 시 학생정보 페이지
		return null;
	}

	@Override
	public List<StudentVO> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(StudentVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(StudentVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String num) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
