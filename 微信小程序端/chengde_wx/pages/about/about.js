 var app = getApp();
// var util = require('../../../utils/util.js');
//var jsonData = require('../../jsonData/data.js');
var imgUrls = [app.globalData.geektechBase + "/images/wx_images/main.png", 
app.globalData.geektechBase + "/images/wx_images/en1.png",
app.globalData.geektechBase + "/images/wx_images/en2.png",
app.globalData.geektechBase + "/images/wx_images/en3.png",
app.globalData.geektechBase + "/images/wx_images/en4.png",] ;
var logoUrl = app.globalData.geektechBase + "/images/wx_images/logo.png"
Page({
  data: {
    imgUrls: imgUrls,
    libLogoUrl: logoUrl,
    libName: '诚德人力资源有限公司',
    libIntro: '诚德人力资源有限公司是经公主岭市工商局、公主岭市劳动局批准，依法成立的具有独立从事职业介绍、人事代理、人力资源管理咨询服务、人力资源招聘、人力资源事务代理、人力资源培训、人才测评、高级人才寻访、人力资源外包、人力资源信息网络服务等业务资格的综合服务性公司。我公司本着诚信第一、厚德载物的经营理念, 为用人单位提供招聘、求职等综合服务, 为客户提供科学化、专业化、个性化服务，使企业的人力资源管理适应其总体发展战略。公司为社会务工人员开拓新的职业生涯, 公司凭借高效的服务、专业的团队, 促进人才职业发展。我们将竭诚地为企业寻求更好的人才。通过对人才信息资源的全方位整合, 建立社会人才信息库,长期为众多的优秀企业提供更优秀、更完善的服务。',
    indicatorDots: true,
    autoplay: true,
    interval: 5000,
    duration: 1000,
    bookRecommend: null,
    libname: '',
    phone: '0434-5064666',
    managerName: '诚德人力资源总部',
    managerEmail: '252999338@qq.com',
    address:'吉林省公主岭市经济开发区天成御景小区西门'
  },

  callUp:function(e){
    var phoneNumber = this.data.phone;
      wx.makePhoneCall({
        phoneNumber: phoneNumber
      })
  },


  onShareAppMessage: function (res) {
    return {
      title: '诚德招聘',
      path: '/pages/index/index'
    }
  }
})