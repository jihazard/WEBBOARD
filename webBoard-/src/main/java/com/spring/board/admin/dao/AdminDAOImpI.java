package com.spring.board.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.admin.vo.CityVO;
import com.spring.board.admin.vo.MemberVO;
@Repository
public class AdminDAOImpI implements AdminDAO{

	@Autowired
	public SqlSession session; 
	
	@Override
	public List<MemberVO> memberlist(MemberVO mvo) {
		// TODO Auto-generated method stub
		return session.selectList("memberlist");
	}

	@Override
	public Map<String, Integer> memberAgeList() {
		// TODO Auto-generated method stub
		return session.selectMap("memberAgeList","");
	}

	@Override
	public Map<String, Integer> membersexlist() {
		// TODO Auto-generated method stub
		return session.selectMap("membersexlist","");
	}

	@Override
	public Map<String, Integer> citylist() {
		// TODO Auto-generated method stub
		return session.selectMap("citylist","");
	}

	@Override
	public List<CityVO> citylist2() {
		// TODO Auto-generated method stub
		return session.selectOne("citylist2");
	}

}
