<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>《 ${detail.name}》</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <style>
        body{
            background-color: rgb(240,242,245);
        }
    </style>
</head>
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

<div class="col-xs-6 col-md-offset-3" style="position: relative;top: 3%">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">《 ${detail.name}》</h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <tr>
                    <th width="15%">제목</th>
                    <td>${detail.name}</td>
                </tr>
                <tr>
                    <th>작가</th>
                    <td>${detail.author}</td>
                </tr>
                <tr>
                    <th>출판사</th>
                    <td>${detail.publish}</td>
                </tr>
                <tr>
                    <th>ISBN</th>
                    <td>${detail.isbn}</td>
                </tr>
                <tr>
                    <th>소개</th>
                    <td>${detail.introduction}</td>
                </tr>
                <tr>
                    <th>언어</th>
                    <td>${detail.language}</td>
                </tr>
                <tr>
                    <th>가격</th>
                    <td>${detail.price}</td>
                </tr>
                <tr>
                    <th>출판일자</th>
                    <td>${detail.pubdate}</td>
                </tr>
                <tr>
                    <th>분류번호</th>
                    <td>${detail.classId}</td>
                </tr>
                <tr>
                    <th>책장번호</th>
                    <td>${detail.pressmark}</td>
                </tr>
                <tr>
                    <th>상태</th>
                    <c:if test="${detail.state==1}">
                        <td>대출안됨</td>
                    </c:if>
                    <c:if test="${detail.state==0}">
                        <td>대출됨</td>
                    </c:if>

                </tr>
                </tbody>
            </table>
        </div>
    </div>

</div>

</body>
</html>
