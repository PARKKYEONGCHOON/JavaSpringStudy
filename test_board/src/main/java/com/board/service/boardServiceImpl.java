package com.board.service;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.boardDAO;
import com.board.domain.BoardVO;

@Service
public class boardServiceImpl implements boardService {

	@Inject
	private boardDAO dao;
	
	@Override
	public List<BoardVO> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}
	
	@Override
	public void create(BoardVO vo) {
		dao.create(vo);
	}
	
	@Override
	public BoardVO detail(int no) {
		// TODO Auto-generated method stub
		return dao.detail(no);
	}
	
	@Override
	public void update(BoardVO vo) {
		dao.update(vo);
	}
	
	@Override
	public void delete(String no) {
		dao.delete(no);
	}
	

}
