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
<title>접수현황</title>
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
  
#board_add_button .board_list_add ul {
		width: 100%;
		overflow: hidden;
		height: 10px;
	}
		.board_list_table {
		width:100%;
		}
		.list_table {
		width:100%;
		}
		.list_table caption {
		display:none;
		}
		.list_table thead th {
				text-align: center; 
				border-top: 2px solid #a1a1a1;
				border-bottom: 1px solid #e5e5e5; 
				boarder-right : 0px;
				boarder-left : 0px;
				padding: 8px 0; 
				background: #e6f7f6;
				}
		.list_table tbody td {
		border-bottom: 1px solid #e5e5e5;
		padding: 5px 0;
		}

	#btn_group input{
	border : 1px solid #1f3b4d;
	background-color : #1f3b4d;
	color : white;
	padding : 5px 10px;
	}
	.list_table{
		text-align:center;
	}
	#popup{overflow:hidden; height:auto; display:block; border-radius:3px; box-shadow:0px 1px 1px #333; width:350px; z-index:100; position:absolute;  top:20%; left:10%;}
	#popup h4 a.close{float:right; padding-right:8px; color:#FFF; font-family:verdana}
.bgLayer {display:none;position:absolute; top:0; left:0; width:100%; height:100%; background:#000; opacity:.5; filter:alpha(opacity=50); z-index:8;}

</style>
</head>

<body>
	<div>
	<p>접수현황</p>
	<form class="radio_platform">
        <input type="radio"  name="scheduleTitle" id="nexacro17" value="넥사크로 17" >넥사크로 17
        <input type="radio"  name="scheduleTitle" id="nexacro14" value="넥사크로 14">넥사크로 14
        <input type="radio"  name="scheduleTitle" id="XPlatform" value="엑스플랫폼">엑스플랫폼
    </form>
    
	<section>
		<article>
		<div style="width:50%; float:left; margin:0px; overflow-y: scroll;" id="div-1">
		<table class="list_table">
			<colgroup>
				<col width="15%" />	
				<col width="25%" />
				<col width="45%" />
				<col width="15%" />
			</colgroup>
			
			<thead>
				<tr>
					<th>회차</th>
					<th>교육일자</th>
					<th>교육과정</th>
					<th>지역</th>
				</tr>
			</thead>
			</table>
		</div>
		
		<div style="width:50%; height:80%; float:left;" id="div-2">
			<table class="list_table">
			<colgroup>
				<col width="15%" />
				<col width="15%" />
				<col width="45%" />
				<col width="25%" />
			</colgroup>
			
			<thead>
				<tr>
					<th></th> 
					<th>No</th>
					<th>이름</th>
					<th>연락처</th>
				</tr>
			</thead>
			</table>
			
		</div>
		</article>
	</section>	
		
	</div>
	<div id="popup" style="position:absolute;  visibility:hidden;">
        <table>
            
        </table>
	</div>

<script type="text/javascript">
	$j(document).ready(function(){
		$j("input:radio[name=scheduleTitle]").click(function(){
			var $frm = $j('.radio_platform :input');
			var param = $frm.serialize();
			$j.ajax({
			    url : "/status/viewStatus.do",
			    dataType: "html",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
			    	$j("#div-1").html(data);
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("조회 실패");
			    }
			});
		});
	});
	$j(document.body).delegate('.tr_info', 'click', function() {
		var getId= $j(this).prop("id");
		$j.ajax({
		    url : "/status/viewApplyStatus.do",
		    dataType: "html",
		    type: "POST",
		    data : {scheduleNo : getId},
		    success: function(data, textStatus, jqXHR)
		    {
		    	$j("#div-2").html(data);
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	alert("조회 실패");
		    }
		});
		var values = null;
		$j(document.body).delegate("input[type='checkbox'][name='checkBox']",'click',function(){
			if($j(this).prop('checked')){
				$j("input[type='checkbox'][name='checkBox']").prop('checked',false);
				$j(this).prop('checked',true);
				values = $j(this).val();
			}
		});
		function popupOpen(){
			 var $layerPopupObj = $j('#popup');
			 var left = ( $j(window).scrollLeft() + ($j(window).width() - $layerPopupObj.width()) / 2 );
			 var top = ( $j(window).scrollTop() + ($j(window).height() - $layerPopupObj.height()) / 2 );
			 $layerPopupObj.css({'left':left,'top':top, 'position':'absolute'});
			 $j('body').css('position','relative').append($layerPopupObj);
		    if(document.all.popup.style.visibility=="hidden") {
		        document.all.popup.style.visibility="visible";
		        return false;
		    }
		}
		function bgLayerOpen() {
	        if(!$j('.bgLayer').length) {
	            $j('<div class="bgLayer"></div>').appendTo($j('body'));
	        }
	        var object = $j(".bgLayer");
	        var w = $j(document).width()+12;
	        var h = $j(document).height();
	        object.css({'width':w,'height':h}); 
	        object.fadeIn(200);   //생성되는 시간 설정
	    }

	    function bgLayerClear(){
	        var object = $j('.bgLayer');
	   		if(object.length) {
	        	object.fadeOut(200, function() {
	        	object.remove();
	    		});
	    	}
	   		document.all.popup.style.visibility="hidden";
	   		return false;   
	    }
		$j(document.body).delegate("#modify",'click',function(){
			if($j("input[type='checkbox'][name='checkBox']").is(":checked")==true){
				$j.ajax({
				    url : "/status/popup.do",
				    dataType: "html",
				    type: "POST",
				    data : {registerIdx : values},
				    success: function(data, textStatus, jqXHR)
				    {
				    	$j("#popup").html(data);
				    	popupOpen();
				    	bgLayerOpen();
				    	
				    },
				    error: function (jqXHR, textStatus, errorThrown)
				    {
				    	alert("조회 실패");
				    }
				});
			}
			$j(document.body).delegate("#cancel",'click',function(){
				bgLayerClear();
			});	
			$j(document.body).delegate("#confirm",'click',function(){
				var idx = $j("#registerIdx").val();
				var name = $j("#registerName").val();
				var phone1 = $j("#registerPhone1").val();
				var phone2 = $j("#registerPhone2").val();
				var phone3 = $j("#registerPhone3").val();
				var scheduleNo = $j("#scheduleNo").val();
				var $frm = phone1+','+phone2+','+phone3;
				var param = {registerIdx : idx, registerName : name, registerPhone: $frm};
				$j.ajax({
				    url : "/status/userCheck.do",
				    dataType: "json",
				    type: "POST",
				    data : param,
				    success: function(data, textStatus, jqXHR)
				    {
				    	if(data == 1){
				    		if(confirm('수정페이지로 이동하시겠습니까?')){
				    			location.href = "/apply/update_register.do?scheduleNo="+scheduleNo+"&registerIdx="+idx;	
				    		}else{
				    			return false;
				    		}
				    	}else{
				    		alert('번호가 틀렸습니다.');
				    		return false;
				    	}
				    },
				    error: function (jqXHR, textStatus, errorThrown)
				    {
				    	alert("조회 실패");
				    	
				    }
				});
			});
		});
	
		$j(document.body).delegate("#canceled",'click',function(){
			if($j("input[type='checkbox'][name='checkBox']").is(":checked")==true){
				$j.ajax({
				    url : "/status/popup.do",
				    dataType: "html",
				    type: "POST",
				    data : {registerIdx : values},
				    success: function(data, textStatus, jqXHR)
				    {
				    	$j("#popup").html(data);
				    	popupOpen();
				    	bgLayerOpen();
				    	
				    },
				    error: function (jqXHR, textStatus, errorThrown)
				    {
				    	alert("조회 실패");
				    }
				});
			}
			$j(document.body).delegate("#delete",'click',function(){
				var idx = $j("#registerIdx").val();
				var name = $j("#registerName").val();
				var phone1 = $j("#registerPhone1").val();
				var phone2 = $j("#registerPhone2").val();
				var phone3 = $j("#registerPhone3").val();
				var $frm = phone1+','+phone2+','+phone3;
				var param = {registerIdx : idx, registerName : name, registerPhone: $frm};
				$j.ajax({
				    url : "/status/userCheck.do",
				    dataType: "json",
				    type: "POST",
				    data : param,
				    success: function(data, textStatus, jqXHR)
				    {
				    	if(data == 1){
				    		if(confirm('삭제하신 일정은 복구가 불가능합니다. 삭제하시겠습니까?')){
				    			$j.ajax({
				    			    url : "/apply/applyDeleteOK.do?registerIdx="+idx,
				    			    dataType: "json",
				    			    type: "POST",
				    			    data : param,
				    			    success: function(data, textStatus, jqXHR)
				    			    {
				    			    	location.href="/status/status_info.do";
				    			    },
				    			    error: function (jqXHR, textStatus, errorThrown)
				    			    {
				    			    	alert("삭제 실패");
				    			    }
				    			});
				    		}else{
				    			return false;
				    		}
				    	}else{
				    		alert('번호가 틀렸습니다.');
				    		return false;
				    	}
				    },
				    error: function (jqXHR, textStatus, errorThrown)
				    {
				    	alert("조회 실패");
				    	
				    }
				});
			});
		});
			
	});
	
</script>
</body>
</html>