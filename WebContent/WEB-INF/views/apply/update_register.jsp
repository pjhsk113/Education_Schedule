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
  	width: 220px; 
  }
  .txtBox {
  	width: 370px;
  }
  .btn{
  	float: right;;
  	margin-top: 20px;
  }
  .div_header{
  	font-size:20px;
  	color:#0066CC;
  }
  
</style>
 
</head>
<body>
		<section>
            <div>교육신청</div>
            <article>
                <p>제품선택  기본정보입력  약관동의  신청확인</p>
            </article>
        </section>
        <section>        
        		<div class="div_header">과정정보</div>       	
            <article>
            	<table>
            		<tr>
            			<td class="td_wid">과정명</td>
            			<td>${fn:substring(schedule.scheduleTitle,0,fn:indexOf(schedule.scheduleTitle,','))} &emsp; 
            				${fn:substring(schedule.scheduleTitle,fn:indexOf(schedule.scheduleTitle,',')+1, fn:length(schedule.scheduleTitle))}
            				(${schedule.scheduleCity})
            			</td>
            		</tr>
            		<tr>
            			<td>교육일시</td>
            			<td>
            				${schedule.startDate} (${fn:substring(schedule.startTime,0,5)} ~${fn:substring(schedule.endTime,0,5)})
            			</td>
            		</tr>
            		<tr>
            			<td>신청현황</td>
            			<td>
            				(${schedule.perApply} / ${schedule.perLimit})
            			</td>
            		</tr>
            	</table>              
            </article>
        </section>
       <form class="register_edu">
        <section>       
        	<div class="div_header">신청자정보</div> 	
            <article>
             
            	<table>
            		<tr>
            			<td class="td_wid">이름</td>
            			<input type="hidden" value="${userInfo.registerIdx}" name="registerIdx">
            			<td><input type="text" class="txtBox" name="registerName" id="registerName" value="${userInfo.registerName}"></td>
            			
            		</tr>
            		<tr>
            			<td>휴대전화</td>
            			<td>
            				<select name="registerPhone" id="registerPhone1">
								<option value="010" >010</option>
							</select> -
							<input type="text" class="userPhNum" name="registerPhone" id="registerPhone2" minlength="4" maxlength="4"  size="16" value="${fn:substring(userInfo.registerPhone,4,8)}"> -
							<input type="text" class="userPhNum" name="registerPhone" id="registerPhone3" minlength="4" maxlength="4"   size="16" value="${fn:substring(userInfo.registerPhone,9,13)}">
            			</td>
            		</tr>
            		<tr>
            			<td class="td_wid">이메일</td>
            			<td>
            				<input type="text" name="registerEmail" id="userEmail_Id" value="${fn:substring(userInfo.registerEmail,0,fn:indexOf(userInfo.registerEmail,','))}"> @
							<input type="text" name="registerEmail" id="userEmail_Domain" value="${fn:substring(userInfo.registerEmail,fn:indexOf(userInfo.registerEmail,',')+1,fn:length(userInfo.registerEmail))}">            			
            			</td>
            		</tr>
            	</table>
            	             
            </article>
        </section>
        <section>        
        	<div class="div_header">소속정보</div>       	
            <article>
            	<table>
            		<tr>
            			<td class="td_wid">회사명</td>
            			<td><input type="text" class="txtBox" name="registerCompany" id="registerCompany" value="${userInfo.registerCompany}"></td>
            		</tr>
            		<tr>
            			<td>부서명</td>
            			<td>
							<input type="text" class="txtBox" name="registerDepartment" id="registerDepartment" value="${userInfo.registerDepartment}">
            			</td>
            		</tr>
            		<tr>
            			<td class="td_wid">직급</td>
            			<td>
            				<input type="text" class="txtBox" name="registerRank" id="registerRank" value="${userInfo.registerRank}">       			
            			</td>
            		</tr>
            	</table>              
            </article>
        </section>
        <section>        
        	<div class="div_header">신청세부사항</div>       	
            <article>
            	<table>
            		<tr>
            			<td class="td_wid">신청동기</td>
            			<td>
            				<input type="radio" name="registerReason" value="해당제품 관련 프로젝트 투입">해당제품 관련 프로젝트 투입
            				<input type="radio" name="registerReason" value="제품구매를 위한 검토 과정">제품구매를 위한 검토 과정
            				<input type="radio" name="registerReason" value="시스템운영 또는 유지보수">시스템운영 또는 유지보수<br/>
            				<input type="radio" name="registerReason" id="etc" value="기타">기타 
            				<input type="text" style="width:90%;" name="registerReason" id="userReason_etc" disabled>
            			</td>
            		</tr>
            		<tr>
            			<td>교육관련문의사항</td>
            			<td>
							<textarea style="width:97%;" name="registerQuestions" value="${userInfo.registerQuestions}"></textarea>
            			</td>
            		</tr>
            	</table>
            	<div class="btn">
            		<button type="button" id="prev">이전</button>
       				<button type="button" id="next">신청</button>
            	</div>
            	           
            </article>
        </section>
        </form>
