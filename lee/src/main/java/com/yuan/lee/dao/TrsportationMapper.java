package com.yuan.lee.dao;

import com.yuan.lee.entity.Trsportation;

public interface TrsportationMapper {
    int deleteByPrimaryKey(String transid);

    int insert(Trsportation record);

    int insertSelective(Trsportation record);

    Trsportation selectByPrimaryKey(String transid);

    int updateByPrimaryKeySelective(Trsportation record);

    int updateByPrimaryKey(Trsportation record);
}