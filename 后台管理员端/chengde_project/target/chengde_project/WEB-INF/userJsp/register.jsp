<%@ page import="com.geektech.data_dictionary.Configure" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="icon" href="https://static.jianshukeji.com/highcharts/images/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>广州女装服饰有限公司</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">
    <link href="../css/login/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/login/gsdk-bootstrap-wizard.css" rel="stylesheet" />
    <link href="../css/login/demo.css" rel="stylesheet" />
    <script src="../js/login/jquery-2.2.4.min.js" type="text/javascript"></script>
    <script src="../js/jquerySession.js"></script>
    <style>
        .wizard-card .picture-src {
            width: 100%;
            height: 100%;
        }
    </style>
</head>

<body>
<div class="image-container set-full-height" style="background-image: url('../img/login/sea.jpg')">
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">
                <div class="wizard-container">
                    <div class="card wizard-card" data-color="orange" id="wizardProfile">
                        <form method="post" action="/blouseShop_system/info/registerMerchantInfo">
                            <!--        You can switch ' data-color="orange" '  with one of the next bright colors: "blue", "green", "orange", "red"          -->
                            <div class="wizard-header">
                                <h3>
                                    <b>注册</b>您商铺的资料<br>
                                    <small>商家入驻信息注册</small>
                                </h3>
                            </div>
                            <div class="wizard-navigation">
                                <ul>
                                    <li><a href="#about" data-toggle="tab">基础资料</a></li>
                                    <li><a href="#address" data-toggle="tab">登录资料</a></li>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane" id="about">
                                    <div class="row">
                                        <h4 class="info-text">开始注册</h4>
                                        <div class="col-sm-4 col-sm-offset-1">
                                            <div class="picture-container">
                                                <div class="picture">
                                                    <img src="<%=Configure.getGeektechBase()%>images/logo.svg" class="picture-src" id="wizardPicturePreview" title=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>公司名<small>(与在微信小程序中申请的商铺名一致)</small></label>
                                                <input id="merchantName" name="merchantName" type="text" class="form-control" placeholder="请输入商铺或者公司名称" required="true" />
                                            </div>
                                            <div class="form-group">
                                                <label>手机号<small>(必填项)</small></label>
                                                <input id="managerTel" name="managerTel" type="text" class="form-control" placeholder="请输入手机号码" id="cardId" required="true" />
                                            </div>
                                        </div>
                                        <div class="col-sm-10 col-sm-offset-1">
                                            <div class="form-group">
                                                <label>QQ <small>(必填)</small></label>
                                                <input id="QQ" name="QQ" type="text" class="form-control" placeholder="请输入QQ号码" required="true" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="address">
                                    <div class="row">
                                        <div class="col-sm-7 col-sm-offset-1">
                                            <div class="form-group">
                                                <label>登录密码</label>
                                                <input id="password" type="password" class="form-control" placeholder="请输入登录密码" name="password" required="true" />
                                            </div>
                                        </div>
                                        <div class="col-sm-7 col-sm-offset-1">
                                            <div class="form-group">
                                                <label>重复密码</label>
                                                <input type="password" class="form-control" placeholder="重复登录密码" id="passwordTwo" required="true" />
                                            </div>
                                        </div>
                                        <div class="col-sm-7 col-sm-offset-1">
                                            <div class="form-group">
                                                <label>管理员姓名</label>
                                                <input id="managerName" type="text" class="form-control" placeholder="请输入管理员姓名" name="company" required="true" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="wizard-footer height-wizard">

                                <div class="pull-right">
                                    <input type='button' class='btn btn-next btn-fill btn-warning btn-wd btn-sm' name='next' value='下一个' />
                                    <input type='button' class='btn btn-finish btn-fill btn-warning btn-wd btn-sm' name='finish' value='完成'
                                           onclick="register()"/>
                                </div>

                                <div class="pull-left">
                                    <input type='button' class='btn btn-previous btn-fill btn-default btn-wd btn-sm' name='previous' value='上一个' />
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

<div class="modal fade" tabindex="-1" role="dialog" id="registerErrorModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">商家申请入驻信息注册</h4>
            </div>
            <div class="modal-body">
                <h5 class="text-danger">此商铺名与微信小程序上申请的商铺名不一致。</h5>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="modal fade" tabindex="-1" role="dialog" id="registerSuccessModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">商家申请入驻信息注册</h4>
            </div>
            <div class="modal-body">
                <h5 class="text-success">恭喜您！此商铺已成功入驻！</h5>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" tabindex="-1" role="dialog" id="passwordNotMatchModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">两次密码不匹配</h4>
            </div>
            <div class="modal-body">
                <h5 class="text-danger">您输入的登录密码和重复密码不匹配，请您重新输入。</h5>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
    function register(){
        var merchantName = document.getElementById("merchantName").value;
        var managerTel = document.getElementById("managerTel").value;
        var QQ = document.getElementById("QQ").value;
        var password = document.getElementById("password").value;
        var passwordTwo = document.getElementById("passwordTwo").value;
        if(password == passwordTwo){
            $.ajax({
                url:'<%=Configure.getGeektechBase()%>info/registerMerchantInfo',
                method:'post',
                data:{
                    merchantName:merchantName,
                    managerTel:managerTel,
                    password:password,
                    QQ:QQ
                },
                success:function(res){
                    if(res == 'success'){
                        $('#registerSuccessModal').modal();
                        window.location.href = "<%=basePath%>info/toUserLoginPage";
                    }else if(res == 'fail'){
                        $('#registerErrorModal').modal();
                    }
                }
            })
        }else{
            $('#passwordNotMatchModal').modal();
            document.getElementById("password").value = "";
            document.getElementById("passwordTwo").value = "";
        }
    }
</script>
</html>
