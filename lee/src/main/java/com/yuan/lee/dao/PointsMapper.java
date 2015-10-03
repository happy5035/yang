package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.Points;
@MyBatisRepository
public interface PointsMapper extends BaseMapper<Points>{
    int deleteByPrimaryKey(String pointsid);

    int insert(Points record);

    int insertSelective(Points record);

    Points selectByPrimaryKey(String pointsid);

    int updateByPrimaryKeySelective(Points record);

    int updateByPrimaryKey(Points record);
}