<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��� ����</title>
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:30px">    
		<div class="row content">
			<div class="col-sm-3 sidenav">
			</div>
			
			<div class="col-sm-6 text-left"> 
			
				<form action="deleteReply.do?btype=${param.btype}&boardno=${param.boardno}&replyno=${param.replyno}" name="f" method="post">
					<Strong>����� �����Ͻðڽ��ϱ�?</Strong>
					<input type="submit" value="����">
				</form>
				
			</div>
			
			
			<div class="col-sm-3 sidenav">
			</div>
		</div>
	</div>
</body>
</html>