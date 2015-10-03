package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.Manufacturer;
@MyBatisRepository
public interface ManufacturerMapper extends BaseMapper<Manufacturer>{
    int deleteByPrimaryKey(String manufacturerid);

    int insert(Manufacturer record);

    int insertSelective(Manufacturer record);

    Manufacturer selectByPrimaryKey(String manufacturerid);

    int updateByPrimaryKeySelective(Manufacturer record);

    int updateByPrimaryKey(Manufacturer record);
}