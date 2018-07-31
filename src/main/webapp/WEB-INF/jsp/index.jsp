<%--
  Created by IntelliJ IDEA.
  User: 君行天下
  Date: 2017/7/23
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>도서관 홈페이지</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <script src="js/js.cookie.js"></script>
    <style>
        #myCarousel{
            margin-left: 2%;
            width: 60%;
            height: 70%;
            float: left;
            z-index: 999;
            display: inline;
        }
        #login{
            float: left;
           height: 50%;
            width: 23%;
            margin-left: 6%;
            margin-top: 6%;
            display: inline;
            z-index: 999;
        }
        * {
            padding:0;
            margin:0;
        }
    </style>
    <script>
            $(function(){
                $('#myCarousel').carousel({
                    interval: 2000
                })
            });
    </script>
</head>
<body>
<c:if test="${!empty error}">
    <script>
            alert("${error}");
            window.location.href="login.html";
</script>
</c:if>
<h2 style="text-align: center;font-family: 'Adobe 楷体 Std R';color: palevioletred">H.K Books</h2>
<div style="float:right;" id="github_iframe"></div>
<script>
    /**
     * Copyright (c) 2016 hustcc
     * License: MIT
     * Version: %%GULP_INJECT_VERSION%%
     * GitHub: https://github.com/hustcc/canvas-nest.js
     **/
    ! function() {
        //캡슐화 방법, 압축 후 파일 크기 줄이기
        function get_attribute(node, attr, default_value) {
            return node.getAttribute(attr) || default_value;
        }
        //캡슐화 방법, 압축 후 파일 크기 줄이기
        function get_by_tagname(name) {
            return document.getElementsByTagName(name);
        }
        //구성 매개 변수 가져 오기
        function get_config_option() {
            var scripts = get_by_tagname("script"),
                script_len = scripts.length,
                script = scripts[script_len - 1]; //현재 로드 된 script
            return {
                l: script_len, //아이디 생성에 사용되는 길이
                z: get_attribute(script, "zIndex", -1), //z-index
                o: get_attribute(script, "opacity", 0.5), //opacity
                c: get_attribute(script, "color", "0,0,0"), //color
                n: get_attribute(script, "count", 99) //count
            };
        }
        //canvas 너비와 높이 설정
        function set_canvas_size() {
            canvas_width = the_canvas.width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth,
                canvas_height = the_canvas.height = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
        }

        //드로잉 프로세스
        function draw_canvas() {
            context.clearRect(0, 0, canvas_width, canvas_height);
            //라인과 현재 위치의 무작위 배열
            var e, i, d, x_dist, y_dist, dist; //임시 노드
            //모든 지점 이동
            random_points.forEach(function(r, idx) {
                r.x += r.xa,
                    r.y += r.ya, //모바일
                    r.xa *= r.x > canvas_width || r.x < 0 ? -1 : 1,
                    r.ya *= r.y > canvas_height || r.y < 0 ? -1 : 1, //碰到边界，反向反弹
                    context.fillRect(r.x - 0.5, r.y - 0.5, 1, 1); //너비1인 점 그리기
                //다음 시점부터 시작
                for (i = idx + 1; i < all_array.length; i++) {
                    e = all_array[i];
                    // 현재 포인트가 존재
                    if (null !== e.x && null !== e.y) {
                        x_dist = r.x - e.x; //x축 거리 l
                        y_dist = r.y - e.y; //y축 거리 n
                        dist = x_dist * x_dist + y_dist * y_dist; //총 거리, m

                        dist < e.max && (e === current_point && dist >= e.max / 2 && (r.x -= 0.03 * x_dist, r.y -= 0.03 * y_dist), //접근 할 때 가속
                            d = (e.max - dist) / e.max,
                            context.beginPath(),
                            context.lineWidth = d / 2,
                            context.strokeStyle = "rgba(" + config.c + "," + (d + 0.2) + ")",
                            context.moveTo(r.x, r.y),
                            context.lineTo(e.x, e.y),
                            context.stroke());
                    }
                }
            }), frame_func(draw_canvas);
        }
        //캔버스 만들기，본문에 추가
        var the_canvas = document.createElement("canvas"), //캔버스
            config = get_config_option(), //구성
            canvas_id = "c_n" + config.l, //canvas id
            context = the_canvas.getContext("2d"), canvas_width, canvas_height,
            frame_func = window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame || function(func) {
                window.setTimeout(func, 1000 / 45);
            }, random = Math.random,
            current_point = {
                x: null, //현재 마우스 x
                y: null, //현재 마우스 y
                max: 20000 // 원의 반지름의 제곱
            },
            all_array;
        the_canvas.id = canvas_id;
        the_canvas.style.cssText = "position:fixed;top:0;left:0;z-index:" + config.z + ";opacity:" + config.o;
        get_by_tagname("body")[0].appendChild(the_canvas);

        //캔버스 크기 초기화
        set_canvas_size();
        window.onresize = set_canvas_size;
        //마우스 위치는 그 시점에서 저장되고, 떠날 때 현재 위치 정보가 해제됩니다.
        window.onmousemove = function(e) {
            e = e || window.event;
            current_point.x = e.clientX;
            current_point.y = e.clientY;
        }, window.onmouseout = function() {
            current_point.x = null;
            current_point.y = null;
        };
        //임의로 config.n 줄위치 새성
        for (var random_points = [], i = 0; config.n > i; i++) {
            var x = random() * canvas_width, //임의 위치
                y = random() * canvas_height,
                xa = 2 * random() - 1, //무작위 모션 방향
                ya = 2 * random() - 1;
            // 임의의 지점
            random_points.push({
                x: x,
                y: y,
                xa: xa,
                ya: ya,
                max: 6000 //밀착 거리
            });
        }
        all_array = random_points.concat([current_point]);
        //0.1초 후에 그리기
        setTimeout(function() {
            draw_canvas();
        }, 100);
    }();
