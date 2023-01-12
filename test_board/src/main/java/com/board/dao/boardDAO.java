package com.board.dao;

import java.util.List;

import com.board.domain.BoardVO;

public interface boardDAO {
	public List<BoardVO> list();
	public void create(BoardVO vo);
	public BoardVO detail(int no);
	public void update(BoardVO vo);
	public void delete(String no);
}
