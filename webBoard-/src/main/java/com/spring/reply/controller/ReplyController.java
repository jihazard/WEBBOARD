package com.spring.reply.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.reply.service.ReplyService;
import com.spring.reply.vo.ReplyVO;

@RestController
@RequestMapping(value="/replies")
public class ReplyController {
	Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	public ReplyService replyService;
	
	//리플 리스트 호출
	@RequestMapping(value="/all/{b_num}.do",method=RequestMethod.GET )
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("b_num")Integer b_num ){
		
		logger.info("리플 리스트 호출");
		ResponseEntity<List<ReplyVO>> entity=null;
		
		try {
			entity=new ResponseEntity<List<ReplyVO>>(replyService.replylist(b_num),HttpStatus.OK);
			
			
		} catch (Exception e) {
			// TODO: handle exception
			entity=new ResponseEntity<List<ReplyVO>>(HttpStatus.OK);
		}
		return entity; 
		
	}
	
	//리플 인서트 호출
	@RequestMapping(value="/replyinsert.do" ,method=RequestMethod.POST)
	public ResponseEntity<String> replyinsert(@RequestBody ReplyVO rvo) {
		
		logger.info(rvo.getB_num()+rvo.getR_content()+rvo.getR_pwd());
		
		ResponseEntity<String> entity=null;
		int result=0;
		result=replyService.replyinsert(rvo);
		
		try {
			
			if(result==1){
				entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
	
}
