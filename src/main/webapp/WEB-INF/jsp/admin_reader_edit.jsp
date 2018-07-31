<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>독자 정보 편집《 ${readerInfo.readerId}》</title>
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

<div class="col-xs-6 col-md-offset-3" style="position: relative;top: 10%">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">독자 정보 편집《 ${readerInfo.readerId}》</h3>
        </div>
        <div class="panel-body">
            <form action="reader_edit_do.html?id=${readerInfo.readerId}" method="post" id="readeredit" >

                <div class="input-group">
                    <span  class="input-group-addon">독자 ID</span>
                    <input readonly="readonly" type="text" class="form-control" name="readerId" id="readerId" value="${readerInfo.readerId}">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">이름</span>
                    <input type="text" class="form-control" name="name" id="name" value="${readerInfo.name}" >
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">성별</span>
                    <input type="text" class="form-control" name="sex" id="sex"  value="${readerInfo.sex}" >
                </div>
                <div class="input-group">
                    <span class="input-group-addon">생일</span>
                    <input type="text" class="form-control" name="birth" id="birth"  value="${readerInfo.birth}" >
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">주소</span>
                    <input type="text" class="form-control" name="address" id="address"  value="${readerInfo.address}" >
                </div>
                <div class="input-group">
                    <span class="input-group-addon">전화번호</span>
                    <input type="text" class="form-control" name="telcode" id="telcode" value="${readerInfo.telcode}" >
                </div>
                <input type="submit" value="결정" class="btn btn-success btn-sm" class="text-left">
                <script>
                    function mySubmit(flag){
                        return flag;
                    }
                    $("#readeredit").submit(function () {
                        if($("#name").val()==''||$("#author").val()==''||$("#publish").val()==''||$("#isbn").val()==''||$("#introduction").val()==''||$("#language").val()==''||$("#price").val()==''||$("#pubdate").val()==''||$("#classId").val()==''||$("#pressmark").val()==''||$("#state").val()==''){
                            alert("완전한 독자 정보를 기입하십시오!");
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
