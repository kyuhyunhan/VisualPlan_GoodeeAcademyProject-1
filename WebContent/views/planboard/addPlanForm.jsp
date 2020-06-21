<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�÷� �߰��ϱ� </title>
<link rel="stylesheet" href="../../css/main.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		$("#add-todo").click(function(){
			var r = $("<input type=\"text\" class=\"form-control\" id=\"item1\" name=\"item1\">");
			$("#todo-items").append(r);
			return false;
		});
		$("#remove-todo").click(function(){
			
		})
	});
</script>
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:200px">    
		<div class="row content">
			<div class="col-sm-4 sidenav">
			</div>
			
			<div class="col-sm-4 text-left"> 
				
					<h2 style="text-align:center">�÷� �߰��ϱ�</h2>
					<form class="form-horizontal" action="addPlan.do" method="post" name="f">
						<div class="form-group">
						<!-- 	<span class="col-sm-2 control-label">�÷���</span> -->
						<label class="control-label col-sm-2" for="title">�÷���</label> 
							<div class="col-sm-9">
								<input type="text" class="form-control" id="title" placeholder="�÷����� �Է��ϼ���" name="title">
							</div>
						</div>
						<div class="form-group">
						<!-- 	<span class="col-sm-2 control-label">�󼼳���</span> -->
						<label class="control-label col-sm-2" for="detail">�󼼳���</label>  
							<div class="col-sm-9">          
								<input type="text" class="form-control" id="detail" placeholder="�󼼳����� �Է��ϼ���" name="detail">
							</div>
						</div>
						<br>
						<br>
						<div class="form-group" id="stage-form">
						<!-- 	<span class="col-sm-2 control-label">�߰���ǥ1</span> -->
					 	<label class="control-label col-sm-2" for="stagetitle">
					 		�߰���ǥ1
					 	</label> 
							<div class="col-sm-7">          
								<input type="text" class="form-control" id="stagetitle" placeholder="�߰���ǥ�� �Է��ϼ���" name="stagetitle">
							</div>
						</div>
						<div class="form-group">
						<!-- 	<span class="col-sm-2 control-label">�ϼ���</span> -->
					 	<label class="control-label col-sm-2" for="percentage">�ϼ���</label> 
							<div class="col-sm-4">
								<input type="text" class="form-control" id="percentage" placeholder="�ϼ���	 /100(%)" name="percentage">
							</div>
						</div>
						<div class="form-group" id="todo-form">
						<!-- 	<span class="col-sm-2 control-label">To Do List</span> -->
					 	<label class="control-label col-sm-2" >
					 		To do<br>
					 	</label> 
							<div class="col-sm-4" id="todo-items">          
								<input type="text" class="form-control" id="item1" name="item1">
							</div>
							<span id="add-todo">
								<button class="btn btn-success btn-add" type="button">
									<span class="glyphicon glyphicon-plus"></span>
								</button>
		                    </span>
		                    <span id="remove-todo">
								<button class="btn btn-danger btn-add" type="button">
	                            	<span class="glyphicon glyphicon-minus"></span>
	                            </button>
                            </span>
						</div>
						<!-- 
						<div class="form-group">        
							<div class="col-sm-offset-2 col-sm-6">
								<div class="checkbox">
									<label><input type="checkbox" name="remember"> Remember me</label>
								</div>
							</div>
						</div>
						 -->
						 <br><br>
						<div style="text-align:center;">
							<button type="button" class="btn btn-success">�߰� ��ǥ �߰� �ϱ�</button>
						</div>
						 
						<div class="form-group" style="text-align:right;">        
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">�Ϸ�</button>
							</div>
						</div>
					</form>
			</div>
			
			<div class="col-sm-4 sidenav">
			</div>
		</div>
	</div>
</body>
</html>