package com.spring.board.dao;

import java.util.List;

import com.spring.board.vo.BoardVO;

public interface BoardDAO {
	 public List<BoardVO> boardlist(BoardVO bvo);
	 public int boardinsert(BoardVO bvo);
	 public BoardVO boarddetail(BoardVO bvo);
	 public int boarddelete(BoardVO bvo);
	 public int boardupdate(BoardVO bvo);
	 public int hitmake(BoardVO bvo);
	 public int boardListCnt(BoardVO bvo);
	 
	

}
