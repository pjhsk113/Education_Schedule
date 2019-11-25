<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
		<table id="popCont">
			<thead style="background-color:#333366;">
				<th colspan=2  style="color:#fff;">본인확인</th>
			</thead>
			<tbody style="background-color:#ffffff;">
				
				<tr>
            		<td>이름</td>
            		<td>
            		<input type="text" value="${fn:substring(userInfo.registerName,0,fn:length(userInfo.registerName)-1)}*" disabled>
            		<input type="hidden" value="${userInfo.registerName}" name="registerName" id="registerName">
            		<input type="hidden" value="${userInfo.registerIdx}" name="registerIdx" id="registerIdx">
            		<input type="hidden" value="${userInfo.scheduleNo}" name="scheduleNo" id="scheduleNo">
            		</td>
            	</tr>
            	<form class ="userCheck">
            	<tr>
            		<td>번호확인</td>
            		
            		<td>
            			<input type="text" size=4 name="registerPhone" id="registerPhone1" maxlength="4">-
            			<input type="text" size=4 name="registerPhone" id="registerPhone2" maxlength="4">-
            			<input type="text" size=4 name="registerPhone" id="registerPhone3" maxlength="4">
            		</td>
            		
            	</tr>
            	</form>
            	<tr colspan=2>
            		<td colspan=2>
            			<button id="confirm">확인</button>
            			<button id="delete">신청 취소</button>
            			<button id="cancel">취소</button>
            		</td>
            	</tr>
			</tbody>
        </table>
		