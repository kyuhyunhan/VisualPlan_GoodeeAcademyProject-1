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
<title>ȸ����Ϻ���</title>
<!-- <link rel="stylesheet" href="../../css/main.css"> -->
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
				<table class="table table-hover">
					<caption>ȸ�����</caption>
					<thead>
						<tr>
							<th>���̵�</th>
							<th>�̸�</th>
							<th>email</th>
							<th>&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="m" items="${memberlist}">
							<tr>
								<td>${m.id}</td>
								<td>${m.name}</td>
								<td>${m.email}</td>
								<td>
									<c:if test="${m.id != 'admin'}">
										<a href="delete.me?id=${m.id}"><button type="button" class="btn btn-default btn-sm">����Ż��</button></a>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div class="col-sm-3 sidenav">
			</div>
			
		</div>
	</div>
</body>
</html>