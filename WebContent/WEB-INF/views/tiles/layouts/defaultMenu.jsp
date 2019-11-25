<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
    html,body {
        text-align: center;
        color: #000000;
        width: 100%;
        height: 100%;
    }
    div#wapper {
        width: 100%;
        height: 100%;
        text-align: left;
        min-height: 300px;
        margin: 0 auto;
    }
    header, footer, nav, aside {
        border: 1px solid #999;
        margin: 5px;
        padding: 10px;
    }
    header {
        height: 50px;
        background-color: red;
    }
    nav, section, aside {
        float: left;
        height: 200px;
    }
    nav {
        background-color: #EAEAEA;
        width: 15%;
        height:100%;
           
    section {
        width: 75%;
        height:auto;
    }
    article {
        width: 90%;
        margin: 20px;
    }
</style>
        <nav>
          <h3>Education</h3>
          <ul>
              <li><a href="../edboard/edBoardList.do">교육공지</a></li>
              <li><a href="#">교육자료</a></li>
              <li><a href="../calendar/edu_calendar.do">교육일정</a></li>
              <li><a href="#">교육신청</a></li>
              <li><a href="../status/status_info.do">접수현황</a></li>
              <li><a href="#">교육관련FAQ</a></li>
              <li><a href="#">교육동영상</a></li>
          </ul>
    	</nav>
