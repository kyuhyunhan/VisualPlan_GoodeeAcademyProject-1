<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
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
	<nav class="navbar navbar-inverse">
	
	  <div class="container-fluid">
	    <div class="navbar-header">
	    <%-- Ȥ�� �� Ȩ ��ư �̹����� ����..
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>                        
	      </button>
	    --%>
	      <a class="navbar-brand" href="home.jsp">Visual Plan</a>
	    </div>
	    
	    <div class="collapse navbar-collapse" id="myNavbar">	<%-- �� div�� �־�� nav �ǵ��� ���������� �Ǿ ȭ���� �۾����� ��, ������ ������ ���δ� --%>
	      <ul class="nav navbar-nav">
	        <li><a href="../views/boards/notice.jsp">notice</a></li>
	        <li><a href="../views/boards/freeBoard.jsp">board</a></li>
	        <li><a href="../views/planboard/myPlanBoard.jsp">my plan board</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="../views/member/loginForm.jsp">Log In</a></li>
	        <li><a href="../views/member/joinForm.jsp">Sign Up</a></li>
	      </ul>
	    </div>
	    
	  </div>
	  
	</nav>
</div>

<main>
			
		<decorator:body />

</main>

<footer class="text-center">
  <p>���� ��ī����</p>
  <p>�ѱ��� ����������Ʈ</p>
</footer>

</body>
</html>
