<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 탈퇴</title>
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
						<caption>회원비밀번호 입력</caption>
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" name="password"/>
							</td>
						</tr>
					</table>
					<br><br>
					<div style="text-align:center">
						<input type="submit" class="btn btn-danger" value="탈퇴하기"/>
					</div>
				</form>
			</div>
			
			<div class="col-sm-3 sidenav">
			</div>
			
		</div>
	</div>
</body>
</html>