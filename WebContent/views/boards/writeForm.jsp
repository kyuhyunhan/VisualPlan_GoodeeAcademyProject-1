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
			alert("������ �Է��ϼ���");
			f.title.focus();
			return;
		}
		if(f.content.value=="") {
			alert("������ �Է��ϼ���");
			f.content.focus();
			return;
		}
		f.submit();	//form ��ü�� submit �߻�
	}
</script>
</head>
<body>
	<div class="container-fluid text-center" style="margin-top:200px">    
		<div class="row content">
			<div class="col-sm-2 sidenav">
			</div>
			
			<div class="col-sm-8 text-left"> 
				<form action="write.do?btype=${param.btype}" method="post" name="f">
					<table>
						<caption>�Խ��� �۾���</caption>
						<tr>
							<td>����</td>
							<td>
								<input type="text" name="title">
							</td>
						</tr>
						<tr>
							<td>�ۼ���</td>
							<td>
								<input type="text" value="${sessionScope.login}" name="id" readonly> 
							</td>
						</tr>
						<tr>
							<td>����</td>
							<td>
								<textarea rows="15" name="content" id="content"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<a href="javascript:inputcheck()">[�Խù����]</a>
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