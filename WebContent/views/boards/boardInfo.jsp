<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�� �� ����</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../css/main.css">
<style>
	hr{
	    border-top: 1px solid #000 !important;
	}
	
	.row{
	    margin-right: 0px;
	    margin-left: 0px;
	}
	
	.comment{
	    margin-right: 20px;
	    margin-left: 20px; 
	    margin-bottom: 30px;
	}
	
	.head{
	    margin-bottom: 10px;
	}
	
	.memberid{
	    margin-right: 10px;
	}
</style>
<script>
	function inputcheck() {
		f = document.f;
		if(f.comment.value=="") {
			alert("������ �Է��ϼ���");
			f.comment.focus();
			return;
		}
		f.submit();	//form ��ü�� submit �߻�
	}
	function windowopen(page, btype, boardno, replyno) {
		var op = "width=500, height=150, left=500,top=500";
		open(page+".jsp?btype="+btype+"&boardno="+boardno+"&replyno="+replyno,"",op);
	}
</script>
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:200px">    
		<div class="row content">
			<div class="col-sm-3 sidenav">
			</div>
			
			<div class="col-sm-6 text-left"> 
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
				<br>
				<br>
				<div class="pull-right">
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
				
				<br>
				<br>
				<br>
				<br>
				<div class="container">
					<div class="row">
						<h2>| Comments ${replycount} |</h2>
					</div>
					<br>
					<div class="row" id="addcomment">
						<form action="reply.do?btype=${param.btype}&boardno=${param.boardno}" method="post" name="f">
							<input type="hidden" name="id" value="${sessionScope.login}">
							<textarea class="form-control" placeholder="������ �Է��ϼ���" name="comment"></textarea><br>
							<a href="javascript:inputcheck()" class="btn btn-primary pull-right">Send</a>
						</form>
					</div>
					
					<hr>
					<c:if test="${replycount == 0}">
						<div class="comment">
							<p>��ϵ� ����� �����ϴ�.</p>
						</div>
					</c:if>
					<c:if test="${replycount > 0}">
						<c:forEach var="rl" items="${replylist}">
							<div class="comment">
								<div class="head">
									<strong class='memberid'>${rl.id}</strong> <fmt:formatDate value="${rl.replydate}" pattern="yyyy-MM-dd HH:mm"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-default btn-xs">����</button>
									<button class="btn btn-default btn-xs">����</button>
									<%-- <c:if test="${!sessionScope.login.equals(rl.id) && !sessionScope.login.equals('admin')}">
										<input type="button" class="btn btn-default btn-xs" onclick="window.alert('���θ� ������ �� �ֽ��ϴ�.')" value="����"/>
									</c:if>
									<c:if test="${sessionScope.login.equals(rl.id) || sessionScope.login.equals('admin')}">
										<input type="button" class="btn btn-default" onclick="location.href='deleteReplyForm.do?btype=${param.btype}&boardno=${b.boardno}&replyno=${rl.replyno}';" value="����"/>
										<input type="button" class="btn btn-default btn-xs" onclick="javascript:windowopen('deleteReplyForm',${param.btype},${b.boardno},${rl.replyno})" value="����"/>
									</c:if> --%>
								</div>    
								<p>${rl.comment}</p>
							</div>
							<hr>
						</c:forEach>
					</c:if>
					
				</div>
				
			</div>
			
			
			<div class="col-sm-3 sidenav">
			</div>
		</div>
	</div>
</body>
</html>