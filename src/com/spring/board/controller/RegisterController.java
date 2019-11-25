package com.spring.board.controller;

import java.util.HashMap;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.HomeController;
import com.spring.board.service.RegisterService;
import com.spring.board.service.ScheduleService;
import com.spring.board.vo.RegisterVo;
import com.spring.board.vo.ScheduleVo;
import com.spring.common.CommonUtil;

@Controller
public class RegisterController {
	@Autowired
	ScheduleService scheduleService;
	
	@Autowired
	RegisterService registerService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/apply/apply_register.do", method = RequestMethod.GET)
	public String applyList(Locale locale, Model model
			,@RequestParam("scheduleNo") int scheduleNo) throws Exception{

		ScheduleVo scheduleVo = new ScheduleVo();
		RegisterVo registerVo = new RegisterVo();
		
		int updateCnt = scheduleService.updateApplyCnt(scheduleNo);
		scheduleVo = scheduleService.selectSchedule(scheduleNo);
		

		model.addAttribute("schedule", scheduleVo);
		return "apply/apply_register";
	}
	
	@RequestMapping(value = "/apply/applyOK.do", method = RequestMethod.POST)
	@ResponseBody
	public String applyAction(Locale locale, RegisterVo registerVo) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = registerService.userInfoInsert(registerVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/apply/update_register.do", method = RequestMethod.GET)
	public String applyUpdateList(Locale locale, Model model
			,@RequestParam("scheduleNo") int scheduleNo
			,@RequestParam("registerIdx") int registerIdx) throws Exception{

		ScheduleVo scheduleVo = new ScheduleVo();
		RegisterVo userInfo = new RegisterVo();
		
		
		int result=0;
		
		scheduleVo = scheduleService.selectSchedule(scheduleNo);
//		int updateCnt = scheduleService.updateApplyCnt(scheduleNo);
		userInfo = scheduleService.getUserInfo(registerIdx);
		
		model.addAttribute("userInfo",userInfo);
		model.addAttribute("schedule", scheduleVo);
		return "apply/update_register";
	}
	
	@RequestMapping(value = "/apply/applyUdateOK.do", method = RequestMethod.POST)
	@ResponseBody
	public String applyUpdateAction(Locale locale, RegisterVo registerVo) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = registerService.updateApplyRegister(registerVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/apply/applyDeleteOK.do", method = RequestMethod.POST)
	@ResponseBody
	public String applyDeleteAction(Locale locale, int registerIdx) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = registerService.deleteApply(registerIdx);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
}
