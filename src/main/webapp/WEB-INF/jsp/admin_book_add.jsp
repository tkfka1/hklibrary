<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>도서 정보 추가됨</title>
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

<div style="position: relative;top: 10%;width: 80%;margin-left: 10%">
            <form action="book_add_do.html" method="post" id="addbook" >
                <div class="form-group">
                    <label for="name">도서명</label>
                    <input type="text" class="form-control" name="name" id="name" placeholder="제목을 입력하십시오.">
                </div>
                <div class="form-group">
                    <label for="author">저자</label>
                    <input type="text" class="form-control" name="author" id="author"  placeholder="작성자 이름을 입력하십시오.">
                </div>
                <div class="form-group">
                    <label for="publish">출판사</label>
                    <input type="text" class="form-control"  name="publish" id="publish"  placeholder="출판사 이름을 입력하십시오.">
                </div>
                <div class="form-group">
                    <label for="isbn">ISBN</label>
                    <input type="text" class="form-control" name="isbn" id="isbn"  placeholder="ISBN을 입력하십시오.">
                </div>
                <div class="form-group">
                    <label for="introduction">소개</label>
                    <textarea class="form-control" rows="3"  name="introduction" id="introduction" placeholder="소개를 입력하십시오."></textarea>
                </div>
                <div class="form-group">
                    <label for="language">언어</label>
                    <input type="text" class="form-control" name="language" id="language"  placeholder="언어를 입력하십시오.">
                </div>
                <div class="form-group">
                    <label for="price">가격</label>
                    <input type="text" class="form-control"  name="price"  id="price" placeholder="가격을 입력하십시오.">
                </div>
                <div class="form-group">
                    <label for="pubdate">출판일</label>
                    <input type="text" class="form-control"  name="pubdate" id="pubdate"   placeholder="출판 날짜를 입력하십시오.">
                </div>
                <div class="form-group">
                    <label for="classId">분류 번호</label>
                    <input type="text" class="form-control" name="classId" id="classId"  placeholder="분류번호를 입력하십시오.">
                </div>
                <div class="form-group">
                    <label for="pressmark">책장 번호</label>
                    <input type="text" class="form-control"  name="pressmark" id="pressmark" placeholder="책장 번호를 입력하십시오.">
                </div>
                <div class="form-group">
                    <label for="state">상태</label>
                    <input type="text" class="form-control"  name="state"  id="state"   placeholder="도서 상태를 입력하십시오.">
                </div>


                <input type="submit" value="추가" class="btn btn-success btn-sm" class="text-left">
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



</body>
</html>
