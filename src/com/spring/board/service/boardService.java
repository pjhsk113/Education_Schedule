package com.spring.board.service;

import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.RegisterVo;
import com.spring.board.vo.ScheduleVo;

public interface boardService {

   public String selectTest() throws Exception;

   public List<BoardVo> SelectBoardList(PageVo pageVo
                              , String searchType
                              , String searchKw
                              , String searchAO) throws Exception;

   public int boardInsert(BoardVo boardVo) throws Exception;
   
   public BoardVo selectBoard(Integer boardNo) throws Exception;
   
   public int boardUpdate(BoardVo boardVo) throws Exception; 
   
   public int boardDelete(BoardVo boardVo) throws Exception;
   
   public int selectBoardCnt(PageVo pageVo
         , String searchType
         , String searchKw
         , String searchAO) throws Exception;
   
   public void boardHits(int boardNo) throws Exception;
   
   public List<ScheduleVo> scheduleList(ScheduleVo scheduleVo, String scheduleTitle) throws Exception;
   
   public List<RegisterVo> registerList(RegisterVo registerVo, int scheduleNo) throws Exception;
   
}