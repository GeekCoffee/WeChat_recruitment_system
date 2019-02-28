var jsonData = {
          table_header:'图书管理',
           th1:'缩略图',
           th2:'书名',
           th3:'作者',
           th4:'分类',
           th5:'页数',
           th6:'ISBN',
           th7:'出版社',
           th8:'藏书量',
           th9:'价格'
 }

var app = new Vue({
        el:'#mydiv',
        data:jsonData,
        methods:{
          manageUsers:function(e){
            this.table_header = '用户管理'
            this.th1 = '微信头像'
            this.th2 = '微信用户名'
            this.th3 = '真实姓名'
            this.th4 = '手机号'
            this.th5 = '所借书籍-1'
            this.th6 = '所借书籍-2'
            this.th7 = '开始时间'
            this.th8 = '归还时间'
            this.th9 = '图书馆'
          },
          manageBooks:function(e){
            this.table_header = '图书管理'
            this.th1='缩略图'
            this.th2='书名'
            this.th3='作者'
            this.th4='分类'
            this.th5='页数'
            this.th6='ISBN'
            this.th7='出版社'
            this.th8='藏书量'
            this.th9='价格'
          }
        }
    })