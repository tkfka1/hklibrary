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
<nav  style="position:fixed;z-index: 999;width: 100%;background-color: #fff" class="navbar navbar-default" role="navigation" >
    <div class="container-fluid">
        <div class="navbar-header" style="margin-left: 8%;margin-right: 1%">
            <a class="navbar-brand" href="admin_main.html">도서 관리 시스템</a>
        </div>
        <div class="collapse navbar-collapse" >
            <ul class="nav navbar-nav navbar-left">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        도서 관리
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="allbooks.html">모든 도서</a></li>
                        <li class="divider"></li>
                        <li><a href="book_add.html">도서 추가</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        독자 관리
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="allreaders.html">모든 회원</a></li>
                        <li class="divider"></li>
                        <li><a href="reader_add.html">회원 추가</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        대여 관리
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="lendlist.html">대여 리스트</a></li>
                    </ul>
                </li>
                <li >
                    <a href="admin_repasswd.html" >
                        비밀번호 수정
                    </a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="login.html"><span class="glyphicon glyphicon-user"></span>&nbsp;${admin.adminId}，로그인 됨</a></li>
                <li><a href="logout.html"><span class="glyphicon glyphicon-log-in"></span>&nbsp;로그아웃</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="col-xs-6 col-md-offset-3" style="position: relative;top: 10%">
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
                    <th>저자</th>
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
                    <th>출판날짜</th>
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
            <button onclick="window.open('http://www.aladin.co.kr/shop/wproduct.aspx?isbn=${detail.isbn}','알라딘도서정보','width=860,height=800,location=no,status=no,scrollbars=yes');">알라딘 도서정보</button>
       
        </div>
    </div>

</div>
</body>

</html>
