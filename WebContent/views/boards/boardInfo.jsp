<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�� �� ����</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:200px">    
		<div class="row content">
			<div class="col-sm-2 sidenav">
			</div>
			
			<div class="col-sm-8 text-left"> 
				<table>
					<caption>�Խù� �� ����</caption>
					<tr>
						<th width="20%">�ۼ���</th>
						<td width="80%" style="text-align:left">${b.id}</td>
					</tr>
					<tr>
						<th>����</th>
						<td style="text-align:left">${b.title}</td>
					</tr>
					<tr>
						<th>����</th>
						<td>
							<table style="width:100%; height:250px;">
								<tr>
									<td style="border-width: 0px; vertical-align: top; text-align: left">${b.content}</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<c:if test="${!sessionScope.login.equals(b.id) && !sessionScope.login.equals('admin')}">
					<input type="button" class="btn btn-default" onclick="window.alert('���θ� ������ �� �ֽ��ϴ�.')" value="����"/>
				</c:if>
				<c:if test="${sessionScope.login.equals(b.id) || sessionScope.login.equals('admin')}">
					<input type="button" class="btn btn-default" onclick="location.href='editForm.do?btype=${param.btype}&boardno=${b.boardno}';" value="����"/>
				</c:if>
				<c:if test="${!sessionScope.login.equals(b.id) && !sessionScope.login.equals('admin')}">
					<input type="button" class="btn btn-default" onclick="window.alert('���θ� ������ �� �ֽ��ϴ�.')" value="����"/>
				</c:if>
				<c:if test="${sessionScope.login.equals(b.id) || sessionScope.login.equals('admin')}">
					<input type="button" class="btn btn-default" onclick="location.href='deleteForm.do?btype=${param.btype}&boardno=${b.boardno}';" value="����"/>
				</c:if>
				<c:if test="${b.btype==1}">
					<input type="button" class="btn btn-default" onclick="location.href='notice.do?btype=1';" value="���"/>
				</c:if>
				<c:if test="${b.btype==2}">
					<input type="button" class="btn btn-default" onclick="location.href='freeBoard.do?btype=2';" value="���"/>
				</c:if>
			</div>
			
			<div class="col-sm-2 sidenav">
			</div>
		</div>
	</div>
</body>
</html>