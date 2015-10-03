package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.RealCollo;
@MyBatisRepository
public interface RealColloMapper extends BaseMapper<RealCollo>{
    int deleteByPrimaryKey(String realcolloid);

    int insert(RealCollo record);

    int insertSelective(RealCollo record);

    RealCollo selectByPrimaryKey(String realcolloid);

    int updateByPrimaryKeySelective(RealCollo record);

    int updateByPrimaryKey(RealCollo record);
}