package com.spring.board.vo;

public class BoardVo {
   
   private int    boardNo;
   private String    boardTitle;
   private String    boardComment;
   private String    creator;
   private String   createTime;
   private int    hits;
   private int    boardTop;
   
   public int getBoardNo() {
      return boardNo;
   }
   public void setBoardNo(int boardNo) {
      this.boardNo = boardNo;
   }
   public String getBoardTitle() {
      return boardTitle;
   }
   public void setBoardTitle(String boardTitle) {
      this.boardTitle = boardTitle;
   }
   public String getBoardComment() {
      return boardComment;
   }
   public void setBoardComment(String boardComment) {
      this.boardComment = boardComment;
   }
   public String getCreator() {
      return creator;
   }
   public void setCreator(String creator) {
      this.creator = creator;
   }
   public String getCreateTime() {
      return createTime;
   }
   public void setCreateTime(String createTime) {
      this.createTime = createTime;
   }
   public int getHits() {
      return hits;
   }
   public void setHits(int hits) {
      this.hits = hits;
   }
   public int getBoardTop() {
      return boardTop;
   }
   public void setBoardTop(int boardTop) {
      this.boardTop = boardTop;
   }

}