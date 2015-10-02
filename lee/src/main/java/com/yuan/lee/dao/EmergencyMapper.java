package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.Emergency;
@MyBatisRepository
public interface EmergencyMapper  extends BaseMapper<Emergency>{
    int deleteByPrimaryKey(String emerid);

    int insert(Emergency record);

    int insertSelective(Emergency record);

    Emergency selectByPrimaryKey(String emerid);

    int updateByPrimaryKeySelective(Emergency record);

    int updateByPrimaryKey(Emergency record);
}