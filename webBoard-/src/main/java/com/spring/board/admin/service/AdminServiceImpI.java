package com.spring.board.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.admin.dao.AdminDAO;
import com.spring.board.admin.vo.CityVO;
import com.spring.board.admin.vo.MemberVO;

@Service
@Transactional
public class AdminServiceImpI implements AdminService {

	@Autowired
	public AdminDAO adminDAO;
	
	@Override
	public List<MemberVO> memberlist(MemberVO mvo) {
		// TODO Auto-generated method stub
		List<MemberVO> list= adminDAO.memberlist(mvo);
		return list;
	}

	@Override
	public Map<String, Integer> memberAgeList() {
		// TODO Auto-generated method stub
		Map<String , Integer> ageList=null;
		ageList=adminDAO.memberAgeList();
		return ageList;
	}

	@Override
	public Map<String, Integer> membersexlist() {
		// TODO Auto-generated method stub
		Map<String , Integer> sexList=null;
		sexList=adminDAO.membersexlist();
		return sexList;
	}

	@Override
	public Map<String, Integer> citylist() {
		// TODO Auto-generated method stub
		Map<String , Integer> cityList=null;
		cityList=adminDAO.citylist();
		return cityList;
	}

	@Override
	public List<CityVO> citylist2() {
		// TODO Auto-generated method stub
		List<CityVO> list2= adminDAO.citylist2();
		return list2;
	}

}
