package com.yuan.lee.dao;

import com.yuan.lee.entity.Points;

public interface PointsMapper {
    int deleteByPrimaryKey(String pointsid);

    int insert(Points record);

    int insertSelective(Points record);

    Points selectByPrimaryKey(String pointsid);

    int updateByPrimaryKeySelective(Points record);

    int updateByPrimaryKey(Points record);
}