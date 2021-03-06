<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function inputcheck() {
		f = document.f;
		if(f.title.value=="") {
			alert("제목을 입력하세요");
			f.title.focus();
			return;
		}
		if(f.content.value=="") {
			alert("내용을 입력하세요");
			f.content.focus();
			return;
		}
		f.submit();	//form 객체에 submit 발생
	}
</script>
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:200px">    
		<div class="row content">
			<div class="col-sm-3 sidenav">
			</div>
			
			<div class="col-sm-6 text-left"> 
				<form action="write.do?btype=${param.btype}" method="post" name="f">
					<table>
						<caption>게시판 글쓰기</caption>
						<tr>
							<td>제목</td>
							<td>
								<input type="text" name="title">
							</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>
								<input type="text" value="${sessionScope.login}" name="id" readonly> 
							</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>
								<textarea rows="15" name="content" id="content"></textarea>
							</td>
						</tr>
					</table>
					<br><br><br>
					<div style="text-align:center">
						<a href="javascript:inputcheck()"><button type="button" class="btn btn-primary">게시물 등록</button></a>
					</div>
				</form>
				<br><br><br>
			</div>
			
			<div class="col-sm-3 sidenav">
			</div>
		</div>
	</div>
</body>
</html>