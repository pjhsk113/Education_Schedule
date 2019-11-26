package com.spring.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.ScheduleDao;
import com.spring.board.service.ScheduleService;
import com.spring.board.vo.RegisterVo;
import com.spring.board.vo.ScheduleVo;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	@Autowired
	ScheduleDao scheduleDao;
	
	@Override
	public int scheduleInsert(ScheduleVo scheduleVo) throws Exception {
		
		return scheduleDao.scheduleInsert(scheduleVo);
	}

	@Override
	public List<ScheduleVo> selectScheduleList() throws Exception {
		// TODO Auto-generated method stub
		return scheduleDao.selectScheduleList();
	}

	@Override
	public ScheduleVo selectSchedule(int scheduleNo) throws Exception {
		// TODO Auto-generated method stub
		return scheduleDao.selectSchedule(scheduleNo);
	}

	@Override
	public int updateApplyCnt(int scheduleNo) throws Exception {
		// TODO Auto-generated method stub
		return scheduleDao.updateApplyCnt(scheduleNo);
	}

	@Override
	public List<ScheduleVo> optionScheduleList(ScheduleVo scheduleVo) throws Exception {
		// TODO Auto-generated method stub
		return scheduleDao.optionScheduleList(scheduleVo);
	}
	@Override
	public List<RegisterVo> getApplyList(ScheduleVo scheduleVo) throws Exception {
		// TODO Auto-generated method stub
		return scheduleDao.getApplyList(scheduleVo);
	}

	@Override
	public RegisterVo getUserInfo(int registerIdx) throws Exception{
		// TODO Auto-generated method stub
		return scheduleDao.getUserInfo(registerIdx);
	}

	@Override
	public int CheckUserCnt(RegisterVo registerVo) throws Exception {
		
		return scheduleDao.CheckUserCnt(registerVo);
	}



}
