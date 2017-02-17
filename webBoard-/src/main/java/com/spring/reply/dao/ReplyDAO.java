package com.spring.reply.dao;

import java.util.List;

import com.spring.reply.vo.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> replylist(int b_num);
	public int replyinsert(ReplyVO rvo);

}
