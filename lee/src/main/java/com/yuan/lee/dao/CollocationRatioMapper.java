package com.yuan.lee.dao;

import com.yuan.lee.entity.CollocationRatio;

public interface CollocationRatioMapper {
    int deleteByPrimaryKey(String colloratioid);

    int insert(CollocationRatio record);

    int insertSelective(CollocationRatio record);

    CollocationRatio selectByPrimaryKey(String colloratioid);

    int updateByPrimaryKeySelective(CollocationRatio record);

    int updateByPrimaryKey(CollocationRatio record);
}