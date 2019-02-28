package com.geektech.service;

/**
 * Created by root on 2018/4/6.
 */

import com.geektech.entity.ChengdeBasic;
import com.geektech.entity.ChengdeRegister;

import java.util.List;

/**
 *  站在使用者的角度设计接口
 */
public interface ChengdeBasicService {

    /**
     * 添加个人应聘者信息
     * @param register
     * @return
     */
    int addInfoOne(ChengdeRegister register);


    /**
     * 通过user_id删除用户信息
     * @param user_id
     * @return
     */
    int delInfoOne(int user_id);


    /**
     * 查询所有人的信息
     * @return
     */
    List<ChengdeRegister> queryAllInfo();


    /**
     * 查询管理员用户名和密码
     * @return
     */
    ChengdeBasic queryAdminById();

}
