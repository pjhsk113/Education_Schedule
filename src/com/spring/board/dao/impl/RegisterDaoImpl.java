package com.spring.board.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.RegisterDao;
import com.spring.board.vo.RegisterVo;

@Repository
public class RegisterDaoImpl implements RegisterDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int userInfoInsert(RegisterVo registerVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("register.userInfoInsert", registerVo);
	}

	@Override
	public int updateApplyRegister(RegisterVo registerVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("register.updateApplyRegister", registerVo);
	}

	@Override
	public int deleteApply(int registerIdx) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("register.deleteApply", registerIdx);
	}

	

}
