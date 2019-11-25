<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<table id="table-1" class="list_table">
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
			
			<tbody id="tbody_add">
				<c:forEach var='item' items="${scheduleList}">
					<tr class="tr_info" id="${item.scheduleNo}">
						<td>${item.scheduleNo}</td>
						<td>${item.startDate}</td>
						<td>${fn:substring(item.scheduleTitle,fn:indexOf(item.scheduleTitle,',')+1, fn:length(item.scheduleTitle))}</td>
						<td>${item.scheduleCity}</td>
					</tr>	
				</c:forEach>
			</tbody>
			
			</table>
			