<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>글 상세 보기</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:200px">    
		<div class="row content">
			<div class="col-sm-2 sidenav">
			</div>
			
			<div class="col-sm-8 text-left"> 
				<table>
					<caption>게시물 상세 보기</caption>
					<tr>
						<th width="20%">작성자</th>
						<td width="80%" style="text-align:left">${b.id}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td style="text-align:left">${b.title}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<table style="width:100%; height:250px;">
								<tr>
									<td style="border-width: 0px; vertical-align: top; text-align: left">${b.content}</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<c:if test="${!sessionScope.login.equals(b.id) && !sessionScope.login.equals('admin')}">
					<input type="button" class="btn btn-default" onclick="window.alert('본인만 수정할 수 있습니다.')" value="수정"/>
				</c:if>
				<c:if test="${sessionScope.login.equals(b.id) || sessionScope.login.equals('admin')}">
					<input type="button" class="btn btn-default" onclick="location.href='editForm.do?btype=${param.btype}&boardno=${b.boardno}';" value="수정"/>
				</c:if>
				<c:if test="${!sessionScope.login.equals(b.id) && !sessionScope.login.equals('admin')}">
					<input type="button" class="btn btn-default" onclick="window.alert('본인만 삭제할 수 있습니다.')" value="삭제"/>
				</c:if>
				<c:if test="${sessionScope.login.equals(b.id) || sessionScope.login.equals('admin')}">
					<input type="button" class="btn btn-default" onclick="location.href='deleteForm.do?btype=${param.btype}&boardno=${b.boardno}';" value="삭제"/>
				</c:if>
				<c:if test="${b.btype==1}">
					<input type="button" class="btn btn-default" onclick="location.href='notice.do?btype=1';" value="목록"/>
				</c:if>
				<c:if test="${b.btype==2}">
					<input type="button" class="btn btn-default" onclick="location.href='freeBoard.do?btype=2';" value="목록"/>
				</c:if>
			</div>
			
			<div class="col-sm-2 sidenav">
			</div>
		</div>
	</div>
</body>
</html>