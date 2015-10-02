package com.yuan.lee.dao;

import com.yuan.lee.entity.WareHouse;

public interface WareHouseMapper {
    int deleteByPrimaryKey(String wnodeid);

    int insert(WareHouse record);

    int insertSelective(WareHouse record);

    WareHouse selectByPrimaryKey(String wnodeid);

    int updateByPrimaryKeySelective(WareHouse record);

    int updateByPrimaryKey(WareHouse record);
}