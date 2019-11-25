package com.spring.board.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.ScheduleDao;
import com.spring.board.vo.RegisterVo;
import com.spring.board.vo.ScheduleVo;

@Repository
public class ScheduleDaoImpl implements ScheduleDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int scheduleInsert(ScheduleVo scheduleVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("schedule.scheduleInsert", scheduleVo);
	}

	@Override
	public List<ScheduleVo> selectScheduleList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("schedule.selectScheduleList");
	}

	@Override
	public ScheduleVo selectSchedule(int scheduleNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("schedule.selectSchedule", scheduleNo);
	}

	@Override
	public int updateApplyCnt(int scheduleNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("schedule.updateApplyCnt", scheduleNo);
	}

	@Override
	public List<ScheduleVo> optionScheduleList(ScheduleVo scheduleVo) throws Exception {
		
		return sqlSession.selectList("schedule.optionScheduleList", scheduleVo);
	}
	
	@Override
	public List<RegisterVo> getApplyList(ScheduleVo scheduleVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("schedule.getApplyList", scheduleVo);
	}

//	@Override
//	public RegisterVo getUserInfo(RegisterVo registerVo) throws Exception {
//		// TODO Auto-generated method stub
//		return sqlSession.selectOne("schedule.getUserInfo", registerVo);
//	}
	
	@Override
	public RegisterVo getUserInfo(int registerIdx) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("schedule.getUserInfo", registerIdx);
	}
	
	@Override
	public int CheckUserCnt(RegisterVo registerVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("schedule.CheckUserCnt", registerVo);
	}

	
}
