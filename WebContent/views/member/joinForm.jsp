<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>

	<div class="container-fluid text-center" style="margin-top:200px">    
		<div class="row content">
		
			<div class="col-sm-4 sidenav">
			</div>
			
			<div class="col-sm-4 text-left"> 
				<form action="join.me" name="f" method="post">
					<table>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="password"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="name"></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td colspan="2">
								<input type="text" name="email">
							</td>
						</tr>
					</table>
					<br><br>
					<div style="text-align:center">
						<input type="submit" class="btn btn-default" value="회원가입">
					</div>
				</form>
			</div>
			
			<div class="col-sm-4 sidenav">
			</div>
			
		</div>
	</div>
</body>
</html>