package com.spring.board.dao;

import java.util.List;

import com.spring.board.vo.RegisterVo;
import com.spring.board.vo.ScheduleVo;

public interface ScheduleDao {
	
	public List<ScheduleVo> selectScheduleList() throws Exception;
	
	public int scheduleInsert(ScheduleVo scheduleVo) throws Exception;

	public ScheduleVo selectSchedule(int scheduleNo) throws Exception;

	public int updateApplyCnt(int scheduleNo) throws Exception;

	public List<ScheduleVo> optionScheduleList(ScheduleVo scheduleVo) throws Exception;
	
	public List<RegisterVo> getApplyList(ScheduleVo scheduleVo) throws Exception;

//	public RegisterVo getUserInfo(RegisterVo registerVo) throws Exception;

	public RegisterVo getUserInfo(int registerIdx) throws Exception;
	
	public int CheckUserCnt(RegisterVo registerVo) throws Exception;

	
}
