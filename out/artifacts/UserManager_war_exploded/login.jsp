<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>管理员登录</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        //切换验证码
        function refreshCode(){
            //1.获取验证码图片对象
            var vcode = document.getElementById("vcode");

            //2.设置其src属性，加时间戳
            vcode.src = "${pageContext.request.contextPath}/checkCodeServlet?time="+new Date().getTime();
        }

    </script>
    <style type="text/css">
       /*body{background-color: #5bc0de;}*/
        .bor{  border:3px solid #a94442;}
   </style>
</head>
<body>
<div class="container" class="bor" style="width: 400px; height: 500px;">
    <h3 style="text-align: center; color: #5bc0de">管理员登录</h3>
    <form action="${pageContext.request.contextPath}/loginServlet" method="post">
        <div class="form-group">
            <label for="user" style="color: #5bc0de">用户名：</label>
            <input style="border: 1px solid #0f0f0f;" type="text" name="username" class="form-control" id="user" placeholder="请输入用户名"/>
        </div>

        <div class="form-group">
            <label for="password" style="color: #5bc0de">密码：</label>
            <input style="border: 1px solid #0f0f0f;" type="password" name="password" class="form-control" id="password" placeholder="请输入密码"/>
        </div>

        <div class="form-inline">
            <label for="vcode" style="color: #5bc0de">验证码：</label>
            <input style="border: 1px solid #0f0f0f;" type="text" name="verifycode" class="form-control" id="verifycode" placeholder="请输入验证码" style="width: 120px;"/>
            <a href="javascript:refreshCode();">
                <img src="${pageContext.request.contextPath}/checkCodeServlet" title="看不清点击刷新" id="vcode"/>
            </a>
        </div>
        <hr/>
       
        <div class="form-group" style="text-align: left;">
            <input class="btn btn btn-primary" type="submit" value="登录">
           <a href="${pageContext.request.contextPath}/index.html"><input class="btn btn-primary"  style="text-align: center; width: 55px;"  value="返回"></a>
        </div>
    </form>

    <!-- 出错显示的信息框 -->
    <div class="alert alert-warning alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" >
            <span>&times;</span>
        </button>
        <strong>${login_msg}</strong>
    </div>
</div>
</body>
</html>