package com.spring.board.dao;

import com.spring.board.vo.RegisterVo;

public interface RegisterDao {
	
	public int userInfoInsert(RegisterVo registerVo) throws Exception;

	public int updateApplyRegister(RegisterVo registerVo) throws Exception;

	public int deleteApply(int registerIdx) throws Exception;


}
