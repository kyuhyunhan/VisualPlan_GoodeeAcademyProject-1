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
<script>
	function initclone(){
		var form1 = $('#stage-form0').clone().prop('id','stage-form1').css('display',"block");
		form1.find("#stagetitle").prop('name','stagetitle_cloned');
		form1.find("#percentage").prop('name','percentage_cloned');
		form1.find("#memo").prop('name','memo_cloned');
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
			
			$clone.find("#stagetitle").prop('name','stagetitle_cloned');
			$clone.find("#percentage").prop('name','percentage_cloned');
			$clone.find("#memo").prop('name','memo_cloned');
			console.log($clone.find("#memo").attr('name'));
			
			if(stagemaxadd>4) return;
			$clone.insertAfter("div.stage-form-class:last").find('input').val('');
			stagemaxadd++;
		});
		
		$("#remove-stage").on('click',function(){
			if(stagemaxadd<2) return;
			$('div[id^="stage-form"]:last').remove();
			if(stagemaxadd>1)stagemaxadd--;
		});
	});
</script>
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:200px">    
		<div class="row content">
			<div class="col-sm-4 sidenav">
			</div>
			
			<div class="col-sm-4 text-left"> 
					
					<div style="padding-bottom:50px;">
						<a href="myPlanBoard.me" style="text-decoration:none;"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>My Plan Board로 돌아가기</a>
					</div>
				
					<h2 style="text-align:center">플랜 추가하기</h2>
					<form class="form-horizontal" action="addPlan.do" method="post" name="f">
						<input type="hidden" name="id" value="${sessionScope.login}">
						<div class="fixed-form">
						
							<div class="form-group">
							<label class="control-label col-sm-2" for="title">플랜명</label> 
								<div class="col-sm-9">
									<input type="text" class="form-control" id="title" placeholder="플랜명을 입력하세요" name="title">
								</div>
							</div>
							<div class="form-group">
							<!-- 	<span class="col-sm-2 control-label">상세내용</span> -->
							<label class="control-label col-sm-2" for="detail">상세내용</label>  
								<div class="col-sm-9">          
									<textarea rows="3" class="form-control" id="detail" placeholder="상세내용을 입력하세요" name="detail"></textarea>
								</div>
							</div>
							<br>
							<br>
							
						</div>
						
						<div id="stage-form0" class="stage-form-class" style="display:none">
							<div class="form-group">
							 	<label class="control-label col-sm-2" for="stagetitle">
							 		중간목표
							 	</label> 
								<div class="col-sm-7">          
									<input type="text" class="form-control" id="stagetitle" placeholder="중간목표를 입력하세요" name="stagetitle">
								</div>
							</div>
							
							<div class="form-group">
						 		<label class="control-label col-sm-2" for="percentage">완수율</label> 
								<div class="col-sm-4">
									<input type="text" class="form-control" id="percentage" placeholder="완수율	 /100(%)" name="percentage">
								</div>
							</div>
							
							<div class="form-group">
							 	<label class="control-label col-sm-2" for="memo">
							 		메모
							 	</label> 
								<div class="col-sm-9">          
									<textarea class="form-control" id="memo" rows="3" style="max-width: 100%" name="memo"></textarea>
								</div>
							</div>
							
							<br>
							<hr>
							<br>
						</div>
							
							
						<div id="stage-wrap">	
						</div>
						
						
						<br><br>
						<div style="text-align:center;">
							<button type="button" class="btn btn-success" id="add-stage">중간 목표 추가하기</button>
							<button type="button" class="btn btn-danger" id="remove-stage">중간 목표 삭제하기</button>
						</div>
						 
						<div class="form-group" style="text-align:right;">        
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">완료</button>
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