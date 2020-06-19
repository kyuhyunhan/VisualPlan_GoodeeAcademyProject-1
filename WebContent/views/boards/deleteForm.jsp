<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 삭제</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:200px">    
		<div class="row content">
			<div class="col-sm-2 sidenav">
			</div>
			
			<div class="col-sm-8 text-left"> 
				<form action="delete.do?btype=${param.btype}&boardno=${param.boardno}" name="f" method="post">
					<table>
						<caption>게시글 삭제 화면</caption>
						<tr>
							<td>삭제하시겠습니까?</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="삭제">
							</td>
						</tr>
					</table>
				</form>
			</div>
			
			<div class="col-sm-2 sidenav">
			</div>
		</div>
	</div>
</body>
</html>