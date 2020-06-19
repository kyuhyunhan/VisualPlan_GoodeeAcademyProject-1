<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
	admin은 어차피 이 페이지에 접근할 수 없다. url을 통해 올 수 있으니 보안상 막아둔다
 --%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>정보 수정</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function inputcheck(f) {
		<c:if test="${sessionScope.login != 'admin'}">
			if(f.pass.value == "") {
				alert("비밀번호를 입력하세요");
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
						<caption>회원 정보 수정</caption>
							<tr>
								<th>아이디</th>
								<td>
									<input type="text" name="id" readonly value="${mem.id}">	<!-- readonly value : 수정볼가 -->
								</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td>
									<input type="password" name="password">
								</td>
							</tr>
							<tr>
								<td>이름</td>
								<td>
									<input type="text" name="name" value="${mem.name}">
								</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td colspan="2">
									<input type="text" name="email" value="${mem.email}">
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<input type="submit" value="회원수정">
									<c:if test="${sessionScope.login != 'admin' || mem.id =='admin'}">
										<input type="button" value="비밀번호수정" onclick="win_passchg()">
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