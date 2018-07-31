<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수정《 ${detail.name}》</title>
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
            <h3 class="panel-title">수정《 ${detail.name}》</h3>
        </div>
        <div class="panel-body">
            <form action="book_edit_do.html?id=${detail.bookId}" method="post" id="addbook" >

                <div class="input-group">
                    <span  class="input-group-addon">제목</span>
                    <input type="text" class="form-control" name="name" id="name" value="${detail.name}">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">저자</span>
                    <input type="text" class="form-control" name="author" id="author" value="${detail.author}" >
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">출판사</span>
                    <input type="text" class="form-control" name="publish" id="publish"  value="${detail.publish}" >
                </div>
                <div class="input-group">
                    <span class="input-group-addon">ISBN</span>
                    <input type="text" class="form-control" name="isbn" id="isbn"  value="${detail.isbn}" >
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">소개</span>
                    <input type="text" class="form-control" name="introduction" id="introduction"  value="${detail.introduction}" >
                </div>
                <div class="input-group">
                    <span class="input-group-addon">언어</span>
                    <input type="text" class="form-control" name="language" id="language" value="${detail.language}" >
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">가격</span>
                    <input type="text" class="form-control" name="price"  id="price" value="${detail.price}">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">출판날짜</span>
                    <input type="text" class="form-control" name="pubdate" id="pubdate" value="${detail.pubdate}">
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">분류 번호</span>
                    <input type="text" class="form-control" name="classId" id="classId" value="${detail.classId}">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">선반 번호</span>
                    <input type="text" class="form-control" name="pressmark" id="pressmark" value="${detail.pressmark}">
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">상태</span>
                    <input type="text" class="form-control" name="state"  id="state" value="${detail.state}">
                </div>
                <input type="submit" value="결정" class="btn btn-success btn-sm" class="text-left">
                <script>
                    function mySubmit(flag){
                        return flag;
                    }
                    $("#addbook").submit(function () {
                        if($("#name").val()==''||$("#author").val()==''||$("#publish").val()==''||$("#isbn").val()==''||$("#introduction").val()==''||$("#language").val()==''||$("#price").val()==''||$("#pubdate").val()==''||$("#classId").val()==''||$("#pressmark").val()==''||$("#state").val()==''){
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
