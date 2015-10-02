package com.yuan.lee.dao;

import com.yuan.lee.entity.RealCollocation;

public interface RealCollocationMapper {
    int deleteByPrimaryKey(String realcollocationid);

    int insert(RealCollocation record);

    int insertSelective(RealCollocation record);

    RealCollocation selectByPrimaryKey(String realcollocationid);

    int updateByPrimaryKeySelective(RealCollocation record);

    int updateByPrimaryKey(RealCollocation record);
}