<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<link href="../layui/css/layui.css" rel="stylesheet">
</head>
<body style="padding: 2px 2px;margin: 0;">
<%
	if(session.getAttribute("reader")!=null && session.getAttribute("reader_first")!=null &&
        session.getAttribute("reader_first").equals("1")){
		session.setAttribute("reader_first", "2");
		session.setAttribute("reader", session.getAttribute("reader"));
%>
		<script>window.parent.location.href = "01readerLogin.jsp";</script>
<%
	}else{%>
<%}%>
<input  id="parentIframe" type="hidden"  lay-on="test-page-custom" onclick="" value=''/><%--隐藏按钮，自动点击--%>
<div class="layui-carousel" id="ID-carousel-demo-image">
    <div carousel-item>
        <div><img src="../public/image/4.jpg" style="width:100%;height: 800px;"></div>
        <div><img src="../public/image/2.jpg" style="width:100%;height: 800px;"></div>
        <div><img src="../public/image/3.jpg" style="width:100%;height: 800px;"></div>
        <div><img src="../public/image/1.jpg" style="width:100%;height: 800px;"></div>
    </div>
</div>
<script src="../layui/layui.js"></script>
<script type="text/javascript">//条件成立再自动点击
    <%
	if(session.getAttribute("reader")!=null){
}else{%>
//0秒后模拟点击
    setTimeout(function() {
        // IE
        if(document.all) {
            document.getElementById("parentIframe").click();
        }
        // 其它浏览器
        else {
            var e = document.createEvent("MouseEvents");
            e.initEvent("click", true, true);
            document.getElementById("parentIframe").dispatchEvent(e);
        }
    }, 0.5);
<%}%>
</script>
<script>
    layui.use(function(){
        var util = layui.util;
        var carousel = layui.carousel;
        // 渲染 - 图片轮播
        carousel.render({//图片参数
            elem: '#ID-carousel-demo-image',
            width: '100%',
            height: '801px',
            interval: 2000//速度
        });
    });
</script>
<script>//弹出登录框
    layui.use(function(){
        var $ = layui.$;
        var layer = layui.layer;
        var util = layui.util;
        var form = layui.form;

        // 事件
        util.on('lay-on', {
            'test-page-custom': function(){
                $.ajax({
                    url: '../login/loginForm.html',
                    success: function(data) {
                        layer.open({
                            type: 1,
                            area: '350px',
                            resize: false,
                            shadeClose: true,
                            moveOut:false,
                            offset: ['220px', '620px'],
                            title: '读者登录',
                            content: data,
                        });
                    },
                    error: function() {
                        console.log('Error loading login form');
                    }
                });
            }
        })
    });
</script>
</body>
</html>