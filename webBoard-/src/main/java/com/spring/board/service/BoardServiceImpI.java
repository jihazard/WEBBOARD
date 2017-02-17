package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.dao.BoardDAO;
import com.spring.board.vo.BoardVO;
@Service
@Transactional
public class BoardServiceImpI implements BoardService {

	@Autowired
	public BoardDAO boardDAO;
	
	
	@Override
	public List<BoardVO> boardlist(BoardVO bvo) {
		// TODO Auto-generated method stub
		
		List<BoardVO> list=null;
		list=boardDAO.boardlist(bvo);
		return list;
	}


	@Override
	public int boardinsert(BoardVO bvo) {
		// TODO Auto-generated method stub
		return boardDAO.boardinsert(bvo);
	}


	@Override
	public BoardVO boarddetail(BoardVO bvo) {
		// TODO Auto-generated method stub
		return boardDAO.boarddetail(bvo);
	}


	@Override
	public int boarddelete(BoardVO bvo) {
		// TODO Auto-generated method stub
		return boardDAO.boarddelete(bvo);
	}


	@Override
	public int boardupdate(BoardVO bvo) {
		// TODO Auto-generated method stub
		return boardDAO.boardupdate(bvo);
	}


	@Override
	public int hitmake(BoardVO bvo) {
		// TODO Auto-generated method stub
		return boardDAO.hitmake(bvo);
	}


	@Override
	public int boardListCnt(BoardVO bvo) {
		// TODO Auto-generated method stub
		return boardDAO.boardListCnt(bvo);
	}




}
