package com.spring.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.reply.dao.ReplyDAO;
import com.spring.reply.vo.ReplyVO;
@Service
@Transactional
public class ReplyServiceImpI implements ReplyService{

	@Autowired
	public ReplyDAO replyDAO;
	
	
	@Override
	public List<ReplyVO> replylist(int b_num) {
		// TODO Auto-generated method stub
		List<ReplyVO> list=replyDAO.replylist(b_num);
		return list;
	}


	@Override
	public int replyinsert(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return replyDAO.replyinsert(rvo);
	}
	

}
