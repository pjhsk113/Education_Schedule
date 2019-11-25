package com.spring.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.RegisterVo;
import com.spring.board.vo.ScheduleVo;
import com.spring.common.CommonUtil;

@Controller
public class BoardController {

   @Autowired
   boardService boardService;

   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

   @RequestMapping(value = "/edboard/edBoardList.do", method = RequestMethod.GET)
   public String boardList(Locale locale, Model model, PageVo pageVo
         ,@RequestParam(value = "searchType", required = false) String searchType
         ,@RequestParam(value = "searchKw", required = false) String searchKw
         ,@RequestParam(value = "searchAO", required = false) String searchAO
         ) throws Exception {
   
      
      List<BoardVo> boardList = new ArrayList<BoardVo>();
      
      
        int pageNo = 1; 
        int totalCnt =0; 
        int pages=0;
        
      if (pageVo.getPageNo() != 0) {
           pageNo = pageVo.getPageNo();
      }
       
      pageVo.setPageNo(pageNo);
      
      boardList = boardService.SelectBoardList(pageVo, searchType, searchKw, searchAO);
      totalCnt = boardService.selectBoardCnt(pageVo, searchType, searchKw, searchAO);
      pages=(int)Math.ceil(totalCnt/10.0);
      
      model.addAttribute("boardList", boardList);
      model.addAttribute("searchType", searchType);
      model.addAttribute("searchAO", searchAO);
      model.addAttribute("searchKw", searchKw);
      model.addAttribute("totalCnt", totalCnt);

      model.addAttribute("pages", pages);
      model.addAttribute("pageNo", pageNo);
    
      return "edboard/edBoardList.page";
   }
   
   @RequestMapping(value = "/edboard/edBoardWrite.do", method = RequestMethod.GET)
   public String boardWrite(Locale locale, Model model) throws Exception{
      
      return "edboard/edBoardWrite";
   }
   
   @RequestMapping(value = "/edboard/edBoardWriteAction.do", method = RequestMethod.POST)
   @ResponseBody
   public String boardWriteAction(Locale locale,BoardVo boardVo) throws Exception{
      
      HashMap<String, String> result = new HashMap<String, String>();
      CommonUtil commonUtil = new CommonUtil();
      
      int resultCnt = boardService.boardInsert(boardVo);
      
      result.put("success", (resultCnt > 0)?"Y":"N");
      String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
      
      System.out.println("callbackMsg::"+callbackMsg);
      
      return callbackMsg;
   }
   
   @RequestMapping(value = "/edboard/{boardNo}/edBoardView.do", method = RequestMethod.GET)
   public String boardView(Locale locale, Model model
         ,@PathVariable("boardNo") int boardNo) throws Exception {

      BoardVo boardVo = new BoardVo();
      boardVo = boardService.selectBoard(boardNo);

      model.addAttribute("boardNo", boardNo);
      model.addAttribute("board", boardVo);

      
      return "edboard/edBoardView";
   }
   
   @RequestMapping(value = "/edboard/{boardNo}/edBoardUpdate.do", method = RequestMethod.GET)
   public String boardUpdate(Locale locale, Model model
         ,@PathVariable("boardNo") int boardNo) throws Exception {

      BoardVo boardVo = new BoardVo();

      boardVo = boardService.selectBoard(boardNo);

      model.addAttribute("boardNo", boardNo);
      model.addAttribute("board", boardVo);

      return "edboard/edBoardUpdate";
   }
   
   @RequestMapping(value = "/edboard/edBoardUpdateAction.do", method = RequestMethod.POST)
   @ResponseBody
   public String boardUpdateAction(Locale locale, BoardVo boardVo) throws Exception {

      HashMap<String, String> result = new HashMap<String, String>();
      CommonUtil commonUtil = new CommonUtil();

      int resultCnt = boardService.boardUpdate(boardVo);

      result.put("success", (resultCnt > 0) ? "Y" : "N");
      String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

      System.out.println("callbackMsg::" + callbackMsg);

      return callbackMsg;
   }

   @RequestMapping(value = "/edboard/{boardNo}/edBoardDelete.do", method = RequestMethod.GET)
   public String boardDelete(Locale locale, BoardVo boardVo, Model model
         ,@PathVariable("boardNo") int boardNo) throws Exception {

      model.addAttribute("boardNo", boardNo);

      boardService.boardDelete(boardVo);

      return "redirect:/edboard/edBoardList.do";
   }
   
   
   @RequestMapping(value = "/edboard/edBoardDelete.do", method = RequestMethod.POST)
   @ResponseBody
   public String boardDelete(Locale locale, Model model,BoardVo boardVo) throws Exception{
      
      HashMap<String, String> result = new HashMap<String, String>();
      CommonUtil commonUtil = new CommonUtil();
      
      int resultCnt = boardService.boardDelete(boardVo);
      
      result.put("success", (resultCnt > 0)?"Y":"N");
      String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
      
      System.out.println("callbackMsg::"+callbackMsg);
      
      return callbackMsg;
   }
}