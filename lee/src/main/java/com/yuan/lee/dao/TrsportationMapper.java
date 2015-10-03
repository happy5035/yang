package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.Trsportation;
@MyBatisRepository
public interface TrsportationMapper extends BaseMapper<Trsportation>{
    int deleteByPrimaryKey(String transid);

    int insert(Trsportation record);

    int insertSelective(Trsportation record);

    Trsportation selectByPrimaryKey(String transid);

    int updateByPrimaryKeySelective(Trsportation record);

    int updateByPrimaryKey(Trsportation record);
}