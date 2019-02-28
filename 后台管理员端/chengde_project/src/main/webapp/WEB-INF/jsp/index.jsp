<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@include file="header.jsp"%>
    <title>诚德人力资源有限公司</title>
</head>
  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <%--<img src="http://localhost/chengde_project/images/logo.png" class="navbar-brand">--%>
          <a class="navbar-brand" id="libname" href="#">诚德人力资源管理后台</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">

        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row" id="mydiv">
        <div class="col-sm-3 col-md-2 sidebar">
         <div class="placeholder">
              <img src="http://localhost/chengde_project/images/avatar.png" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>诚德公司管理员</h4>
              <span class="text-muted">邮箱：252999338@qq.com</span>
        </div>
          <ul class="nav nav-sidebar">
            <li id="userinfoBtn"><a href="#" onclick="changeiframe('<%=Configure.getGeektechBase()%>info/getCandidateInfo','userinfoBtn')" >查看应聘者申请信息表</a></li>
            <li id="logoutBtn"><a href="#" onclick="logoutOnclick()"  >注 销</a></li>
          </ul>
          </ul>
        </div>
        <iframe id="myiframe" frameborder="none"  style="width: 100%;height: 850px;"></iframe>
      </div>
    </div>
  </body>
  <script type="text/javascript">
    function logoutOnclick(){
        window.location.href = "<%=basePath%>info/toUserLoginPage"
    }
  </script>
<%@include file="footer.jsp"%>
</html>