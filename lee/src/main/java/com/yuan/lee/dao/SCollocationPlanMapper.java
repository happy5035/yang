package com.yuan.lee.dao;

import com.yuan.lee.entity.SCollocationPlan;

public interface SCollocationPlanMapper {
    int deleteByPrimaryKey(String scollocationplanid);

    int insert(SCollocationPlan record);

    int insertSelective(SCollocationPlan record);

    SCollocationPlan selectByPrimaryKey(String scollocationplanid);

    int updateByPrimaryKeySelective(SCollocationPlan record);

    int updateByPrimaryKey(SCollocationPlan record);
}