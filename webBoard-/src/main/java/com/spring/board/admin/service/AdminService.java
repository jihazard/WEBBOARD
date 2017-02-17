package com.spring.board.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.admin.vo.CityVO;
import com.spring.board.admin.vo.MemberVO;

public interface AdminService {
	
	
	
	
	
	public List<MemberVO> memberlist(MemberVO mvo);
	public Map<String ,Integer>memberAgeList();
	
	
	public Map<String ,Integer>membersexlist();
	public Map<String, Integer>citylist();
	
	public List<CityVO>citylist2();

}
