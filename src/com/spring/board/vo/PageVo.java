package com.spring.board.vo;

public class PageVo {
   
   /* 한 페이지당 게시글 수 */
   private int pageSize = 10;
   
   /*한 블럭(range)당 페이지 수*/
   private int rangeSize = 10;
   
   /*현재 페이지*/
   private int curPage = 1;
   
   /*현재 블럭(range)*/
   private int curRange = 1;
   
   /*총 게시글 수*/
   private int listCnt;
   
   /*총 페이지 수*/
   private int pageCnt;
   
   /*총 블럭(range) 수*/
   private int rangeCnt;
   
   /*시작 페이지*/
   private int startPage = 1;
   
   /*끝 페이지*/
   private int endPage = 1;
   
   /*시작 index*/
   private int startIndex = 0;
   
   /*이전 페이지*/
   private int prevPage;
   
   /*다음 페이지*/
   private int nextPage;
   
   
   private int pageNo = 0;
   private String[] boardCate;
   private String searchType;
   private String[] searchKw;
   private String searchAO;
   private String boardType;
   private String[] codeId;
   

   public int getPageSize() {
      return pageSize;
   }

   public void setPageSize(int pageSize) {
      this.pageSize = pageSize;
   }

   public int getRangeSize() {
      return rangeSize;
   }

   public void setRangeSize(int rangeSize) {
      this.rangeSize = rangeSize;
   }

   public int getCurPage() {
      return curPage;
   }

   public void setCurPage(int curPage) {
      this.curPage = curPage;
   }

   public int getCurRange() {
      return curRange;
   }
   
   public void rangeSetting(int curPage) {
      
      setCurRange(curPage);
      this.startPage = (curRange-1)*rangeSize+1;
      this.endPage = startPage+rangeSize-1;
      
      if(endPage > pageCnt) {
         this.endPage = pageCnt;
      }
      
      this.prevPage=curPage-1;
      this.nextPage=curPage+1;
   }
   
   
   public void setCurRange(int curRange) {
      this.curRange = (int)((curPage-1)/rangeSize)+1;
   }

   public int getListCnt() {
      return listCnt;
   }

   public void setListCnt(int listCnt) {
      this.listCnt = listCnt;
   }

   public int getPageCnt() {
      return pageCnt;
   }

   public void setPageCnt(int pageCnt) {
      this.pageCnt = (int) Math.ceil(pageCnt*1.0/pageSize);
   }

   public int getRangeCnt() {
      return rangeCnt;
   }

   public void setRangeCnt(int rangeCnt) {
      this.rangeCnt = (int) Math.ceil(pageCnt*1.0/rangeSize);
   }

   public int getStartPage() {
      return startPage;
   }

   public void setStartPage(int startPage) {
      this.startPage = startPage;
   }

   public int getEndPage() {
      return endPage;
   }

   public void setEndPage(int endPage) {
      this.endPage = endPage;
   }

   public int getStartIndex() {
      return startIndex;
   }

   public void setStartIndex(int startIndex) {
      this.startIndex = (curPage-1) * pageSize;
   }

   public int getPrevPage() {
      return prevPage;
   }

   public void setPrevPage(int prevPage) {
      this.prevPage = prevPage;
   }

   public int getNextPage() {
      return nextPage;
   }

   public void setNextPage(int nextPage) {
      this.nextPage = nextPage;
   }

   public int getPageNo() {
      return pageNo;
   }

   public void setPageNo(int pageNo) {
      this.pageNo = pageNo;
   }
   
   public String getBoardType() {
      return boardType;
   }

   public void setBoardType(String boardType) {
      this.boardType = boardType;
   }

   public String[] getCodeId() {
      return codeId;
   }

   public void setCodeId(String[] codeId) {
      this.codeId = codeId;
   }
   

   public String[] getSearchKw() {
      return searchKw;
   }

   public void setSearchKw(String[] searchKw) {
      this.searchKw = searchKw;
   }

   public String getSearchType() {
      return searchType;
   }

   public void setSearchType(String searchType) {
      this.searchType = searchType;
   }

   public String getSearchAO() {
      return searchAO;
   }

   public void setSearchAO(String searchAO) {
      this.searchAO = searchAO;
   }

   public String[] getBoardCate() {
      return boardCate;
   }

   public void setBoardCate(String[] boardCate) {
      this.boardCate = boardCate;
   }

}