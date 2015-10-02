package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.Area;
@MyBatisRepository
public interface AreaMapper  extends BaseMapper<Area>{
    int deleteByPrimaryKey(String areaid);

    int insert(Area record);

    int insertSelective(Area record);

    Area selectByPrimaryKey(String areaid);

    int updateByPrimaryKeySelective(Area record);

    int updateByPrimaryKey(Area record);
}