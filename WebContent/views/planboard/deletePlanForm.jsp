<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:200px">    
		<div class="row content">
			<div class="col-sm-4 sidenav">
			</div>
			
			<div class="col-sm-4 text-left"> 
				<form action="deletePlan.me?id=${sessionScope.login}&planno=${planno}" name="f" method="post">
					<h1 style="text-align:center">�÷��� �����Ͻðڽ��ϱ�?</h1>
					<br><br><br><br>
					<div style="text-align: center">
						<input type="submit" value="����" class="btn btn-danger">
						<button type="button" class="btn btn-default" onclick="location.href='planDetail.me?planno=${planno}'">���</button>
					</div>
				</form>
			</div>
			
			<div class="col-sm-4 sidenav">
			</div>
		</div>
	</div>
</body>
</html>