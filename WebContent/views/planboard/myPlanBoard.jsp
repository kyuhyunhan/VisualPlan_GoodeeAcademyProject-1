<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>My Plan Board</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
	.well {
		background-color:#ffffff !important;
	}
</style>
<body>
	<div class="container-fluid text-center" style="margin-top:200px">    
		<div class="row content">
			<div class="col-sm-3 sidenav">
			</div>
			
			<div class="col-sm-6 text-left"> 
				<h1 style="text-align:center; padding-bottom:40px;">My Plan Board</h1>
				<div style="text-align:center;padding-bottom:60px;" >
					<a href="addPlanForm.jsp"><img src="../../images/plus.png" width="30"></a>
				</div>
				<div>
					<ul class="list-unstyled">
						<li class="panel panel-default">
							<a href="planDetail.jsp">
								<div class="panel-body">
									<div class="panel-heading">
										<h1 class="panel-title" style="text-align:center;"><b>구디 아카데미 개인 프로젝트</b></h1>
									</div>
									<div class="progress">
										<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 30%;">
											30%
										</div>
									</div>
								</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="col-sm-3 sidenav">
			</div>
		</div>
	</div>
</body>
</html>