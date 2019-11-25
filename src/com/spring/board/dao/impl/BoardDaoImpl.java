package com.spring.board.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.BoardDao;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.RegisterVo;
import com.spring.board.vo.ScheduleVo;

@Repository
public class BoardDaoImpl implements BoardDao{
   
   @Autowired
   private SqlSession sqlSession;
   
   @Override
   public String selectTest() throws Exception {
      // TODO Auto-generated method stub
      
      String a = sqlSession.selectOne("board.boardList");
      
      return a;
   }
   
   @Override
   public List<BoardVo> selectBoardList(PageVo pageVo) throws Exception {
      // TODO Auto-generated method stub
      return sqlSession.selectList("board.boardList", pageVo);
   }
   
   
   @Override
   public int boardInsert(BoardVo boardVo) throws Exception {
      // TODO Auto-generated method stub
      return sqlSession.insert("board.boardInsert", boardVo);
   }
   
   @Override
   public BoardVo selectBoard(Integer boardNo) throws Exception {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("board.boardView", boardNo);
   }
   
   @Override
   public int boardUpdate(BoardVo boardVo) throws Exception { 
        // TODO Auto-generated method stub 
        return sqlSession.update("board.boardUpdate", boardVo); 

   }    
   
   @Override
   public int boardDelete(BoardVo boardVo) throws Exception {
      // TODO Auto-generated method stub
      return sqlSession.delete("board.boardDelete", boardVo);
   }
   
   @Override
   public int selectBoardCnt(PageVo pageVo) throws Exception {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("board.boardTotal", pageVo);
   }
   
   @Override
   public void boardHits(Integer boardNo) throws Exception {
      // TODO Auto-generated method stub
      sqlSession.update("board.boardHits", boardNo);
   }
   
   @Override
   public List<ScheduleVo> scheduleList(String scheduleTitle) throws Exception {
      // TODO Auto-generated method stub
      return sqlSession.selectList("board.scheduleList");
   }
   
   @Override
   public List<RegisterVo> registerList(int scheduleNo) throws Exception {
      // TODO Auto-generated method stub
      return sqlSession.selectList("board.registerList");
   }
}