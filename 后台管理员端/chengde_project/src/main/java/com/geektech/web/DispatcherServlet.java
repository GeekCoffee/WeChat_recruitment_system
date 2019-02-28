package com.geektech.web;

import com.geektech.entity.ChengdeRegister;
import com.geektech.service.ChengdeBasicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/info")
public class DispatcherServlet  implements ServletConfigAware,ServletContextAware {

    final String root = "chengde2018";
    final String password = "chengde2018";

    @Autowired
    private ChengdeBasicService chengdeBasicService;

    @RequestMapping(value = "/queryAllInfo" , method = RequestMethod.GET)
    @ResponseBody
    public List<ChengdeRegister> queryAllInfo(){
        List<ChengdeRegister> lists = chengdeBasicService.queryAllInfo();
        return lists;
    }


    @RequestMapping(value = "/delInfoOneById" , method = RequestMethod.GET)
    @ResponseBody
    public String  delInfoOne(@RequestParam("userId") String userId){
        System.out.println(userId+"-----");
        int flag = chengdeBasicService.delInfoOne(Integer.parseInt(userId));
        return "success";
    }


    /**
     *
     *

     : ,
     : positionAppliedInput,
     : phoneNameInput,
     : expectedSalaryInput,
     : employeeSkillsInput,
     : experienceInput,
     : treatmentInput
     * @param employeeNameInput
     * @return
     */
    @RequestMapping(value = "/addInfoOne" , method = RequestMethod.POST)
    @ResponseBody
    public String addInfoOne(@RequestParam("employeeNameInput") String employeeNameInput,
                             @RequestParam("employeeSexInput") String employeeSexInput,
                             @RequestParam("employeeAgeInput") String employeeAgeInput,
                             @RequestParam("positionAppliedInput") String positionAppliedInput,
                             @RequestParam("phoneNameInput") String phoneNameInput,
                             @RequestParam("expectedSalaryInput") String expectedSalaryInput,
                             @RequestParam("employeeSkillsInput") String employeeSkillsInput,
                             @RequestParam("experienceInput") String experienceInput,
                             @RequestParam("treatmentInput") String treatmentInput
                             ){
        // 转码工作
        final String ISO_8859_1 = "ISO-8859-1";
        final String UTF_8 = "UTF-8";
        ChengdeRegister register = new ChengdeRegister();

        try{
            employeeNameInput = new String(employeeNameInput.getBytes(ISO_8859_1) , UTF_8);
            employeeSexInput = new String(employeeSexInput.getBytes(ISO_8859_1) , UTF_8);
            employeeAgeInput = new String(employeeAgeInput.getBytes(ISO_8859_1) , UTF_8);
            positionAppliedInput = new String(positionAppliedInput.getBytes(ISO_8859_1) , UTF_8);
            phoneNameInput = new String(phoneNameInput.getBytes(ISO_8859_1),UTF_8);
            expectedSalaryInput = new String(expectedSalaryInput.getBytes(ISO_8859_1),UTF_8);
            employeeSkillsInput = new String(employeeSkillsInput.getBytes(ISO_8859_1),UTF_8);
            experienceInput = new String(experienceInput.getBytes(ISO_8859_1),UTF_8);
            treatmentInput = new String(treatmentInput.getBytes(ISO_8859_1),UTF_8);


//            System.out.println(employeeNameInput);
//            System.out.println(employeeSexInput);
//            System.out.println(employeeAgeInput);
//            System.out.println(positionAppliedInput);
//            System.out.println(phoneNameInput);
//            System.out.println(expectedSalaryInput);
//            System.out.println(employeeSkillsInput);
//            System.out.println(experienceInput);
//            System.out.println(treatmentInput);


            register.setName(employeeNameInput);   // 姓名
            register.setSex(employeeSexInput);   // 性别
            register.setAge(Integer.parseInt(employeeAgeInput));  // 年龄
            register.setPosition(positionAppliedInput);    // 期待职位
            register.setPhone(phoneNameInput);
            register.setSalary(expectedSalaryInput); //期待薪水
            register.setSpeciality(employeeSkillsInput);   // 技能或特长
            register.setExperience(experienceInput);  // 以往经历
            register.setTreatment(treatmentInput);   // 期待待遇
            System.out.println(register.toString());
            int flag = chengdeBasicService.addInfoOne(register);
//            System.out.println("----------  "+flag);

        }catch (Exception e){
            System.out.println(e);
        }

        return "success";
    }

    // 管理员登录
    @RequestMapping(value = "/userLogin" , method = RequestMethod.POST)
    @ResponseBody
    public String userLogin(HttpServletRequest request, @RequestParam("managerTel") String managerTel, @RequestParam("password") String password){
        request.getSession().setAttribute("password",password);
        if(root.equals(managerTel) && password.equals(password)){
            return "success_root";
        }else {
            return "fail";
        }
    }



    @RequestMapping(value = "/toUserLoginPage",method = RequestMethod.GET)
    public String toUserLoginPage(){
        return "userJsp/login";
    }

    @RequestMapping(value = "/toIndexPage",method = RequestMethod.GET)
    public String toUserinfoPage(HttpServletRequest request){
        if(password.equals(request.getSession().getAttribute("password"))){  // 字符串要用 .equals(str)比较
            return "jsp/index";
        }else {
            return "userJsp/login";
        }

    }

    @RequestMapping(value = "/getCandidateInfo" , method = RequestMethod.GET)
    public String getCandidateInfo(Model model){
        List<ChengdeRegister> registers = chengdeBasicService.queryAllInfo();
        model.addAttribute("registers",registers);
        return "jsp/userinfo";
    }


    public void setServletConfig(ServletConfig servletConfig) {

    }

    public void setServletContext(ServletContext servletContext) {

    }
}








