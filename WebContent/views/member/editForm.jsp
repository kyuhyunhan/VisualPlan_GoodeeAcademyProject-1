<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
	admin�� ������ �� �������� ������ �� ����. url�� ���� �� �� ������ ���Ȼ� ���Ƶд�
 --%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function inputcheck(f) {
		<c:if test="${sessionScope.login != 'admin'}">
			if(f.pass.value == "") {
				alert("��й�ȣ�� �Է��ϼ���");
				f.pass.focus();
				return false;
			}
		</c:if>
	}
	function win_passchg() {
		var op ="width=500, height=250, left=50, top=150";
		open("pwChangeForm.me","",op);
	}
</script>
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:200px">    
		<div class="row content">
		
			<div class="col-sm-3 sidenav">
			</div>
			
			<div class="col-sm-6 text-left"> 
				<form action="edit.me" name="f" method="post" onsubmit="return inputcheck(this)">
					<table>
						<caption>ȸ�� ���� ����</caption>
							<tr>
								<th>���̵�</th>
								<td>
									<input type="text" name="id" readonly value="${mem.id}">	<!-- readonly value : �������� -->
								</td>
							</tr>
							<tr>
								<td>��й�ȣ</td>
								<td>
									<input type="password" name="password">
								</td>
							</tr>
							<tr>
								<td>�̸�</td>
								<td>
									<input type="text" name="name" value="${mem.name}">
								</td>
							</tr>
							<tr>
								<td>�̸���</td>
								<td colspan="2">
									<input type="text" name="email" value="${mem.email}">
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<input type="submit" value="ȸ������">
									<c:if test="${sessionScope.login != 'admin' || mem.id =='admin'}">
										<input type="button" value="��й�ȣ����" onclick="win_passchg()">
									</c:if>
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