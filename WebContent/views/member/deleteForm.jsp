<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� Ż��</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:200px">    
		<div class="row content">
		
			<div class="col-sm-3 sidenav">
			</div>
			
			<div class="col-sm-6 text-left"> 
				<form action="delete.me" method="post">
					<input type="hidden" name="id" value="${param.id}">
					<table>
						<caption>ȸ����й�ȣ �Է�</caption>
						<tr>
							<th>��й�ȣ</th>
							<td>
								<input type="password" name="password"/>
							</td>
						</tr>
					</table>
					<br><br>
					<div style="text-align:center">
						<input type="submit" class="btn btn-danger" value="Ż���ϱ�"/>
					</div>
				</form>
			</div>
			
			<div class="col-sm-3 sidenav">
			</div>
			
		</div>
	</div>
</body>
</html>