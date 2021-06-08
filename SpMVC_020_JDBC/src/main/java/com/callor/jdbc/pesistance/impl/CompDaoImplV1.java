package com.callor.jdbc.pesistance.impl;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.callor.jdbc.model.CompVO;
import com.callor.jdbc.pesistance.CompDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository("compDaoV1") // bean으로 등록하기 위해 // 레파지토리에 이름 붙이는 이유 : 
public class CompDaoImplV1 implements CompDao {

	protected final JdbcTemplate jdbcTemplate;
	public CompDaoImplV1(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	public List<CompVO> SelectAll(String comp) {

		String sql = " SELECT * FROM tbl_company ";
		
		List<CompVO> compList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<CompVO>(CompVO.class));
		log.debug("SELECT {}", compList.toString());
		
		return compList;
	}

	@Override
	public CompVO findById(String pk) {
		// TODO Auto-generated method stub
		String sql = "";
		Object[] params = new Object[] { pk };
		
		CompVO vo = (CompVO) jdbcTemplate.query(sql, params, new BeanPropertyRowMapper(CompVO.class));
		
		return null;
	}

	@Override
	public int insert(CompVO vo) {
		// TODO Auto-generated method stub
		String sql = " INSERT INTO tbl_company ";
		sql += " (cp_code, cp_title, cp_ceo, cp_tel, cp_addr ) ";
		sql += " VALUES( ?,?,?,?,? )" ;
		
		Object[] params = new Object[] {vo.getCp_code(), vo.getCp_title(), vo.getCp_ceo(), vo.getCp_addr(), vo.getCp_tel() };
		// 전달받은 vo를 오브젝터 배열로 만들어주고 update 메서드에 sql 명령문 문자열과 오브젝트로 만들어진 params 건네줌
		return jdbcTemplate.update(sql,params);
	}

	@Override
	public int update(CompVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String pk) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CompVO> findByCName(String cname) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CompVO> findByTel(String tel) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CompVO> findByCeo(String ceo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CompVO> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
