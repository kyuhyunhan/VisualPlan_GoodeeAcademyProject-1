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
	function initclone(){
		var form1 = $('#stage-form0').clone().prop('id','stage-form1').css('display',"block");
		$('#stage-wrap').html(form1);
	}

	$(document).ready(function(){
		initclone();
		
		var todomaxadd = 1;
		var stagemaxadd = 1;
		var b1 = document.getElementById('add-todo-button');
		var b2 = document.getElementById('remove-todo-button');
		
		$("#add-stage").on('click',function(){
			var $lastdiv = $('div[id^="stage-form"]:last');	
			var num = parseInt( $lastdiv.prop("id").match(/\d+/g), 10 ) +1;
			var $clone = $('#stage-form0').clone().prop('id','stage-form'+num).css('display',"block");
			if(stagemaxadd>4) return;
			$clone.insertAfter("div.stage-form-class:last").find('input').val('');
			stagemaxadd++;
		});
		
		$("#remove-stage").on('click',function(){
			if(stagemaxadd<2) return;
			$('div[id^="stage-form"]:last').remove();
			if(stagemaxadd>1)stagemaxadd--;
		});
		
		/* $("#stage-form1 > #todo-form > #add-todo").on('click',function(){
			var r = $("<input type='text' class='form-control' id='item'>");
			if(todomaxadd>4) return;
			$("#stage-form1 >  #todo-form > #todo-items").append(r);
			todomaxadd++; 
		});
		$("#stage-form1 > #todo-form > #remove-todo").on('click',function(){
			if(todomaxadd<2) return;
			$("#stage-form1 >  #todo-form > #todo-items > #item:last").remove();
			todomaxadd--;
		});
		
		$("#stage-form2 > #todo-form > #add-todo").on('click',function(){
			var r = $("<input type='text' class='form-control' id='item'>");
			if(todomaxadd>4) return;
			$("#stage-form2 >  #todo-form > #todo-items").append(r);
			todomaxadd++; 
		});
		$("#stage-form2 > #todo-form > #remove-todo").on('click',function(){
			if(todomaxadd<2) return;
			$("#stage-form2 >  #todo-form > #todo-items > #item:last").remove();
			todomaxadd--;
		});
		
		$("#stage-form3 > #todo-form > #add-todo").on('click',function(){
			var r = $("<input type='text' class='form-control' id='item'>");
			if(todomaxadd>4) return;
			$("#stage-form3 >  #todo-form > #todo-items").append(r);
			todomaxadd++; 
		});
		$("#stage-form3 > #todo-form > #remove-todo").on('click',function(){
			if(todomaxadd<2) return;
			$("#stage-form3 >  #todo-form > #todo-items > #item:last").remove();
			todomaxadd--;
		});
		
		$("#stage-form4 > #todo-form > #add-todo").on('click',function(){
			var r = $("<input type='text' class='form-control' id='item'>");
			if(todomaxadd>4) return;
			$("#stage-form4 >  #todo-form > #todo-items").append(r);
			todomaxadd++; 
		});
		$("#stage-form4 > #todo-form > #remove-todo").on('click',function(){
			if(todomaxadd<2) return;
			$("#stage-form4 >  #todo-form > #todo-items > #item:last").remove();
			todomaxadd--;
		});
		
		$("#stage-form5 > #todo-form > #add-todo").on('click',function(){
			var r = $("<input type='text' class='form-control' id='item'>");
			if(todomaxadd>4) return;
			$("#stage-form5 >  #todo-form > #todo-items").append(r);
			todomaxadd++; 
		});
		$("#stage-form5 > #todo-form > #remove-todo").on('click',function(){
			if(todomaxadd<2) return;
			$("#stage-form5 >  #todo-form > #todo-items > #item:last").remove();
			todomaxadd--;
		}); */
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
						
						<div class="fixed-form">
						
							<div class="form-group">
							<label class="control-label col-sm-2" for="title">�÷���</label> 
								<div class="col-sm-9">
									<input type="text" class="form-control" id="title" placeholder="�÷����� �Է��ϼ���" name="title">
								</div>
							</div>
							<div class="form-group">
							<label class="control-label col-sm-2" for="detail">�󼼳���</label>  
								<div class="col-sm-9">          
									<input type="text" class="form-control" id="detail" placeholder="�󼼳����� �Է��ϼ���" name="detail">
								</div>
							</div>
							<br>
							<br>
							
						</div>
						
						<div id="stage-form0" class="stage-form-class" style="display:none">
							<div class="form-group">
							 	<label class="control-label col-sm-2" for="stagetitle">
							 		�߰���ǥ
							 	</label> 
								<div class="col-sm-7">          
									<input type="text" class="form-control" id="stagetitle" placeholder="�߰���ǥ�� �Է��ϼ���" name="stagetitle">
								</div>
							</div>
							<div class="form-group">
						 		<label class="control-label col-sm-2" for="percentage">�ϼ���</label> 
								<div class="col-sm-4">
									<input type="text" class="form-control" id="percentage" placeholder="�ϼ���	 /100(%)" name="percentage">
								</div>
							</div>
							
							<div class="form-group" id="todo-form">
							 	<label class="control-label col-sm-2" >
							 		To do<br>
							 	</label> 
								<div class="col-sm-4" id="todo-items">          
									<input type="text" class="form-control" id="item">
								</div>
								<span id="add-todo-span">
									<button class="btn btn-success btn-add" type="button" id="add-todo-button">
										<span class="glyphicon glyphicon-plus"></span>
									</button>
				                </span>
				                <span id="remove-todo-span">
									<button class="btn btn-danger btn-add" type="button" id="remove-todo-button">
			                           	<span class="glyphicon glyphicon-minus"></span>
			                        </button>
		                        </span>
							</div>
							<br>
							<hr>
							<br>
						</div>
							
							
						<div id="stage-wrap">	
						</div>
						
						
						<br><br>
						<div style="text-align:center;">
							<button type="button" class="btn btn-success" id="add-stage">�߰� ��ǥ �߰��ϱ�</button>
							<button type="button" class="btn btn-danger" id="remove-stage">�߰� ��ǥ �����ϱ�</button>
						</div>
						 
						<div class="form-group" style="text-align:right;">        
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">�Ϸ�</button>
							</div>
						</div>
					</form>
				<!-- 
				<div class="form-group">        
					<div class="col-sm-offset-2 col-sm-6">
						<div class="checkbox">
							<label><input type="checkbox" name="remember"> Remember me</label>
						</div>
					</div>
				</div>
				 -->
			</div>
			
			<div class="col-sm-4 sidenav">
			</div>
		</div>
	</div>
</body>
</html>