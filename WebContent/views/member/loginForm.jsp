<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>VisualPlan �α���</title>
<script>
	function inputcheck(f) {
		if(f.id.value == '') {
			alert("���̵� �Է��ϼ���");
			f.id.focus();
			return false;
		}
		if(f.id.value.length < 4) {
			alert("���̵�� 4�ڸ� �̻� �Է��ϼ���");
			f.id.focus();
			return false;
		}
		if(f.pass.value == '') {
			alert("��й�ȣ�� �Է��ϼ���");
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
						<caption style="font-size:40px">�α���</caption>
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
								<input type="submit" value="�α���">
								<input type="button" value="ȸ������" onclick="location.href='joinForm.me'">
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