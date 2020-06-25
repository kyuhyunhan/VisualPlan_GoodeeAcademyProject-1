<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�÷� �����ϱ�</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:200px">    
		<div class="row content">
			<div class="col-sm-4 sidenav">
			</div>
			
			<div class="col-sm-4 text-left"> 
			
				<div style="padding-bottom:50px;">
					<a href="planDetail.me?planno=${mpb.planno}" style="text-decoration:none;"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>�ڷΰ���</a>
				</div>
				
				<h2 style="text-align:center">�÷� �����ϱ�</h2>
				<br><br>
					<form class="form-horizontal" action="editPlan.me?id=${sessionScope.login}&planno=${param.planno}" method="post" name="f">
						<div class="fixed-form">
						
							<div class="form-group">
							<label class="control-label col-sm-2" for="title">�÷���</label> 
								<div class="col-sm-9">
									<input type="text" class="form-control" id="title" value="${mpb.title}" name="title">
								</div>
							</div>
							<div class="form-group">
							<!-- 	<span class="col-sm-2 control-label">�󼼳���</span> -->
							<label class="control-label col-sm-2" for="detail">�󼼳���</label>  
								<div class="col-sm-9">          
									<textarea rows="3" class="form-control" id="detail" name="detail">${mpb.detail}</textarea>
								</div>
							</div>
							<br>
							<br>
							
						</div>
						
						<c:forEach var="sl" items="${stagelist}">
							<c:if test="${sl.stageno==0}">
								<br>
							</c:if>
							<c:if test="${sl.stageno>0}">
								<div id="stage-form" class="stage-form-class" >
									<div class="form-group">
									 	<label class="control-label col-sm-2" for="stagetitle">
									 		�߰���ǥ
									 	</label> 
										<div class="col-sm-7">          
											<input type="text" class="form-control" id="stagetitle" placeholder="�߰���ǥ�� �Է��ϼ���" name="stagetitle" value="${sl.stagetitle}">
										</div>
									</div>
								
									<div class="form-group">
								 		<label class="control-label col-sm-2" for="percentage">�ϼ���</label> 
										<div class="col-sm-4">
											<input type="text" class="form-control" id="percentage" placeholder="�ϼ���	 /100(%)" name="percentage" value="${sl.percentage}">
										</div>
									</div>
								
									<div class="form-group">
									 	<label class="control-label col-sm-2" for="memo">
									 		�޸�
									 	</label> 
										<div class="col-sm-9">          
											<textarea class="form-control" id="memo" rows="3" style="max-width: 100%" name="memo">${sl.memo}</textarea>
										</div>
									</div>
								
									<br>
									<hr>
									<br>
								</div>
							</c:if>
						</c:forEach>
						 
						<div class="form-group" style="text-align:center;">        
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-primary">���� �Ϸ�</button>
							</div>
						</div>
					</form>
					<br><br><br><br>
			</div>
			
			<div class="col-sm-4 sidenav">
			</div>
		</div>
	</div>
</body>
</html>