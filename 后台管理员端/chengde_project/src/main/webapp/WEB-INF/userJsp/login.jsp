<%@ page import="com.geektech.data_dictionary.Configure" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="icon" href="http://localhost/chengde_project/images/logo.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>诚德人力资源有限公司</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">

    <link href="../css/login/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/login/gsdk-bootstrap-wizard.css" rel="stylesheet" />

    <link href="../css/login/demo.css" rel="stylesheet" />

    <style>
        .wizard-card .picture-src {
            width: 100%;
            height: 100%;
        }
        #loginDemoBackgroundColor{
            background-color: #01AABD; !important;
        }
    </style>
</head>

<body>
<div class="image-container set-full-height" style="background-image: url('../img/login/sea.jpg')">
    <%--<a href="#/get-shit-done/index.html?ref=get-shit-done-bootstrap-wizard" class="made-with-mk">--%>
        <%--<div class="brand"></div>--%>
        <%--<div class="made-with">  <strong></strong></div>--%>
    <%--</a>--%>
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">
                <div class="wizard-container">
                    <div class="card wizard-card" data-color="orange" id="wizardProfile">
                        <form action="" method="post" >
                            <div class="wizard-header">
                                <h3>
                                    <b>诚德人力资源有限公司</b><br>
                                    <small>后台管理系统</small>
                                </h3>
                            </div>
                            <div class="wizard-navigation">
                                <ul>
                                    <li><a href="#about" data-toggle="tab">管理员登录界面</a></li>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane" id="about">
                                    <div class="row">
                                        <h4 class="info-text">账号登录</h4>
                                        <div class="col-sm-4 col-sm-offset-1">
                                            <div class="picture-container">
                                                <div class="picture">
                                                    <img src="<%=Configure.getGeektechBase()%>images/logo.png" class="picture-src" id="wizardPicturePreview" title=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>管理员账号</label>
                                                <input name="managerTel" id="managerTel" type="text" class="form-control" placeholder="请输入管理员登录帐号" onkeydown="keydown()"/>
                                            </div>
                                            <div class="form-group">
                                                <label>管理员密码</label>
                                                <input name="password" id="password" type="password" class="form-control" placeholder="请输入管理员密码" onkeydown="keydown()"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="wizard-footer height-wizard">
                                <div class="pull-right">
                                    <input type='button' class='btn btn-finish btn-fill btn-warning btn-wd ' name='finish' onclick="userLogin()" value='登 录'/>
                                </div>
                                <div class="pull-left">
                                    <input type='button' class='btn btn-previous btn-fill btn-default btn-wd btn-sm' name='previous' value='Previous' />
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </form>
                    </div>
                </div> <!-- wizard container -->
            </div>
        </div><!-- end row -->
    </div> <!--  big container -->
</div>

<div class="modal fade" tabindex="-1" role="dialog" id="loginErrorModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">登录信息验证失败</h4>
            </div>
            <div class="modal-body">
                <h5 class="text-warning">用户名或密码输入错误，请重新输入。</h5>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关 闭</button>
                <%--<button type="button" class="btn btn-primary">Save changes</button>--%>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>

<script src="../js/login/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="../js/login/bootstrap.min.js" type="text/javascript"></script>
<script src="../js/login/jquery.bootstrap.wizard.js" type="text/javascript"></script>

<script src="../js/login/gsdk-bootstrap-wizard.js"></script>

<script src="../js/login/jquery.validate.min.js"></script>
<script>

    function userLogin(){
        var managerTel = document.getElementById("managerTel").value;
        var password = document.getElementById("password").value;
        $.ajax({
            url:'<%=Configure.getGeektechBase()%>info/userLogin',
            method:'POST',
            data:{
                managerTel:managerTel,
                password:password
            },
            success:function(res){
                if(res == 'success_root'){
                    window.location.href = "<%=basePath%>info/toIndexPage";
                }else if(res == 'fail'){
                    $('#loginErrorModal').modal();
                }
            }
        })
    }

    document.addEventListener("keydown",keydown);
    //键盘监听，注意：在非ie浏览器和非ie内核的浏览器
    //参数1：表示事件，keydown:键盘向下按；参数2：表示要触发的事件
    function keydown(event){
    //表示键盘监听所触发的事件，同时传递传递参数event
        var e = event || window.event || arguments.callee.caller.arguments[0];
        if(e && e.keyCode==13){ // enter 键
            userLogin();   // 调用鼠标点击登录
            //alert('aassd')
        }
    }

//    function enterKey(event){
//        var e = event || window.event || arguments.callee.caller.arguments[0];
//        if(e && e.keyCode==13){ // enter 键
//            userLogin();   // 调用鼠标点击登录
//        }
//    };



</script>

</html>
