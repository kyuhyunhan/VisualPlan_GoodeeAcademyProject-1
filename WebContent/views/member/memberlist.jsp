<%@page import="model.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원목록보기</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:200px">    
		<div class="row content">
		
			<div class="col-sm-2 sidenav">
			</div>
			
			<div class="col-sm-8 text-left"> 
				<table>
					<caption>회원목록</caption>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>email</th>
						<th>&nbsp;</th>
					</tr>
					<c:forEach var="m" items="${memberlist}">
						<tr>
							<td>${m.id}</td>
							<td>${m.name}</td>
							<td>${m.email}</td>
							<td>
								<c:if test="${m.id != 'admin'}">
									<a href="delete.me?id=${m.id}">[강제탈퇴]</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			
			<div class="col-sm-2 sidenav">
			</div>
			
		</div>
	</div>
</body>
</html>