</script>
<div id="myCarousel" class="carousel slide">
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="item active">
            <img src="img/82839-106.jpg" alt="처음">
        </div>
        <div class="item">
            <img src="img/105905-106.jpg" alt="두번째">
        </div>
        <div class="item">
            <img src="img/296494-106.jpg" alt="세번째">
        </div>

    </div>
    <a class="carousel-control left" href="#myCarousel"
       data-slide="prev">&lsaquo;
    </a>
    <a class="carousel-control right" href="#myCarousel"
       data-slide="next">&rsaquo;
    </a>
</div>
<div class="panel panel-default" id="login">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">로그인하십시오</h3>
    </div>
    <div class="panel-body">
        <div class="form-group">
            <label for="id">아이디</label>
            <input type="text" class="form-control" id="id" placeholder="사용자 이름">
        </div>
        <div class="form-group">
            <label for="passwd">패스워드</label>
            <input type="password" class="form-control" id="passwd" placeholder="사용자 비밀번호">
        </div>
        <div class="checkbox text-left">
            <label>
                <input type="checkbox" id="remember">비밀번호 기억하기
            </label>
            <a style="margin-left: 50px" href="#">비밀번호를 잊으셨습니까?</a>
        </div>

        <p style="text-align: right;color: red;position: absolute" id="info"></p><br/>
        <button id="loginButton"  class="btn btn-primary  btn-block">로그인
        </button>
    </div>
</div>
    <script>
        $("#id").keyup(
            function () {
                if(isNaN($("#id").val())){
                    $("#info").text("도움말 : 계정은 숫자 만 가능합니다.");
                }
                else {
                    $("#info").text("");
                }
            }
        )
        // 로그인 정보 기억하기
        function rememberLogin(username, password, checked) {
            Cookies.set('loginStatus', {
                username: username,
                password: password,
                remember: checked
            }, {expires: 30, path: ''})
        }
        // 로그인 정보를 기억하도록 선택한 경우 페이지를 입력 할 때 로그인 정보를 설정하십시오.
        function setLoginStatus() {
            var loginStatusText = Cookies.get('loginStatus')
            if (loginStatusText) {
                var loginStatus
                try {
                    loginStatus = JSON.parse(loginStatusText);
                    $('#id').val(loginStatus.username);
                    $('#passwd').val(loginStatus.password);
                    $("#remember").prop('checked',true);
                } catch (__) {}
            }
        }

        // 로그인 정보 설정
        setLoginStatus();
        $("#loginButton").click(function () {
            var id =$("#id").val();
            var passwd=$("#passwd").val();
            var remember=$("#remember").prop('checked');

            if( id=='' && passwd==''){
                $("#info").text("도움말 : 계정 및 비밀번호는 비워 둘 수 없습니다.");
            }
            else if ( id ==''){
                $("#info").text("도움말 : 계정 번호는 비워 둘 수 없습니다.");
            }
            else if( passwd ==''){
                $("#info").text("도움말 : 비밀번호는 비워 둘 수 없습니다.");
            }
            else if(isNaN( id )){
                $("#info").text("도움말 : 계정 번호는 숫자 여야합니다.");
            }
            else {
                $.ajax({
                    type: "POST",
                    url: "/api/loginCheck",
                    data: {
                        id:id ,
                        passwd: passwd
                    },
                    dataType: "json",
                    success: function(data) {
                        if(data.stateCode.trim() == "0") {
                            $("#info").text("도움말 : 계정 또는 비밀번호가 잘못되었습니다.");
                        } else if(data.stateCode.trim() == "1") {
                            $("#info").text("팁 : 로그인 성공, 점프 ...");
                            window.location.href="/admin_main.html";
                        } else if(data.stateCode.trim() == "2"){
                            if(remember){
                                rememberLogin(id,passwd,remember);
                            }else {
                                Cookies.remove('loginStatus');
                            }
                            $("#info").text("팁 : 로그인 성공, 점프 .");
                            window.location.href="/reader_main.html";


                        }
                    }
                });
            }
        })

    </script>
</div>

</body>
</html>
