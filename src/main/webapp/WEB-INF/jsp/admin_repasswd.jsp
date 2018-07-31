<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>비밀번호 변경</title>
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
                            <li><a href="allreaders.html">모든 독자</a></li>
                            <li class="divider"></li>
                            <li><a href="reader_add.html">독자 추가</a></li>
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
<div style="position: relative;top: 15%">
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
</div>
<div class="col-xs-6 col-md-offset-3" style="position: relative;top: 25%">
    <div class="panel panel-primary " >
        <div class="panel-heading">
            <h3 class="panel-title">비밀번호 수정</h3>
        </div>
        <div class="panel-body">
            <form   method="post" action="admin_repasswd_do" class="form-inline"  id="repasswd" >
                <div class="input-group">
                    <input type="password" id="oldPasswd" name="oldPasswd" placeholder="이전 비밀번호" class="form-control"  class="form-control">
                    <input type="password" id="newPasswd" name="newPasswd" placeholder="새로운 비밀번호" class="form-control"  class="form-control">
                    <input type="password" id="reNewPasswd" name="reNewPasswd" placeholder="새로운 비밀번호 재확인" class="form-control"  class="form-control">
                    <em id="tishi" style="color: red"></em>
                    <br/>
                    <span>
                            <input type="submit" value="변경하기" class="btn btn-default">
            </span>
                </div>
            </form>
        </div>
    </div>
</div>

    <script>
        function mySubmit(flag){
            return flag;
        }

        $(document).keyup(function () {
            if($("#newPasswd").val()!=$("#reNewPasswd").val()&&$("#newPasswd").val()!=""&&$("#reNewPasswd").val()!=""&&$("#newPasswd").val().length==$("#reNewPasswd").val().length){
                $("#tishi").text("재입력한 비밀번호가 다른 경우 확인하십시오");
            }
            else {
                $("#tishi").text("");
            }
        })

        $("#repasswd").submit(function () {
            if($("#oldPasswd").val()==''||$("#newPasswd").val()==''||$("#reNewPasswd").val()==''){
                $("#tishi").text("작성하여 제출하십시오.");
                return mySubmit(false);
            }
            else if($("#newPasswd").val()!=$("#reNewPasswd").val()){
                $("#tishi").text("재입력 한 비밀번호가 다릅니다. 확인하십시오.");
                return mySubmit(false);
            }
        })
    </script>

</body>
</html>
