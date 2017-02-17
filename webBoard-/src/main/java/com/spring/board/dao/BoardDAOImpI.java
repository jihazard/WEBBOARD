package com.spring.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.vo.BoardVO;
@Repository
public class BoardDAOImpI implements BoardDAO {
 
	@Autowired
	public SqlSession session;
	
	@Override
	public List<BoardVO> boardlist(BoardVO bvo) {
		// TODO Auto-generated method stub
		return session.selectList("boardlist");
	}

	@Override
	public int boardinsert(BoardVO bvo) {
		// TODO Auto-generated method stub
		return (int)session.insert("boardinsert");
	}

	@Override
	public BoardVO boarddetail(BoardVO bvo) {
		// TODO Auto-generated method stub
		return (BoardVO)session.selectOne("boarddetail");
	}

	@Override
	public int boarddelete(BoardVO bvo) {
		// TODO Auto-generated method stub
		return (int)session.delete("boarddelete");
	}

	@Override
	public int boardupdate(BoardVO bvo) {
		// TODO Auto-generated method stub
		return (int)session.update("boardupdate");
	}

	@Override
	public int hitmake(BoardVO bvo) {
		// TODO Auto-generated method stub
		return session.update("hitmake");
	}

	@Override
	public int boardListCnt(BoardVO bvo) {
		// TODO Auto-generated method stub
		return session.selectOne("boardListCnt");
	}



}
