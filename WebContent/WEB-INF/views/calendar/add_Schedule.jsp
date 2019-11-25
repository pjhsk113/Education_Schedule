<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    }
    section {
          
        width: 75%;
        height:auto;
    }
    aside {
        background-color: goldenrod;
        width: 100px;
    }
    footer {
        height: 50px;
        background-color: blue;
        position: relatiev;
        clear: both;
    }
    article {
        width: 90%;
        margin: 20px;
    }
    table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  	th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
  .td_wid {
  	width: 100px; 
  }
  .txtBox {
  	width: 370px;
  }
  .btn{
  	float: right;;
  	margin-top: 20px;
  }
  
</style>
</head>
<body>
<div id="wapper">
        <section>
        	
            <article>
            <div>일정등록</div>
            <form class="add_Edu">
            <table>
            		<tr>
            			<td class="td_wid">지역</td>
            			<td>
            				<select name="scheduleCity" id="scheduleCity">
								<option value="서울">서울</option>            			
								<option value="부산">부산</option>            			
            				</select>
            			</td>
            		</tr>
            		<tr>
            			<td>과정명</td>
            			<td>
            				<select name="scheduleTitle" id="edu_name">
								<option value="넥사크로 17">넥사크로 17</option>            			
								<option value="넥사크로 14" >넥사크로 14</option>           			
								<option value="엑스플랫폼">엑스플랫폼</option>           			
            				</select>
            				<input type="text" size="30" name="scheduleTitle" id="edu_detail">
            			</td>
            		</tr>
            		<tr>
            			<td>과정날짜</td>
            			<td>
            				<input type="date" id="start_date" name="startDate"> ~
            				<input type="date" id="end_date" name="endDate">
            			</td>
            			
            		</tr>
            		<tr>
            			<td>과정시간</td>
            			<td>
            				<input type="time" id="start_time" name="startTime"> ~
            				<input type="time"  id="end_time" name="endTime">
            			</td>
            		</tr>
            		<tr>
            			<td>제한 인원</td>
            			<td>
            				<select name="perLimit" id="perLimit">
            				<c:forEach var="i" begin="1" end="40" step="1">
            					<option value="${i}"><c:out value="${i}"/></option>
            					</c:forEach>
            				</select>
            			</td>
            		</tr>
            	</table>
            	<a href="#" id="submit">작성</a>
            	<a href="edu_calendar.do">취소</a>
            	</form>
            	
            </article>
        </section>
    </div>
    
<script type="text/javascript">

	$j(document).ready(function(){
		
		$j("#submit").on("click",function(){
			var $frm = $j('.add_Edu :input');
			var param = $frm.serialize();
			
			$j.ajax({
			    url : "/calendar/addAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("일정이 등록되었습니다.");
					
					location.href = "/calendar/edu_calendar.do";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("등록 실패");
			    }
			});
		});
	});
</script>
</body>
</html>