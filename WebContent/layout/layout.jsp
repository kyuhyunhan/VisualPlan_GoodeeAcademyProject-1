<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<decorator:head/>
<title><decorator:title/></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>  
	#hometag {
		color: #1bbc9b;
	}
  /* Remove the navbar's default margin-bottom and rounded borders */ 
  .navbar {
    margin-bottom: 0;
    border-radius: 0;
    background-color : #ffffff !important;
    border-color : #ffffff !important;
    box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12) !important;
  }
  
   /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
  .row.content {height: 450px}
  
  /* Set gray background color and 100% height */
  .sidenav {
    padding-top: 20px;
    background-color: #ffffff;
    height: 100%;
  }
  
  /* Set black background color, white text and some padding */
  footer {
    background-color: #555;
    color: white;
    padding: 15px;
  }
  
  /* On small screens, set height to 'auto' for sidenav and grid */
  @media screen and (max-width: 767px) {
    .sidenav {
      height: auto;
      padding: 15px;
    }
    .row.content {height:auto;} 
  }
</style>
<body>
<%--
<div class="w3-top">
  <div class="w3-bar w3-white w3-wide w3-padding w3-card">
    <a href="#home" class="w3-bar-item w3-button"><b>BR</b> Architects</a>
    <!-- Float links to the right. Hide them on small screens -->
    <div class="w3-right w3-hide-small">
      <a href="#projects" class="w3-bar-item w3-button">Projects</a>
      <a href="#about" class="w3-bar-item w3-button">About</a>
      <a href="#contact" class="w3-bar-item w3-button">Contact</a>
    </div>
  </div>
</div>
 --%>
	<div class="w3-top">
		<nav class="navbar">
		
		  <div class="container-fluid">
		    <div class="navbar-header">
		    <%-- 혹시 모를 홈 버튼 이미지를 위해..
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>                        
		      </button>
		    --%>
		      <a id="hometag" class="navbar-brand" href="../home/home.me"><strong>VisualPlan</strong></a>
		    </div>
		    
		    <div class="collapse navbar-collapse" id="myNavbar">	<%-- 이 div가 있어야 nav 탭들이 반응형으로 되어서 화면이 작아졌을 때, 우측에 탭으로 묶인다 --%>
		      <ul class="nav navbar-nav">
		        <li><a href="../boards/notice.do?btype=1">notice</a></li>
		        <li><a href="../boards/freeBoard.do?btype=2">board</a></li>
		        <c:if test="${sessionScope.login.equals('admin')}">
		        	<li><a href="../member/memberlist.me">member list</a></li>
		        </c:if>
		        <c:if test="${!sessionScope.login.equals('admin')}">
		        	<li><a href="../planboard/myPlanBoard.me">my plan board</a></li>
		        </c:if>
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		      	<c:if test="${sessionScope.login != null}">
		      		<li><a href="../member/myInfo.me">my info</a></li>
			        <li><a href="../member/logout.me">log out</a></li>
		      	</c:if>
		      	<c:if test="${sessionScope.login == null}">
			        <li><a href="../member/loginForm.me">Log In</a></li>
			        <li><a href="../member/joinForm.me">Sign Up</a></li>
			    </c:if>
		      </ul>
		    </div>
		    
		  </div>
		  
		</nav>
	</div>

	<main>
	
		<decorator:body />
	
	</main>

	<footer class="container-fluid text-center">
	  <p>구디 아카데미</p>
	  <p>한규현 개인프로젝트</p>
	</footer>

</body>
</html>
