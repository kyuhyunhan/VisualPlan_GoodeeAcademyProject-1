<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>VisualPlan 로그인</title>
<script>
	function inputcheck(f) {
		if(f.id.value == '') {
			alert("아이디를 입력하세요");
			f.id.focus();
			return false;
		}
		if(f.id.value.length < 4) {
			alert("아이디는 4자리 이상 입력하세요");
			f.id.focus();
			return false;
		}
		if(f.pass.value == '') {
			alert("비밀번호를 입력하세요");
			f.pass.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:200px">    
		<div class="row content">
		
			<div class="col-sm-3 sidenav">
			</div>
			
			<div class="col-sm-6 text-left"> 
				<form action="login.me" method="post" name="f" onsubmit="return inputcheck(this)">
					<table>
						<caption style="font-size:40px">로그인</caption>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<th style="font-size:15px">ID&nbsp;&nbsp;&nbsp;</th>
							<td><input type="text" name="id"></td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<th style="font-size:15px">PW&nbsp;&nbsp;&nbsp;</th>
							<td><input type="password" name="password"></td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td colspan="2" style="text-align:center;">
								<input type="submit" value="로그인">
								<input type="button" value="회원가입" onclick="location.href='joinForm.me'">
							</td>
						</tr>
					</table>
				</form>
			</div>
			
			<div class="col-sm-3 sidenav">
			</div>
			
		</div>
	</div>
</body>
</html>