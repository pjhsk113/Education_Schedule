package com.spring.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.RegisterDao;
import com.spring.board.service.RegisterService;
import com.spring.board.vo.RegisterVo;
import com.spring.board.vo.ScheduleVo;

@Service
public class RegisterServiceImpl implements RegisterService{
	@Autowired
	RegisterDao registerDao;

	@Override
	public int userInfoInsert(RegisterVo registerVo) throws Exception {
		
		return registerDao.userInfoInsert(registerVo);
	}

	@Override
	public int updateApplyRegister(RegisterVo registerVo) throws Exception {
		// TODO Auto-generated method stub
		return registerDao.updateApplyRegister(registerVo);
	}

	@Override
	public int deleteApply(int registerIdx) throws Exception {
		// TODO Auto-generated method stub
		return registerDao.deleteApply(registerIdx);
	}


}
