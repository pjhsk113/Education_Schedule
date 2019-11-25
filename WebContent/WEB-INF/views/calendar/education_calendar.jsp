<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<meta content="text/html; charset=euc-kr">
<title>HTML5</title>
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
    article {
        width: 90%;
        margin: 20px;
    }
    #calendar {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  	}
  	th{
    border-bottom: 1px solid #444444;
    padding: 10px;
    text-align: center;
  }
  	td{
  	border: 1px solid #444444;
  	padding: 5px;
  	width:240px;
  	height:120px;
  	vertical-align: top;
    padding-right: 0px;
    padding-left: 0px;
  	
  }
  .td_wid {
  	width: 220px; 
  }
  .txtBox {
  	width: 370px;
  }
  .btn{
  	float: right;;
  	margin-top: 20px;
  }
  .inner_content{
  	border: none;
  	width : 100%;
  	border-spacing:0px;
  }
  .div_content{
  	margin-bottom: 7px;
  	height:70px;
  	color:#FFFFFF;
  }
  a {
  	text-decoration:none;
  }
</style>
 <script type="text/javascript" >
    var today = new Date();//오늘 날짜
    function buildCalendar(){
      var nMonth = new Date(today.getFullYear(),today.getMonth(),1);// 이번달의 첫번째날
      var lastDate =new Date(today.getFullYear(),today.getMonth()+1,0);//이번달의 마지막날
      var tblCalendar =document.getElementById("calendar");    //테이블 달력을 만드는 테이블
      var lastDay = lastDate.getDay();
      //기존에 테이블에 잇던 달력 내용 삭제
      while(tblCalendar.rows.length>1){
        tblCalendar.deleteRow(tblCalendar.rows.length -1);
      }
      var row = null;
      row =tblCalendar.insertRow();
      var cnt =0;
      // 1일이 시작되는 칸을 맞추어줌

      for ( i=0; i <nMonth.getDay(); i++) {
        cell =row.insertCell();
        cnt = cnt + 1;
    	}
      //달력 출력
      for(i=1; i<=lastDate.getDate(); i++){
        cell =row.insertCell();
        cell.innerHTML= i+"<table class='inner_content'>"+"<tr id="+today.getFullYear()+'-'+ (today.getMonth()+1)+'-'+('0' + i).slice(-2)+">"+"</tr>"+"</table>";
        cnt = cnt + 1;
        if (cnt%7 == 0){
        	row = calendar.insertRow();	
        }
      }
      if(lastDay != 6){
      	for(i=0; i<6-lastDay;i++)
      		cell=row.insertCell();
      }
      var startList = new Array();
      var endList = new Array();
      var city = new Array();
      var content = new Array();
      var schedule_no = new Array();
      
      // 스케줄 List 가져옴
      <c:forEach var="item" items="${scheduleList}" >
      	startList.push("${item.startDate}");
      	city.push("${item.scheduleCity}");
      	content.push("${item.scheduleTitle}");
      	endList.push("${item.endDate}");
      	schedule_no.push("${item.scheduleNo}");
      </c:forEach>

      $j(document).ready(function(){
    	  var color1 = '#FFBB00';
    	  var color2 = '#6B66FF';
    	  var color3 = '#47C83E';
    		for (i=0; i<startList.length;i++){
    			var temp_id = startList[i];
    			var temp_city = city[i];
    			var temp_content = content[i];
    			var temp_end = endList[i];
    			var temp_no = schedule_no[i];
    			var end = Number(temp_end.slice(-2));
    			var st = Number(temp_id.slice(-2));
    			var insert_html1 ="<a href='../apply/apply_register.do?scheduleNo="+temp_no+"'>"+"<div class='div_content' style='background-color:";
    			var insert_html2 ="<a href='../apply/apply_register.do?scheduleNo="+temp_no+"'>"+"<div class='div_content' style='background-color:";
    			
    			if (temp_content.match('14,') == '14,'){
    				insert_html1 = insert_html1 + color1+";'"+">"+' '+"</div></a>";
    				for(j=st+1;j<=end;j++){
        				$j("#"+temp_id.slice(0,-3)+'-'+('0' + j).slice(-2)).append(insert_html1);
        			}
    				insert_html2 = insert_html2 + color1+";'"+">"+"["+temp_city+"]"+temp_content+"</div></a>";
    				$j("#"+temp_id).append(insert_html2);
    				
    			}else if(temp_content.match('17,') == '17,'){
    				insert_html1 = insert_html1 + color2+";'"+">"+' '+"</div></a>";
    				for(j=st+1;j<=end;j++){
        				$j("#"+temp_id.slice(0,-3)+'-'+('0' + j).slice(-2)).append(insert_html1);
        			}
    				insert_html2 = insert_html2 + color2+";'"+">"+"["+temp_city+"]"+temp_content+"</div></a>";
    				$j("#"+temp_id).append(insert_html2);
    				
    			}else{
    				insert_html1 = insert_html1 + color3+";'"+">"+' '+"</div></a>";
    				for(j=st+1;j<=end;j++){
        				$j("#"+temp_id.slice(0,-3)+'-'+('0' + j).slice(-2)).append(insert_html1);
        			}
    				insert_html2 = insert_html2 + color3+";'"+">"+"["+temp_city+"]"+temp_content+"</div></a>";
    				$j("#"+temp_id).append(insert_html2);
    			}
    		}
    	});
    }
</script>
</head>
<body>
	<section>
		<article>
		 <div>교육일정</div>
            <div style="text-align:center;">
            	<input type="button" value="<" onclick="prevClaendar()">
            	<span id="cal_ym" style="font-size:30px;"></span>
            	<input type="button" value=">" onclick="nextCalendar()">
            	
            </div>
            <a href="add.do"><button >일정추가</button></a>
            <table id="calendar">
            	<tr>
            		<th>SUN</th>
            		<th>MON</th>
            		<th>TUE</th>
            		<th>WED</th>
            		<th>THU</th>
            		<th>FRI</th>
            		<th>SAT</th>
            	</tr>
            </table>
                <script type="text/javascript">
					buildCalendar();
				</script>
		</article>
	</section>
          
 <script type="text/javascript">

 var today = new Date();
document.getElementById("cal_ym").innerHTML = today.getFullYear()+"년"+ (today.getMonth()+1)+"월";

function prevClaendar(){//이전 달력
  today = new Date(today.getFullYear(), today.getMonth()-1,today.getDate());
  document.getElementById("cal_ym").innerHTML = today.getFullYear()+"년"+ (today.getMonth()+1)+"월";
  buildCalendar();
}
//다음 달력을 뿌려줌
function nextCalendar(){
  today = new Date(today.getFullYear(), today.getMonth()+1,today.getDate());
  document.getElementById("cal_ym").innerHTML = today.getFullYear()+"년"+ (today.getMonth()+1)+"월";
  buildCalendar();

}

</script> 
</body>
</html>
