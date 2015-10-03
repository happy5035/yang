package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.WareHouse;
@MyBatisRepository
public interface WareHouseMapper extends BaseMapper<WareHouse> {
    int deleteByPrimaryKey(String wnodeid);

    int insert(WareHouse record);

    int insertSelective(WareHouse record);

    WareHouse selectByPrimaryKey(String wnodeid);

    int updateByPrimaryKeySelective(WareHouse record);

    int updateByPrimaryKey(WareHouse record);
}