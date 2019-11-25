<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			
			<tbody>
				<c:choose>
						<c:when test="${empty registerList}">
						<tr>
							<td></td>
							<td></td>
							<td>조회된 결과가 없습니다.</td>
							<td></td>
						</tr>
						</c:when>
						<c:otherwise>
						<c:forEach var='item' items="${registerList}" varStatus="status">
						<tr>
							<td><input type="checkbox" name="checkBox" id="checkBox${item.registerIdx}"value="${item.registerIdx}"></td>
							<td>${status.count}</td>
							<td>${fn:substring(item.registerName,0,fn:length(item.registerName)-1)}*</td>
							<td>${fn:replace(item.registerPhone,fn:substring(item.registerPhone,0,10),'***-***-*')}</td>
						</tr>
						</c:forEach>
						</c:otherwise>
				</c:choose>
			</tbody>
			</table>
			<div align="center">
				<div id="btn_group">
					<input type="button" id="modify" value="수정">
					<input type="button" id="canceled" value="취소">
				</div>
			</div>	