<script type="text/javascript">

	$j(document).ready(function(){
		$j("#prev").on("click",function(){
			location.href = "/status/status_info.do";
		});
		$j("input:radio[name=registerReason]").click(function(){
			var check = $j('#etc').is(':checked');
			if (check){
				$j("#userReason_etc").attr("disabled",false);
			}else{
				$j("#userReason_etc").val('');
				$j("#userReason_etc").attr("disabled",true);
			}
		});
		
		$j("#registerName").on("keyup", function() {
			$j(this).val($j(this).val().replace(/[^a-zA-Z|\uac00-\ud7a3]/g,""));
		});
		$j(".userPhNum").on("keyup", function() {
			$j(this).val($j(this).val().replace(/[^0-9]/g,""));
		});
		$j("#userEmail_Id").on("keyup", function() {
			$j(this).val($j(this).val().replace(/[^a-zA-Z0-9|_-]/g,""));
		});
		$j("#userEmail_Domain").on("keyup", function() {
			$j(this).val($j(this).val().replace(/[^a-zA-Z|.]/g,""));
		});
		$j("#registerCompany").on("keyup", function() {
			$j(this).val($j(this).val().replace(/[^a-zA-Z0-9|\uac00-\ud7a3]/g,""));
		});
		
		$j("#next").on("click",function(){
			var Ph2Val = $j("#registerPhone2").val();
			var Ph3Val = $j("#registerPhone3").val();
			var NameVal = $j("#registerName").val();
			var Email_id = $j("#userEmail_Id").val();
			var Email_domain = $j("#userEmail_Domain").val();
			
			if(NameVal==null || NameVal==""){
				alert("이름을 입력하세요.");
				$j("#registerName").focus();
				return false;
			}else if(NameVal.length > 7){
				alert("이름은 7자 이하로만 등록 가능합니다.");
				$j("#registerName").focus();
				return false;
			}
			
			if((Ph2Val==null || Ph2Val=="") || Ph2Val.length < 4){
				alert("중간번호를 입력하세요.");
				$j("#registerPhone2").focus();
				return false;
			}else if((Ph3Val==null || Ph3Val=="") || Ph3Val.length < 4){
				alert("끝번호를 입력하세요.");
				$j("#registerPhone3").focus();
				return false;
			}
			
			if((Email_id==null || Email_id=="") || Email_id.length < 3){
				alert("이메일을 입력하세요.");
				$j("#userEmail_Id").focus();
				return false;
			}else if((Email_domain==null || Email_domain=="") || Email_domain.length < 7){
				alert("이메일을 입력하세요.");
				$j("#userEmail_Domain").focus();
				return false;
			}else if((Email_domain.length > 30)){
				alert("이메일 주소가 너무 깁니다.");
				$j("#userEmail_Domain").focus();
				return false;
			}else if((Email_id.length > 30)){
				alert("이메일 주소가 너무 깁니다.");
				$j("#userEmail_Id").focus();
				return false;
			}
			
			if ($j('#etc').is(':checked')){
				var check_value = $j("#userReason_etc").val();
				if (check_value =='' || check_value==null){
					alert("신청동기를 써주세요.");
					$j("#userReason_etc").focus();
					return false;
				}
			}
			var $frm = $j('.register_edu :input');
			var param = $frm.serialize();
			
			$j.ajax({
			    url : "/apply/applyUdateOK.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("수정되었습니다. ");
					
					location.href = "/status/status_info.do";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("수정 실패");
			    }
			});
		});
	});
</script>
</body>
</html>
