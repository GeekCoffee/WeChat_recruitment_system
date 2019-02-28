<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@include file="header.jsp"%>
    <title>诚德人力资源有限公司</title>
</head>
  <body>
      <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main toTop">
        <h2 class="sub-header">微信应聘者信息列表</h2>
          <div class="table-responsive">
            <table class="table table-striped table-hover" id="userinfo_table">
              <thead>
                <tr>
                    <th>应聘者姓名</th>
                    <th>应聘者性别</th>
                    <th>应聘者年龄</th>
                    <th>应聘职位</th>
                    <th>联系电话</th>
                    <th>期望工资</th>
                    <th>特长或技能</th>
                    <th>以往经历</th>
                    <th>期望待遇</th>
                    <th>操作</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="item" items="${registers}">
              <tr>
                  <td >${item.name}</td>
                  <td >${item.sex}</td>
                  <td >${item.age}岁</td>
                  <td >${item.position}</td>
                  <td >${item.phone}</td>
                  <td >${item.salary}</td>
                  <td >${item.speciality}</td>
                  <td >${item.experience}</td>
                  <td >${item.treatment}</td>
                  <td >&nbsp;<button class="btn btn-danger" onclick="showDelModal(${item.userid})">删 除</button></td>
              </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

      <div class="modal fade" tabindex="-1" role="dialog" id="delGoodsInfoModal">
          <div class="modal-dialog" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <h4 class="modal-title">信息变更提示</h4>
                  </div>
                  <div class="modal-body">
                      <h4 class="text-danger">信息删除后不可恢复，您是否确定删除？</h4>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-primary" onclick="delGoodsOnclick(userId)" data-dismiss="modal">是的</button>
                      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                  </div>
              </div><!-- /.modal-content -->
          </div><!-- /.modal-dialog -->
      </div><!-- /.modal -->

      <div class="modal fade" tabindex="-1" role="dialog" id="delGoodsOk">
          <div class="modal-dialog modal-lg" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <h4 class="modal-title">信息通知</h4>
                  </div>
                  <div class="modal-body">
                      <h4 class="text-success">已成功删除此用户的信息！</h4>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal" onclick="reloadPage()">关闭</button>
                  </div>
              </div><!-- /.modal-content -->
          </div><!-- /.modal-dialog -->
      </div><!-- /.modal -->

  </body>
<script type="text/javascript" >
    var userId = null;
    function showDelModal(id){
        userId = id;
        $("#delGoodsInfoModal").modal();
    }

    function delGoodsOnclick(id){
        $.ajax({
            url:'<%=Configure.getGeektechBase()%>info/delInfoOneById',
            method:'get',
            data:{
                userId:id
            },
            success:function(res){
                if(res == 'success'){
                    $('#delGoodsOk').modal();
                }
            }
        })
    }

    // 页面刷新
    function reloadPage(){
        window.location.reload();
    }

</script>
   <%@include file="footer.jsp"%>
</html>
      