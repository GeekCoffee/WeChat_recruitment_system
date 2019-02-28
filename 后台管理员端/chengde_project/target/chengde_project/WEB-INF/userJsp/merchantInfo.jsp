<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh" style="font-size: 16px">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <style type="text/css">
        .shopInfo-container{
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        #license-info{
            width: auto;
            height: 26em;
            display: flex;
            flex-direction: row;
            margin-top: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #CFD8DC;
        }
        #license-info>.title{
            text-align: left;
            line-height: 18em;
            margin-left: 240px;
            font-size: 19px;
            width: 120px;
        }
        #license-info>.content{
            width: 50em;
            height: 25em;
            margin-left: 160px;
        }
        #license-info>.content>.license-img{
            width: 16em;
            height: 25em;
        }
        #success-info{
            width: auto;
            height: auto;
            margin-left: 20px;
            line-height: 26em;  /* 值的是文字的行高 */
        }
        #success-info span{
            text-align: center;
            font-size: 19px;
            /*line-height: 50px;*/
        }
        .success-icon{
            color: #44B333;
        }
        .info-container{
            width: auto;
            height:50px;
            display: flex;
            flex-direction: row;
            border-bottom: 1px solid #CFD8DC;
        }
        .info-container .title{
            text-align: left;
            line-height: 50px;
            margin-left: 240px;
            font-size: 19px;
            width: 120px;
        }
        .info-container>.content{
            width: 50em;
            height: 100%;
            margin-left: 160px;
        }
        .info-container>.content>h4{
            line-height: 30px;
        }
        .success-info{
            width: auto;
            height: auto;
            line-height: 50px;  /* 值的是文字的行高 */
            margin-left: 20px;
        }
        .success-info span{
            text-align: center;
            font-size: 19px;
        }


    </style>
</head>
<body>
<c:forEach var="item" items="${merchantInfos}">
<div class="shopInfo-container">
    <div  id="license-info">
        <div class="title">营业执照：</div>
        <div class="content"><img src="${item.merchantImg}" class="license-img img-thumbnail" /></div>
        <div id="success-info">
            <span class="glyphicon glyphicon-ok-circle success-icon">已通过</span>
        </div>
    </div>
    <div  class="info-container">
        <div class="title">商家名称：</div>
        <div class="content">
            <h4>${item.merchantName}</h4>
        </div>
        <div class="success-info">
            <span class="glyphicon glyphicon-ok-circle success-icon">已通过</span>
        </div>
    </div>
    <div  class="info-container">
        <div class="title">主营行业：</div>
        <div class="content">
            <h4>${item.merchantIndustry}</h4>
        </div>
        <div class="success-info">
            <span class="glyphicon glyphicon-ok-circle success-icon" >已通过</span>
        </div>
    </div>
    <div  class="info-container">
        <div class="title">所在地：</div>
        <div class="content">
            <h4>${item.address} &nbsp;&nbsp;${item.addressDetail}</h4>
        </div>
        <div class="success-info">
            <span class="glyphicon glyphicon-ok-circle success-icon" >已通过</span>
        </div>
    </div>
    <div  class="info-container">
        <div class="title">注册年份：</div>
        <div class="content">
            <h4>${item.registerYear}</h4>
        </div>
        <div class="success-info">
            <span class="glyphicon glyphicon-ok-circle success-icon" >已通过</span>
        </div>
    </div>
    <div  class="info-container">
        <div class="title">店铺简介：</div>
        <div class="content">
            <h4>${item.summary}</h4>
        </div>
        <div class="success-info">
            <span class="glyphicon glyphicon-ok-circle success-icon" >已通过</span>
        </div>
    </div>
    <div  class="info-container">
        <div class="title">管理员：</div>
        <div class="content">
            <h4>${item.concatName}</h4>
        </div>
        <div class="success-info">
            <span class="glyphicon glyphicon-ok-circle success-icon" >已通过</span>
        </div>
    </div>
    <div  class="info-container">
        <div class="title">联系电话：</div>
        <div class="content">
            <h4>${item.managerTel}</h4>
        </div>
        <div class="success-info">
            <span class="glyphicon glyphicon-ok-circle success-icon" >已通过</span>
        </div>
    </div>
</div>
</c:forEach>
</body>
</html>