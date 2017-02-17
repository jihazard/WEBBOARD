package com.spring.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.board.service.BoardService;
import com.spring.board.vo.BoardVO;
import com.spring.common.CommonVO;
import com.spring.common.Page.Paging;

@Controller
@RequestMapping(value="/board")
public class BoardContoller {

	Logger logger = Logger.getLogger(this.getClass());
	
	
	@Autowired
	public BoardService boardService;
	

	
	//보드 리스트 
	@RequestMapping(value="/boardlist.do" , method=RequestMethod.GET)
	public String boardlist(@ModelAttribute BoardVO bvo ,Model model){
		logger.info("글쓰기 list 호출");
		
		if(bvo.getOrder_by()==null)bvo.setOrder_by("b_num");
		if(bvo.getOrder_sc()==null)bvo.setOrder_sc("dsec");
		
		
		logger.info("오더 바이"+bvo.getOrder_by());
		logger.info("오더 에쓰시"+bvo.getOrder_sc());
		logger.info("${key.pagesize}"+bvo.getPagesize());
		
		Paging.setPage(bvo);
		
		//전체 레코드수 구현
		int total=boardService.boardListCnt(bvo);
		logger.info("토탈total"+total);
		
		logger.info("$start"+bvo.getStart_row()+"end"+bvo.getEnd_row());
		
	
		
		
			
		List<BoardVO> list=boardService.boardlist(bvo);
		
		model.addAttribute("total",total);
		model.addAttribute("data",list);
		model.addAttribute("key",bvo);
		
		
		return "board/boardlist";
				
	}
	
	//보드 라이터 페이지 
	@RequestMapping(value="/boardwriter.do")
	public String boardwriter(){
		logger.info("글쓰기 메뉴 호출");
		return "board/boardwriter";
	}
	
	//보드 라이터 인서트
	@RequestMapping(value="/boardinsert.do", method=RequestMethod.POST)
	public String boardinsert(@ModelAttribute BoardVO bvo , Model model){
		logger.info("글쓰기 insert 호출");
		int result=0;
		String url="";
		result=boardService.boardinsert(bvo);
	    if(result==1){
	    	url="/board/boardlist.do";
	    	
	    }
		return "redirect:"+url;
		
		
	}
	
	//보드 디테일
	@RequestMapping(value="/boarddetail.do", method=RequestMethod.GET)
	public String boarddetail(@ModelAttribute BoardVO bvo,Model model){
		logger.info("디테일 호출");
		
		BoardVO vo=boardService.boarddetail(bvo);
		boardService.hitmake(bvo);
		model.addAttribute("detail",vo);
		return "board/boarddetail";
		
	}
	
	//보드 삭제
	@RequestMapping(value="/boarddelete.do", method=RequestMethod.POST)
	public String boarddelete(@ModelAttribute BoardVO bvo){
		logger.info("보드 삭제 호출");
		
		int result=0;
		String url="";
		result=boardService.boarddelete(bvo);
		
		if(result==1){
			url="/board/boardlist.do";
			
		}
		
		return "redirect:"+url;
		
	}
	
	//보드 업데이트  폼
	@RequestMapping(value="/boardupdateform.do")
	public String boardupdateform(@ModelAttribute BoardVO bvo, Model model){
		
		logger.info("보드 업데이트 폼 ");
		
		
		String url="";
		BoardVO vo=boardService.boarddetail(bvo);
		
		model.addAttribute("detail" ,vo);
	    
	    return "board/boardupdate";
		
	}
	
	//보드 업데이트
	@RequestMapping(value="/boardupdate.do", method=RequestMethod.POST)
	public String boardupdate(@ModelAttribute BoardVO bvo , Model model){
		logger.info("보드 업데이트");
		
		String url="";
		int result=0;
		result=boardService.boardupdate(bvo);
		if(result==1){
			url="/board/boarddetail.do?b_num="+bvo.getB_num();
		}
		
		return 	"redirect:"+url;	
	}
}
