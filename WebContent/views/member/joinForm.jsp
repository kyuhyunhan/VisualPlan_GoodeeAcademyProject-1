<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>

	<div class="container-fluid text-center" style="margin-top:200px">    
		<div class="row content">
		
			<div class="col-sm-2 sidenav">
			</div>
			
			<div class="col-sm-8 text-left"> 
				<form action="join.me" name="f" method="post">
					<table>
						<tr>
							<th>���̵�</th>
							<td><input type="text" name="id"></td>
						</tr>
						<tr>
							<th>��й�ȣ</th>
							<td><input type="password" name="password"></td>
						</tr>
						<tr>
							<th>�̸�</th>
							<td><input type="text" name="name"></td>
						</tr>
						<tr>
							<th>�̸���</th>
							<td colspan="2">
								<input type="text" name="email">
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<input type="submit" value="ȸ������">
							</td>
						</tr>
					</table>
				</form>
			</div>
			
			<div class="col-sm-2 sidenav">
			</div>
			
		</div>
	</div>
</body>
</html>