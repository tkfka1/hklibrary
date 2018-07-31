<%--
  Created by IntelliJ IDEA.
  User: 君行天下
  Date: 2017/7/30
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${readercard.name}님 환영합니다.</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <style>
        body{
            background-color: rgb(240,242,245);
        }
    </style>
</head>
<body background="img/281289-106.jpg">
<body>
    <nav class="navbar navbar-default" role="navigation" style="background-color:#fff">
        <div class="container-fluid">
            <div class="navbar-header" style="margin-left: 8%;margin-right: 1%">
                <a class="navbar-brand " href="reader_main.html"><p class="text-primary">내 라이브러리</p></a>
            </div>
            <div class="collapse navbar-collapse" id="example-navbar-collapse">
                <ul class="nav navbar-nav navbar-left">
                    <li class="active">
                        <a href="reader_querybook.html" >
                            도서 검색
                        </a>
                    </li>
                    <li>
                        <a href="reader_info.html" >
                            개인 정보
                        </a>
                    </li>
                    <li >
                        <a href="mylend.html" >
                            내 대출
                        </a>
                    </li>
                    <li >
                        <a href="reader_repasswd.html" >
                            비밀번호 수정
                        </a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="reader_info.html"><span class="glyphicon glyphicon-user"></span>&nbsp;${readercard.name}，로그인중</a></li>
                    <li><a href="login.html"><span class="glyphicon glyphicon-log-in"></span>&nbsp;로그아웃</a></li>
                </ul>
            </div>
        </div>
    </nav>


</body>
</html>
