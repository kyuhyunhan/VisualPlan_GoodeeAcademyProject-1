<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  body {
    font: 20px Montserrat, sans-serif;
    line-height: 1.8;
    color: #f5f6f7;
  }
  p {font-size: 16px;}
  .margin {margin-bottom: 15px; font-size:60px;}
  .bg-1 { 
    background-color: #1abc9c; /* Green */
    color: #ffffff;
  }
  .bg-2 { 
    background-color: #ffffff; /* Dark Blue */
    color: #474e5d;
  }
  .bg-3 { 
    background-color: #ffffff; /* White */
    color: #555555;
  }
  .bg-4 { 
    background-color: #2f2f2f; /* Black Gray */
    color: #fff;
  }

  </style>
</head>
<body>
	<div class="text-center">    
	
		<!-- First Container -->
		<div class="bg-1 text-center" style="padding-top: 100px;padding-bottom: 80px;">
			<img src="../../images/home1.jpg" class="img-responsive img-circle margin" style="display:inline" alt="(Image)" width="350" height="350">
			<p class="margin">Welcome to VisualPlan</p>
			<h2>계획의 진행도를 한 눈에 확인하세요</h2>
			<br><br><br>
			<c:if test='${sessionScope.login == null}'>
				<a href="../member/loginForm.me" class="btn btn-default btn-lg" style="font-size:40px; color: #757474;">  시 작 하 기  </a>
			</c:if>
			<c:if test='${sessionScope.login != null}'>
				<a href="../planboard/myPlanBoard.me" class="btn btn-default btn-lg" style="font-size:40px; color: #757474;">  시 작 하 기  </a>
			</c:if>
		</div>
	
		<!-- Second Container -->
		<div class="bg-2 text-center" style="padding-top: 70px;padding-bottom: 70px;">
			<h3 class="margin">여기에 뭐 넣지?</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
		</div>
	</div>
</body>
</html>
