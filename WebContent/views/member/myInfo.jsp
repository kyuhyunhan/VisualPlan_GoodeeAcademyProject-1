<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>내 정보 확인하기</title>
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
		
			<div class="col-sm-3 sidenav">
			</div>
			
			<div class="col-sm-6 text-left"> 
				<table>
					<caption>회원 정보 보기</caption>
					<tr>
						<th>ID</th>
						<td>${mem.id}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${mem.name}</td>
					</tr>
					<tr>	
						<th>E-Mail</th>
						<td>${mem.email}</td>
					</tr>
				</table>
				<br><br>
				<div style="text-align:center">
					<a href="editForm.me?id=${mem.id}"><button type="button" class="btn btn-default">수정</button></a>
					<a href="deleteForm.me?id=${mem.id}"><button type="button" class="btn btn-default">탈퇴</button></a>
				</div>
			</div>
			
			<div class="col-sm-3 sidenav">
			</div>
			
		</div>
	</div>
</body>
</html>