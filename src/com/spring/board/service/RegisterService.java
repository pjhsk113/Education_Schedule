package com.spring.board.service;

import com.spring.board.vo.RegisterVo;

public interface RegisterService {
	
	public int userInfoInsert(RegisterVo registerVo) throws Exception;

	public int updateApplyRegister(RegisterVo registerVo) throws Exception;

	public int deleteApply(int registerIdx) throws Exception;
	
}
