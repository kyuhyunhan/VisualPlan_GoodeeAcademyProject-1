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
	function complete(planno, stageno){
		var param={planno:planno, stageno:stageno}
		$.ajax("complete.jsp",{
			url:"complete.jsp",
			type:"POST",
			data:param,
			success: function(){
				location.reload();
			},
			error: function(){
				alert("�����߻�: " + e.status);
			}
		})
	}
	function uncomplete(planno, stageno){
		var param={planno:planno, stageno:stageno}
		$.ajax("uncomplete.jsp",{
			url:"uncomplete.jsp",
			type:"POST",
			data:param,
			success: function(){
				location.reload();
			},
			error: function(){
				alert("�����߻�: " + e.status);
			}
		})
	}
	/* ������ modalâ���� �ϰ� ������ �� �ȵŴ��� �𸣰ڴ�.. 
	function deletePlan(planno) {
		var param = {planno:planno}
		console.log(planno)
		$.ajax("deletePlanSQL.jsp",{
			url:"deletePlanSQL.jsp",
			type:"POST",
			data: param,
			success : function() {
				alert("�÷��� �����Ǿ����ϴ�.")
				window.location.assign("myPlanBoard.jsp");
			},
			error : function() {
				alert("���� ����")
			}
		})
	} */
</script>
<style>
	.checkbox label:after {
	  content: '';
	  display: table;
	  clear: both;
	}
	
	.checkbox .cr {
	  position: relative;
	  display: inline-block;
	  border: 1px solid #a9a9a9;
	  border-radius: .25em;
	  width: 1.3em;
	  height: 1.3em;
	  float: left;
	  margin-right: .5em;
	}
	
	.checkbox .cr .cr-icon {
	  position: absolute;
	  font-size: .8em;
	  line-height: 0;
	  top: 50%;
	  left: 15%;
	}
	
	.checkbox label input[type="checkbox"] {
	  display: none;
	}
	
	.checkbox label input[type="checkbox"]+.cr>.cr-icon {
	  opacity: 0;
	}
	
	.checkbox label input[type="checkbox"]:checked+.cr>.cr-icon {
	  opacity: 1;
	}
</style>
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
						<button class="btn btn-default btn-xs" onclick="location.href='editPlanForm.me?id=${sessionScope.login}&planno=${mpb.planno}';">����</button>
						<button class="btn btn-default btn-xs" onclick="location.href='deletePlanForm.me?id=${sessionScope.login}&planno=${mpb.planno}';">����</button>
						
						<%-- <div id="deleteModal" class="modal fade" role="dialog">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title">�÷� ����</h4>
										</div>
									<div class="modal-body">
										<p>�÷��� �����Ͻðڽ��ϱ�?</p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary" onclick="javascript:deletePlan(${mpb.planno})">����</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">���</button>
									</div>
								</div>
							</div>
						</div> --%>
					</div>
					<div>
						<div class="progress">
							<div id="progressbar" class="progress-bar progress-bar-success" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:${mpb.percentage}%;"/>
						</div>
					</div>
					<h5 style="text-align:right;">���� �޼��� : <u>${mpb.percentage}%</u></h5>
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
								<div>
									<strong class="panel-title">${sl.stagetitle}</strong>
								</div>
								<div class="checkbox pull-right">
									<label>
										<c:if test='${sl.checked==false}'>
											<input type="checkbox" value="" onclick="javascript:complete(${mpb.planno},${sl.stageno})">
											<span class="cr">
												<i class="cr-icon glyphicon glyphicon-ok"></i>
											</span>
										</c:if>
										<c:if test='${sl.checked==true}'>
											<input type="checkbox" value="" onclick="javascript:uncomplete(${mpb.planno},${sl.stageno})" checked>
											<span class="cr">
												<i class="cr-icon glyphicon glyphicon-ok"></i>
											</span>
										</c:if>
										�Ϸ�
									</label>
								</div>
								<br>
							</div>
							<div class="panel-body">
								${sl.memo}
							</div>
						</div>
					</c:if>
				</c:forEach>
				<br><br><br><br>
			</div>
			
			<div class="col-sm-4 sidenav">
			</div>
		</div>
	</div>
</body>
</html>