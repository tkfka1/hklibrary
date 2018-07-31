
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
<div class="col-xs-5 col-md-offset-3">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                정보 수정
            </h3>
        </div>
        <div class="panel-body">
            <form action="reader_edit_do_r.html" method="post" id="edit" >

                <div class="input-group">
                    <span  class="input-group-addon">독자 ID</span>
                    <input type="text" readonly="readonly" class="form-control" name="readerId" id="readerId" value="${readerinfo.readerId}">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">이름</span>
                    <input type="text" class="form-control" name="name" id="name" value="${readerinfo.name}" >
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">성별</span>
                    <input type="text" class="form-control" name="sex" id="sex"  value="${readerinfo.sex}" >
                </div>
                <div class="input-group">
                    <span class="input-group-addon">생일</span>
                    <input type="text" class="form-control" name="birth" id="birth"  value="${readerinfo.birth}" >
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">주소</span>
                    <input type="text" class="form-control" name="address" id="address"  value="${readerinfo.address}" >
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">전화번호</span>
                    <input type="text" class="form-control" name="telcode" id="telcode"  value="${readerinfo.telcode}" >
                </div>
                <br/>
                <input type="submit" value="결정" class="btn btn-success btn-sm" class="text-left">
                <script>
                    function mySubmit(flag){
                        return flag;
                    }
                    $("#edit").submit(function () {
                        if($("#name").val()==''||$("#sex").val()==''||$("#birth").val()==''||$("#address").val()==''||$("#telcode").val()==''){
                            alert("전체 도서 정보를 기입하십시오!");
                            return mySubmit(false);
                        }
                    })
                </script>
            </form>
        </div>
    </div>
</div>


</body>
</html>
