package com.yuan.lee.dao;

import com.yuan.lee.entity.Manufacturer;

public interface ManufacturerMapper {
    int deleteByPrimaryKey(String manufacturerid);

    int insert(Manufacturer record);

    int insertSelective(Manufacturer record);

    Manufacturer selectByPrimaryKey(String manufacturerid);

    int updateByPrimaryKeySelective(Manufacturer record);

    int updateByPrimaryKey(Manufacturer record);
}