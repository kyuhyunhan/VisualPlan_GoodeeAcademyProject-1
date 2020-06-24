<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�÷� ��������</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
	/* $(function(){
		var param = {planno:${mpb.planno}};
		$.ajax("percentage.jsp",{
			url:"percentage.jsp",
			type:"POST",
			data:param,
			success : function(data){	//�ݹ��Լ�
				console.log(data);
				$('#progressbar').prop('style', 'width:' + data +'%')
			},
			error : function(e){
				alert("�ϼ��� ������ �ε忡 �����߽��ϴ�.")
			}
		})
		return false;
	}) */
</script>
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:200px">    
		<div class="row content">
			<div class="col-sm-4 sidenav">
			</div>
			
			<div class="col-sm-4 text-left"> 
			
				<div style="padding-bottom:50px;">
					<a href="myPlanBoard.me" style="text-decoration:none;"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>My Plan Board�� ���ư���</a>
				</div>
				
				<div>		<!-- ��� ���� -->
					<div style="padding-bottom:20px;">
						<h1><b>${mpb.title}</b></h1>
						<button class="btn btn-default btn-xs">����</button>
						<button class="btn btn-default btn-xs">����</button>
					</div>
					<div>
						<div class="progress">
							<div id="progressbar" class="progress-bar progress-bar-success" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:${mpb.percentage}%;"/>
						</div>
					</div>
					<h5 style="text-align:right;">���� �޼��� : 30%</h5>
					<hr>
				</div>
				
				<div style="padding: 10px 10px 20px 10px;">		<!-- ���� ���� -->
					<h3>${mpb.detail}</h3>
				</div>
				<c:forEach var="sl" items="${stagelist}">
					<c:if test="${sl.stageno==0}">
						<br>
					</c:if>
					<c:if test="${sl.stageno>0}">
						<div class="panel panel-success">
							<div class="panel-heading">
								<h3 class="panel-title">${sl.stagetitle}</h3>
							</div>
							<div class="panel-body">
								${sl.memo}
							</div>
						</div>
					</c:if>
				</c:forEach>
				
			</div>
			
			<div class="col-sm-4 sidenav">
			</div>
		</div>
	</div>
</body>
</html>