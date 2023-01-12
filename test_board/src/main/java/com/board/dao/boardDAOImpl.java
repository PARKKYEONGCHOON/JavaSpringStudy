package com.board.dao;

import java.util.List;
import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.BoardVO;

@Repository
public class boardDAOImpl implements boardDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.test_board.mappers.board";
	
	@Override
	public List<BoardVO> list() {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list");
	}
	
	@Override
	public void create(BoardVO vo) {
		sql.insert(namespace + ".create", vo);
	}
	
	@Override
	public BoardVO detail(int no) {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".detail", no);
	}
	
	@Override
	public void update(BoardVO vo) {
		sql.update(namespace + ".update", vo);
	}
	
	@Override
	public void delete(String no) {
		sql.delete(namespace + ".delete", no);
	}
	
}
