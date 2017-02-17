package com.spring.board.admin.dao;

import java.util.List;
import java.util.Map;

import com.spring.board.admin.vo.CityVO;
import com.spring.board.admin.vo.MemberVO;

public interface AdminDAO {
	
	public List<MemberVO> memberlist(MemberVO mvo);
	public Map<String ,Integer>memberAgeList();
	public Map<String ,Integer>membersexlist();
	public Map<String, Integer>citylist();
	
	public List<CityVO>citylist2();
}
