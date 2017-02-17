package com.spring.reply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.reply.vo.ReplyVO;
@Repository
public class ReplyDAOImpI implements ReplyDAO{

		@Autowired
		public SqlSession session;
	
	@Override
	public List<ReplyVO> replylist(int b_num) {
		// TODO Auto-generated method stub
		return session.selectList("replylist",b_num);
	}

	@Override
	public int replyinsert(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return (int)session.insert("replyinsert");
	}

}
