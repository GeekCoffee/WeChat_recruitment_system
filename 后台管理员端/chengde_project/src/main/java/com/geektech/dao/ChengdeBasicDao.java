package com.geektech.dao;

import com.geektech.entity.ChengdeBasic;
import com.geektech.entity.ChengdeRegister;

import java.util.List;

/**
 * Created by root on 2018/4/6.
 */
public interface ChengdeBasicDao {

    /**
     * 应聘人员填写信息
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

//    /**
//     * 通过user_id修改用户信息
//     * @param user_id
//     * @param register
//     * @return
//     */
//    int modifyInfoOne(int user_id, ChengdeRegister register);

    /**
     * 查询所有人的信息
     * @return
     */
    List<ChengdeRegister> queryAllInfo();

//    /**
//     * 查询所有人的ID，test 为什么会出现0的情况
//     * @return
//     */
//    int[] queryId();  // 找到原因了，是user_id命名的问题，以后java编程，只能用驼峰法命令


    /**
     * 查询管理员用户名和密码
     * @return
     */
    ChengdeBasic queryAdminById();




}
