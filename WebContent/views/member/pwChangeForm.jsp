<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ����</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function inchk(f) {
		if(f.chgpw.value != f.chgpw2.value) {
			alert("���� ��й�ȣ�� ���� ��й�ȣ ���Է��� �ٸ��ϴ�.");
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
						<caption>��й�ȣ ����</caption>
						<tr>
							<th>���� ��й�ȣ</th>
							<td>
								<input type="password" name="password">
							</td>
						</tr>
						<tr>
							<th>���� ��й�ȣ</th>
							<td>
								<input type="password" name="chgpw">
							</td>
						</tr>
						<tr>
							<th>���� ��й�ȣ ���Է�</th>
							<td>
								<input type="password" name="chgpw2">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="��й�ȣ ����">
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