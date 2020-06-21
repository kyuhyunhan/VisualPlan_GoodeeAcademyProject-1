<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>플랜 추가하기 </title>
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
				
					<h2 style="text-align:center">플랜 추가하기</h2>
					<form class="form-horizontal" action="addPlan.do" method="post" name="f">
						<div class="form-group">
							<span class="col-sm-2 control-label">플랜명</span>
					<!--	<label class="control-label col-sm-2" for="title">플랜명</label>  -->
							<div class="col-sm-9">
								<input type="text" class="form-control" id="title" placeholder="플랜명을 입력하세요" name="title">
							</div>
						</div>
						<div class="form-group">
							<span class="col-sm-2 control-label">상세내용</span>
					<!--	<label class="control-label col-sm-2" for="detail">상세내용</label>  -->
							<div class="col-sm-9">          
								<input type="text" class="form-control" id="detail" placeholder="상세내용을 입력하세요" name="detail">
							</div>
						</div>
						<div class="form-group">
							<span class="col-sm-2 control-label">중간목표1</span>
					<!-- 	<label class="control-label col-sm-2" for="stagetitle">중간목표1</label> -->
							<div class="col-sm-9">          
								<input type="text" class="form-control" id="stagetitle" placeholder="중간목표를 입력하세요" name="stagetitle">
							</div>
						</div>
						<div class="form-group">
							<span class="col-sm-2 control-label">완수율</span>
					<!-- 	<label class="control-label col-sm-2" for="percentage">완수율</label> -->
							<div class="col-sm-4">
								<input type="text" class="form-control" id="percentage" placeholder="중간목표의 완수율 		/100(%)" name="percentage">
							</div>
						</div>
						<div class="form-group">
							<span class="col-sm-2 control-label">To Do List</span>
					<!-- 	<label class="control-label col-sm-2" >To do List</label> -->
							<div class="col-sm-3">          
								<input type="text" class="form-control" id="item1" name="item1">
							</div>
							<div class="col-sm-3">          
								<input type="text" class="form-control" id="item2" name="item2">
							</div>
							<div class="col-sm-3">          
								<input type="text" class="form-control" id="item3" name="item3">
							</div>
						</div>
						<div class="form-group">        
							<div class="col-sm-offset-2 col-sm-6">
								<div class="checkbox">
									<label><input type="checkbox" name="remember"> Remember me</label>
								</div>
							</div>
						</div>
						<div class="form-group">        
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">Submit</button>
							</div>
						</div>
					</form>
			</div>
			
			<div class="col-sm-3 sidenav">
			</div>
		</div>
	</div>
</body>
</html>