package com.geektech.dao;

import com.geektech.entity.ChengdeBasic;
import com.geektech.entity.ChengdeRegister;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by root on 2018/4/6.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"}) //告诉junit，spring配置文
public class ChengdeBasicDaoTest {

    @Resource
    private ChengdeBasicDao chengdeBasicDao;

    @Test
    public void addInfoOne() throws Exception {
        String name = "小蓝";
        String sex = "男";
        int age = 22;
        String position = "金融信托师";
        String phone = "13134439940";
        String speciality = "吉他";
        String salary = "2000";
        String treatment = "五险一金，房补";
        String experience = "以往经历";
        ChengdeRegister register = new ChengdeRegister();
        register.setName(name);
        register.setSex(sex);
        register.setPosition(position);
        register.setAge(age);
        register.setPhone(phone);
        register.setSpeciality(speciality);
        register.setSalary(salary);
        register.setTreatment(treatment);
        register.setExperience(experience);
        int flag = chengdeBasicDao.addInfoOne(register);
        System.out.println("flag = " + flag);

    }

    @Test
    public void delInfoOne() throws Exception {
        int id = 3;
        int delId = chengdeBasicDao.delInfoOne(id);
        System.out.println("delId = " + delId);
    }

    @Test
    public void queryAllInfo() throws Exception {
        List<ChengdeRegister> registerList = chengdeBasicDao.queryAllInfo();
        for (ChengdeRegister register: registerList) {
            System.out.println(register.toString());
        }
    }


    @Test
    public void queryAdminById() throws Exception {
        ChengdeBasic chengdeBasic = chengdeBasicDao.queryAdminById();
        System.out.println(chengdeBasic.toString());

    }

}