<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>공지사항</title>
<link rel="stylesheet" href="../../css/main.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:200px">    
		<div class="row content">
			<div class="col-sm-2 sidenav">
			</div>
			
			<div class="col-sm-8 text-left"> 
						
				<h1 style="text-align:center; padding-bottom:40px;">공지사항</h1>
				
				<table>
					<caption>게시판 목록</caption>
					<c:if test="${boardcount == 0}">
						<tr>
							<td colspan="5">등록된 게시글이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${boardcount > 0}">
						<tr>
							<td colspan="5" style="text-align:right">글 개수: ${boardcount}</td>
						</tr>
						<tr>
							<th width="8%">번호</th>
							<th width="50%">제목</th>
							<th width="14%">작성자</th>
							<th width="17%">등록일</th>
							<th width="11*">조회수</th>
						</tr>
						<c:forEach var="b" items="${list}">
							<c:if test="${b.btype==param.btype}">
								<tr>
									<td>
										${boardnum}
										<c:set var="boardnum" value="${boardnum-1}"/>
									</td>
									<td style="text-align: left">
										<a href="boardInfo.do?btype=${param.btype}&boardno=${b.boardno}">${b.title}</a>
									</td>
									<td>${b.id}</td>
									
									<td>
										<fmt:formatDate var="bdate" value="${b.boarddate}" pattern="yyyy-MM-dd"/>
										
										<c:if test="${today == bdate}">
											<fmt:formatDate value="${b.boarddate}" pattern="HH:mm:ss"/>
										</c:if>
										<c:if test="${today != bdate}">
											<fmt:formatDate value="${b.boarddate}" pattern="yyyy-MM-dd HH:mm"/>
										</c:if>
									</td>
									<td>${b.readcnt}</td>
								</tr>
							</c:if>
						</c:forEach>
						
						<tr>
							<td colspan="5">
							<%-- 페이지 처리하기 --%>
								<c:if test="${pageNum <= 1}">
									[이전]
								</c:if>
								<c:if test="${pageNum > 1}">
									<a href="notice.do?btype=${param.btype}&pageNum=${pageNum-1}">[이전]</a>
								</c:if>
								
								<c:forEach var="a" begin="${startpage}" end="${endpage}">
									<c:if test="${a == pageNum}">
										[${a}]
									</c:if>
									<c:if test="${a != pageNum}">
										<a href="notice.do?btype=${param.btype}&pageNum=${a}">[${a}]</a>
									</c:if>
								</c:forEach>
								
								<c:if test="${pageNum >= maxpage}">
									[다음] 
								</c:if>
								<c:if test="${pageNum < maxpage}">
									<a href="notice.do?btype=${param.btype}&pageNum=${pageNum +1}">[다음]</a> 
								</c:if>
							</td>
						</tr>
						
					</c:if>
				</table>
				<c:if test="${sessionScope.login.equals('admin')}">
					<input type="button" class="btn btn-default" onclick="location.href='writeForm.do?btype=${param.btype}';" value="글쓰기"/>
				</c:if>
			</div>
			
			<div class="col-sm-2 sidenav">
			</div>
		</div>
	</div>
</body>
</html>