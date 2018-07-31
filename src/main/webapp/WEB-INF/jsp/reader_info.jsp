<%--
  Created by IntelliJ IDEA.
  User: 君行天下
  Date: 2017/7/31
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<c:if test="${!empty succ}">
    <div class="alert alert-success alert-dismissable">
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
            ${succ}
    </div>
</c:if>
<c:if test="${!empty error}">
    <div class="alert alert-danger alert-dismissable">
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
            ${error}
    </div>
</c:if>
<div class="col-xs-5 col-md-offset-3">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                내 정보
            </h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <tr>
                    <th width="20%">독자 ID</th>
                    <td>${readerinfo.readerId}</td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td>${readerinfo.name}</td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td>${readerinfo.sex}</td>
                </tr>
                <tr>
                    <th>생일</th>
                    <td>${readerinfo.birth}</td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>${readerinfo.address}</td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>${readerinfo.telcode}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <a class="btn btn-success btn-sm" href="reader_info_edit.html" role="button">수정</a>
    </div>
</div>


</body>
</html>
