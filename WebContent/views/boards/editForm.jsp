<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 수정</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
	function file_delete() {
		document.f.file2.value="";
		file_desc.style.display="none";
	}
</script>
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:200px">    
		<div class="row content">
			<div class="col-sm-2 sidenav">
			</div>
			
			<div class="col-sm-8 text-left"> 
				<form action="edit.do?btype=${param.btype}&boardno=${param.boardno}" method="post" name="f">
					<input type="hidden" name="boardno" value="${b.boardno}">
					<table>
						<caption>게시판 수정 화면</caption>
						<tr>
							<td>글쓴이</td>
							<td><input type="text" name="id" value="${b.id}"></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" value="${b.title}"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea rows="15" name="content" id="content1">${b.content}</textarea></td>
						</tr>
						<tr>
							<td colspan="2">
								<a href="javascript: document.f.submit()">[게시물 수정]</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
			
			<div class="col-sm-2 sidenav">
			</div>
		</div>
	</div>

</body>
</html>