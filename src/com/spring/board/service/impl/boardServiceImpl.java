package com.spring.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.dao.BoardDao;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.RegisterVo;
import com.spring.board.vo.ScheduleVo;

@Service
public class boardServiceImpl implements boardService{
   
   @Autowired
   BoardDao boardDao;
   
   @Override
   public String selectTest() throws Exception {
      // TODO Auto-generated method stub
      return boardDao.selectTest();
   }


   @Override
   public List<BoardVo> SelectBoardList(PageVo pageVo
         , String searchType
         , String searchKw
         , String searchAO) throws Exception {
      // TODO Auto-generated method stub
      
      List<BoardVo> boardList = null;
      
      
      if(searchKw!=null) {
      
         String[] searchKwList = searchKw.split("\\s+");
         
         for (int i=0; i<searchKwList.length; i++) {
                     
               pageVo.setSearchKw(searchKwList);
               boardList=boardDao.selectBoardList(pageVo);
            }
         
      } else {
         boardList=boardDao.selectBoardList(pageVo);
      }
      return boardList;
   }
   
   @Override
   public int boardInsert(BoardVo boardVo) throws Exception {
      // TODO Auto-generated method stub
      return boardDao.boardInsert(boardVo);
   }
   
   @Transactional(isolation = Isolation.READ_COMMITTED)
   @Override
   public BoardVo selectBoard(Integer boardNo) throws Exception {
      // TODO Auto-generated method stub
      BoardVo boardVo = new BoardVo();
      
      boardVo.setBoardNo(boardNo);
      boardDao.boardHits(boardNo);
      return boardDao.selectBoard(boardNo);
   }
   

   @Override public int boardUpdate(BoardVo boardVo) throws Exception { 
        // TODO Auto-generated method stub
     
     return boardDao.boardUpdate(boardVo); 
    }
    
   
   @Override
   public int boardDelete(BoardVo boardVo) throws Exception {
      // TODO Auto-generated method stub

      return boardDao.boardDelete(boardVo);
   }
   
   @Override
   public int selectBoardCnt(PageVo pageVo
         , String searchType
         , String searchKw
         , String searchAO) throws Exception {
      // TODO Auto-generated method stub
      
      int boardCnt = 0;
      if(searchKw!=null) {
         String[] searchKwList = searchKw.split("\\s+");
         for (int i=0; i<searchKwList.length; i++) {
               pageVo.setSearchKw(searchKwList);
               boardCnt=boardDao.selectBoardCnt(pageVo);
            }
      } else {
         boardCnt=boardDao.selectBoardCnt(pageVo);
      }
      return boardDao.selectBoardCnt(pageVo);
   }

   @Override
   public void boardHits(int boardNo) throws Exception {
      // TODO Auto-generated method stub
   }
   
   @Override
   public List<ScheduleVo> scheduleList(ScheduleVo scheduleVo, String scheduleTitle) throws Exception{
      // TODO Auto-generated method stub
      List<ScheduleVo> scheduleList = null;
      
      if(scheduleTitle!=null) {
      
      scheduleVo.setScheduleTitle(scheduleTitle);
      scheduleList=boardDao.scheduleList(scheduleTitle);
      
      } else {
         scheduleList=boardDao.scheduleList(scheduleTitle);
      }
         
      return scheduleList;
   }
   
   @Override
   public List<RegisterVo> registerList(RegisterVo registerVo, int scheduleNo) throws Exception{
      // TODO Auto-generated method stub
      
      List<RegisterVo> registerList = null;
      
      if(scheduleNo != 0) {
      registerVo.setScheduleNo(scheduleNo);
      registerList=boardDao.registerList(scheduleNo);
      } else {
         registerList=boardDao.registerList(scheduleNo);
      }
      
      return registerList;
      
   }
}