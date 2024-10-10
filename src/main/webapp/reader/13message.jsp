<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" id="templatecss" type="text/css" href="../public/css/message.css">
</head>
<body id="home">
		<div class="rain">
			<div class="border start">
				<form action="14subMessage.jsp" method="post">
					<label for="mes" style="margin-left:36%;">留言板</label>
					<textarea id="mes" name="msg" placeholder="请输入您的留言" style="height:70%;width:90%"></textarea><br><br>
                    <div align="center">
                    <button type="submit" class="btn btn-warning" style="margin-left:0">提交</button>&emsp;&emsp;&emsp;
                    <button type="reset" class="btn btn-danger" style="margin-right:0">重置</button>&emsp;&emsp;&emsp;
                    <button type="reset" class="btn btn-info" style="margin-right:0" onClick="location.href='15LookMessage.jsp'">查看留言</button>
					</div>
				</form>
			</div>
		</div>
	</body>
</body>
</html>