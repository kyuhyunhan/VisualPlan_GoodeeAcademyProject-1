<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>댓글 삭제</title>
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:30px">    
		<div class="row content">
			<div class="col-sm-3 sidenav">
			</div>
			
			<div class="col-sm-6 text-left"> 
			
				<form action="deleteReply.do?btype=${param.btype}&boardno=${param.boardno}&replyno=${param.replyno}" name="f" method="post">
					<Strong>댓글을 삭제하시겠습니까?</Strong>
					<input type="submit" value="삭제">
				</form>
				
			</div>
			
			
			<div class="col-sm-3 sidenav">
			</div>
		</div>
	</div>
</body>
</html>