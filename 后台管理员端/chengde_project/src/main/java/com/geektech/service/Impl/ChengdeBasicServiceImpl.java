package com.geektech.service.Impl;

import com.geektech.dao.ChengdeBasicDao;
import com.geektech.entity.ChengdeBasic;
import com.geektech.entity.ChengdeRegister;
import com.geektech.service.ChengdeBasicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by root on 2018/4/6.
 */
@Service
public class ChengdeBasicServiceImpl implements ChengdeBasicService {

    @Autowired
    private ChengdeBasicDao chengdeBasicDao;

    public int addInfoOne(ChengdeRegister register) {
        return chengdeBasicDao.addInfoOne(register);
    }

    public int delInfoOne(int user_id) {
        return chengdeBasicDao.delInfoOne(user_id);
    }

    public List<ChengdeRegister> queryAllInfo() {
        return chengdeBasicDao.queryAllInfo();
    }

    public ChengdeBasic queryAdminById() {
        return chengdeBasicDao.queryAdminById();
    }
}
