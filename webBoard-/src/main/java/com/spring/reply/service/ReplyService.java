package com.spring.reply.service;

import java.util.List;

import com.spring.reply.vo.ReplyVO;

public interface ReplyService {
    public List<ReplyVO> replylist(int b_num);
    public int replyinsert(ReplyVO rvo);
}
