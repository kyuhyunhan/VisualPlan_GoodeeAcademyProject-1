<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function inchk(f) {
		if(f.chgpw.value != f.chgpw2.value) {
			alert("변경 비밀번호와 변경 비밀번호 재입력이 다릅니다.");
			f.chgpw2.value="";
			f.chgpw2.focus();
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
				<form action="pwchange.me" method="post" name="f" onsubmit="return inchk(this)">
					<table>
						<caption>비밀번호 변경</caption>
						<tr>
							<th>현재 비밀번호</th>
							<td>
								<input type="password" name="password">
							</td>
						</tr>
						<tr>
							<th>변경 비밀번호</th>
							<td>
								<input type="password" name="chgpw">
							</td>
						</tr>
						<tr>
							<th>변경 비밀번호 재입력</th>
							<td>
								<input type="password" name="chgpw2">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="비밀번호 변경">
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