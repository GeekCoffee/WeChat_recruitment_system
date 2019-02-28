//index.js
//获取应用实例
const app = getApp()

Page({

  /**
   * 页面的初始数据
   */
  data: {
    imgSrc: '/pages/images/license.jpg',
    uploadFilePath: '/pages/images/license.jpg',
    topImg: app.globalData.geektechBase+"/images/wx_images/100.png", 
    employeeNameInput: '',
    employeeSexInput: '',      
    employeeAgeInput: '',     
    positionAppliedInput: '',
    phoneNameInput: '',   
    expectedSalaryInput:'',
    employeeSkillsInput: '',   
    experienceInput: '',
    treatment:''
  },
 
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

  },

  protocol: function () {
    wx.showModal({
      title: '入驻协议',
      content: '这是入驻协议',
      success: function (res) {
        if (res.confirm) {

        } else if (res.cancel) {

        }
      }
    })
  },
  employeeNameInput: function (e)     //应聘者姓名
  {
    var employeeName = e.detail.value;
    this.setData(
      {
        employeeNameInput: employeeName
      }
    )
    // try {
    //   wx.setStorageSync('employeeName', employeeName)
    // } catch (e) {
    //   console.log('employeeName setStorageSync try-catch ');
    // }

  },

  employeeSexInput: function (e) {          //应聘者性别

    var sex = e.detail.value;
    this.setData(
      {
        employeeSexInput: sex
      }
    )
    // try {
    //   wx.setStorageSync('employeeSex', employeeSex)
    // } catch (e) {
    //   console.log('employeeSex setStorageSync try-catch ');
    // }

  },


  employeeAgeInput: function (e)     //应聘者年龄
  {
    var employeeAgeInput = e.detail.value;
    this.setData(
      {
        employeeAgeInput: employeeAgeInput
      }
    )
    // try {
    //   wx.setStorageSync('employeeAge', employeeAgeInput)
    // } catch (e) {
    //   console.log('employeeAgeInput setStorageSync try-catch ');
    // }


  },

  positionAppliedInput: function (e)     //应聘者职位
  {
    var positionAppliedInput = e.detail.value;
    this.setData(
      {
        positionAppliedInput: positionAppliedInput
      }
    )
    // try {
    //   wx.setStorageSync('positionApplied', positionApplied)
    // } catch (e) {
    //   console.log('positionApplied setStorageSync try-catch ');
    // }
  },

  phoneNameInput: function (e)   //应聘者手机号
  {
    var phoneNameInput = e.detail.value;
    this.setData(
      {
        phoneNameInput: phoneNameInput
      }
    )
    // try {
    //   wx.setStorageSync('phoneName', phoneNameInput)
    // } catch (e) {
    //   console.log('phoneNameInput setStorageSync try-catch ');
    // }
    
  },

  expectedSalaryInput: function (e)     //应聘者期望得到的工资
  {
    var expectedSalaryInput = e.detail.value;
    this.setData(
      {
        expectedSalaryInput: expectedSalaryInput
      }
    )
    // try {
    //   wx.setStorageSync('expectedSalary', expectedSalaryInput)
    // } catch (e) {
    //   console.log('expectedSalaryInput setStorageSync try-catch ');
    // }
    
  },

  employeeSkillsInput: function (e)     // 应聘者的技能描述
  {
    var employeeSkillsInput = e.detail.value;
    this.setData(
      {
        employeeSkillsInput: employeeSkillsInput
      }
    )
    // console.log('---'+employeeSkillsInput)
  },

  experienceInput:function(e){      // 应聘者的经历描述
    var experienceInput = e.detail.value;
    this.setData({
      experienceInput: experienceInput
    })
  },

  treatmentInput:function(e){
    var treatmentInput = e.detail.value;
    this.setData({
      treatmentInput:treatmentInput
    })
  },



  submit: function (e) {
    var employeeNameInput = this.data.employeeNameInput;     // 姓名
    var employeeSexInput = this.data.employeeSexInput;      // 性别
    var employeeAgeInput = this.data.employeeAgeInput;     // 年龄
    var positionAppliedInput = this.data.positionAppliedInput;   // 职位
    var phoneNameInput = this.data.phoneNameInput;   // 手机号

    var expectedSalaryInput = this.data.expectedSalaryInput;   // 期望工资
    var employeeSkillsInput = this.data.employeeSkillsInput;   // 技能描述 
    var experienceInput = this.data.experienceInput;   // 曾经经历

    var treatmentInput = this.data.treatmentInput;   // 期望待遇

    

    // if (!employeeNameInput){
    //   console.log(employeeNameInput+" adsasd ");
    // }

    // if (!employeeNameInput || employeeNameInput == undefined ||
    //   !employeeSexInput == '' || employeeSexInput == undefined ||
    //   !employeeAgeInput == '' || employeeAgeInput == undefined ||
    //   !positionAppliedInput == '' || positionAppliedInput == undefined ||
    //   !phoneNameInput == '' || phoneNameInput == undefined ||
    //   !expectedSalaryInput == '' || expectedSalaryInput == undefined ||
    //   !employeeSkillsInput == '' || employeeSkillsInput == undefined ||
    //   !experienceInput == '' || experienceInput == undefined ||
    //   !treatmentInput == '' || treatmentInput == undefined){
    //     // console.log('您的信息填写不完整')

    //   wx.showModal({
    //     title: '温馨提示',
    //     content: '您的信息填写不完整，请您继续完善信息',
    //     success: function (res) {
    //       if (res.confirm) {
    //         console.log('用户点击确定')
    //       } else if (res.cancel) {
    //         console.log('用户点击取消')
    //       }
    //     }
    //   })
      
    //   }  // if-end


    if (!employeeNameInput ||
       !employeeSexInput  || 
      !employeeAgeInput  || 
      !positionAppliedInput  || 
      !phoneNameInput  || 
      !expectedSalaryInput  || 
      !employeeSkillsInput || 
      !experienceInput  || 
      !treatmentInput) {
      // console.log('您的信息填写不完整')

      wx.showModal({
        title: '温馨提示',
        content: '您的信息填写不完整，请您继续完善信息'
      })

    }else{

       // application/json

       

      

      //信息已经填写完毕
      var that = this;
      wx.showModal({
        title: '发送提示',
        content: '您是否确定提交申请表信息？',
        success: function (res) {
          if (res.confirm) {
            if (res.confirm == true) {
              wx.request({
                url: app.globalData.geektechBase + '/info/addInfoOne',
                method: 'post',
                data: {
                  employeeNameInput: employeeNameInput,
                  employeeSexInput: employeeSexInput,
                  employeeAgeInput: employeeAgeInput,
                  positionAppliedInput: positionAppliedInput,
                  phoneNameInput: phoneNameInput,
                  expectedSalaryInput: expectedSalaryInput,
                  employeeSkillsInput: employeeSkillsInput,
                  experienceInput: experienceInput,
                  treatmentInput: treatmentInput
                },
                header: {
                  'content-type':'application/x-www-form-urlencoded'
                },
                success: function (res) {
                  if (res.data == 'fail') {
                    wx.showToast({
                      title: '该电话已存在，请重新输入',
                      icon:'none',
                      duration: 2500
                    })
                  }else if (res.data == 'success') {
                    wx.showToast({
                      title: '职位申请成功',
                      duration: 2500
                    })

                    that.setData({
                      employeeNameInput: '',
                      employeeSexInput: '',
                      employeeAgeInput: '',
                      positionAppliedInput: '',
                      phoneNameInput: '',
                      expectedSalaryInput: '',
                      employeeSkillsInput: '',
                      experienceInput: '',
                      treatmentInput: ''
                    })

                  }
                }
              })
            }
          } else if (res.cancel) {

          }
        }
      })

    }  // if-end

   






  //   var that = this;
  //   var filePath = this.data.uploadFilePath;
  //   var name = 'uploadfile';
  //   wx.uploadFile({
  //     url: app.globalData.geektechBase + '/info/uploadMerchantImg',
  //     filePath: filePath,
  //     name: name,
  //     method: 'post',
  //     header: {
  //       'content-type': 'multipart/form-data'
  //     }
  //   })

   

   
  // },

  // chooseImg: function (e) {
  //   var that = this;
  //   wx.chooseImage({
  //     count: 1,
  //     sizeType: ['original', 'compressed'],
  //     sourceType: ['album', 'camera'],
  //     success: function (res) {
  //       var tempFilePath = res.tempFiles[0].path;
  //       var uploadFilePath = res.tempFilePaths[0];
  //       that.setData({
  //         imgSrc: tempFilePath,
  //         uploadFilePath: uploadFilePath
  //       })
  //     }
  //   })
  }




})