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
<title>교육공지</title>
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
	#board_add_button {
		width: 100%;
		margin: 0 auto 15px;
	}
	#board_add_button .add_button {
		cursor: pointer;
		border: 1px solid #bebebe;
		position: absolute;
		right: 10px;
		top: 10px;
		width: 85px;
		padding: 6px 0 6px;
		text-align: center;
		font-weight: bold;
	}
	#board_add_button .add_button a {
		color: #ffffff;
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
		border-top: 3px solid #a1a1a1; 
		border-bottom: 1px solid #e5e5e5; 
		padding: 8px 0; 
		background: #faf9fa;
		}
		.list_table tbody td {
	/* 	text-align: center;  */
		border-bottom: 1px solid #e5e5e5;
		padding: 5px 0;
		}
		
	div#search_box {
     	border: 1px solid #e5e5e5;
     	text-align: center; 
        margin: 5px;
        padding: 8px 0;
    	width: 99%;
    	height: 5%;
	    background: #f0f0f0;
    }
    #search_box_table {
    	width:100%;
    }
    .button {
	    width:100px;
	    background-color: #293e61;
	    border: none;
	    color:#fff;
	    padding: 15px 0;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 15px;
	    margin: 4px;
	    cursor: pointer;
	}
	
</style>
</head>
<%-- <c:url var="edBoardListURL" value="/edboard/edBoardList"></c:url> --%>
<script>
$(document).ready(function(){
console.log("Type : "+$("#searchType").val());
console.log("Keyword : "+$("#searchKw").val());
console.log("And Or : "+$("#searchAO").val());
});
</script>

<body>
<p>교육공지</p>
	
	<section>
		<article>
		<div id="search_box">
		<form id="search" method="get">
		<table class="search_box_table">
		<thead>
		<tr>
			<td align="left" colspan="4">* 검색 시에 띄어쓰기를 하면 다중검색이 가능합니다.</td>
		</tr>
		
		<tr>
			<td>
				<select id="searchType" name="searchType">
				  <option value="title">제목</option>
				  <option value="content">내용</option>
				</select>
			</td>
			<td>
				<input type="text" id="searchKw" name="searchKw" size="50" />
			</td>
			<td>
				<select id="searchAO" name="searchAO">
					<option value="and">AND</option>
					<option value="or">OR</option>
				</select>
	        </td>
			<td>
				<input type="submit" value="search">
			</td>
		</tr>
		
		</thead>
		</table>
	</form>
	</div>
		</article>
	</section>
		
	<section>
		<article>
		<div class="board_list_table">
		
		<table class="list_table">
			<colgroup>
				<col width="10%" />
				<col width="60%" />
				<col width="20%" />
				<col width="10%" />
			</colgroup>
			
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${boardList}" var="list" varStatus="status">
					<tr>
					
						<td align="center">${list.boardNo }</td>
						<td align="left">
							<a href = "/edboard/${list.boardNo}/edBoardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
						</td>
						<td align="center">
							${list.createTime }
						</td>
						<td align="center">
							${list.hits }
						</td>
					</tr>
				</c:forEach>
			</tbody>
						
			<tr>
				<td></td>
				<td align="center">
					<c:forEach var="i" begin="1" end="${pages}">
						<a href="/edboard/edBoardList.do?pageNo=${i}">${i}</a>	
					</c:forEach>
				</td>
				<td></td>
				<td></td>
			</tr>
			
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td>
	            	<a href = "/edboard/edBoardWrite.do">Write</a>
	            </td>
            </tr>
			
		</table>
	</div>
		</article>
	</section>
	
	
</body>
</html>