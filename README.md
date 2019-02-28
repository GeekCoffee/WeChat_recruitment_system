## 微信小程序招聘系统(微信端+web后台管理)  --  长春极客科技有限公司外包项目 
### 微信小程序端(功能简介)
![人员信息录入页](https://github.com/GeekCoffee/WeChat_recruitment_system/blob/master/demo_pic/demo1.png
)
![企业信息介绍页](https://github.com/GeekCoffee/WeChat_recruitment_system/blob/master/demo_pic/demo2.png
)
- 面试人员的个人电子简历录入功能
- 长春诚德公司人力资源公司的介绍【滚动图+文字】
- 拨打公司电话功能

### web后台管理端(功能简介)
![管理员登录页面](https://github.com/GeekCoffee/WeChat_recruitment_system/blob/master/demo_pic/demo3.png
)
![后台管理页面](https://github.com/GeekCoffee/WeChat_recruitment_system/blob/master/demo_pic/demo1.png
)
- 管理员登录页面：防止get登录、用户名或密码正确性检测、回车登录功能
- 后台管理页面：删除人员功能、搜索功能【支持模糊搜索】、注销功能

#### 使用说明
```
    1、数据库：数据库的所有SQL语言都写在了<font color="green">【后台管理员端\chengde_project\src\main\sqlschema.sql】</font>文件中，相关SQL注释已经写好
    2、后台程序：因为项目是用<font color="cyan">maven构建</font>的，所以所有依赖包都在<font color="green"> pom.xml </font>中，用<font color="green">IntelliJ IED工具 </font>打开这个<font color="green"> pom.xml 文件</font>就可以了
    3、后台程序目录：在<font color="green">【后台管理员端\chengde_project\src\main】</font>里面
    4、微信小程序：会开发小程序的人应该都知道怎么打开一个微信小程序的，这不用多说了吧 嘻嘻~~
    5、还有不懂的就在<font color="red"> “项目说明文档” </font>里面找吧，一般的问题都能解决
```
<font color="green">【后台管理员端\chengde_project\src\main\sqlschema.sql】</font>

#### 相关技术介绍
* 微信小程序开发技术：包括WXML、WXSS、json配置、原生js
* 使用了高并发技术架构SSM框架(spring + springMVC + mybatis)
* 使用了maven管理工具
* 数据库使用的是mysql数据库
