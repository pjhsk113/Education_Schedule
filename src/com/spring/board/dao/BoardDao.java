package com.spring.board.dao;

import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.RegisterVo;
import com.spring.board.vo.ScheduleVo;

public interface BoardDao {

   public String selectTest() throws Exception;

   public List<BoardVo> selectBoardList(PageVo pageVo) throws Exception;
   
   public int boardInsert(BoardVo boardVo) throws Exception; 
   
   public BoardVo selectBoard(Integer boardNo) throws Exception;
   
   public int boardUpdate(BoardVo boardVo) throws Exception;
    
   public int boardDelete(BoardVo boardVo) throws Exception;

   public int selectBoardCnt(PageVo pageVo) throws Exception;
   
   public void boardHits(Integer boardNo) throws Exception;
   
   public List<ScheduleVo> scheduleList(String scheduleTitle) throws Exception;
   
   public List<RegisterVo> registerList(int scheduleNo) throws Exception;
}