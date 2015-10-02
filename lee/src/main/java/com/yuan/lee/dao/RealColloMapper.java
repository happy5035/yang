package com.yuan.lee.dao;

import com.yuan.lee.entity.RealCollo;

public interface RealColloMapper {
    int deleteByPrimaryKey(String realcolloid);

    int insert(RealCollo record);

    int insertSelective(RealCollo record);

    RealCollo selectByPrimaryKey(String realcolloid);

    int updateByPrimaryKeySelective(RealCollo record);

    int updateByPrimaryKey(RealCollo record);
}