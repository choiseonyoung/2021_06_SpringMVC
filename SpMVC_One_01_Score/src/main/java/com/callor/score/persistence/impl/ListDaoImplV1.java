package com.callor.score.persistence.impl;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.callor.score.model.ListDTO;
import com.callor.score.persistence.ListDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository("listDaoV1")
public class ListDaoImplV1 implements ListDao {

	protected final JdbcTemplate jdbcTemplate;
	public ListDaoImplV1(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	public List<ListDTO> selectAll() {
		// TODO 프로젝트 시작화면. 학생리스트와 성적 정보 전체 출력
		String sql = " SELECT * FROM view_학생리스트 ";
		List<ListDTO> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<ListDTO>(ListDTO.class));
		log.debug("SELECT {}", list.toString());
		return list;
	}

	@Override
	public int insert(ListDTO vo) {
		// TODO 학생 정보 추가
		return 0;
	}

	@Override
	public int update(ListDTO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String pk) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
