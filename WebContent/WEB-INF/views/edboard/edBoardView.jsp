<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>교육공지 상세</title>
</head>
<script type="text/javascript">

$j(document).ready(function(){
	
	$j("#submit").on("click",function(){
		var $frm = $j('.boardDelete :input');
		var param = $frm.serialize();
		
		$j.ajax({
		    url : "/edboard/edBoardDelete.do",
		    dataType: "json",
		    type: "POST",
		    data : param,
		    success: function(data, textStatus, jqXHR)
		    {
				alert("삭제완료");
				
				alert("메세지:"+data.success);
				
				location.href = "/edboard/edBoardList.do?pageNo=1";
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	alert("삭제실패");
		    }
		});
	});
});

</script>
<body>
<section>
	<article>
	<div>
<table align="center">

	<tr>
		<td>

			<table border ="1">
				<tr>
					<td width="120" align="center">
					Title
					</td>
					<td width="400">
					${board.boardTitle}
					</td>
				</tr>
				<tr>
					<td height="300" align="center">
					Comment
					</td>
					<td>
					${board.boardComment}
					</td>
				</tr>
				<tr>
					<td align="center">
					Writer
					</td>
					<td>
					${board.creator }
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href="/edboard/edBoardList.do">List</a>
			<a href="/edboard/${boardNo}/edBoardUpdate.do">Update</a>
		</td>
	</tr>
	

</table>
	

<form class="boardDelete">
	<input name="boardNo" type="hidden" value="${boardNo}">
	<table align="center">
		<tr>
			<td align="right">
				<input id="submit" type="button" value="삭제">
			</td>
		</tr>
	</table>
</form>
	</article>
</section>

</div>
</body>
</html>