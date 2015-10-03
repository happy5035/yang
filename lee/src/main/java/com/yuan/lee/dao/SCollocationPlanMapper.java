package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.SCollocationPlan;
@MyBatisRepository
public interface SCollocationPlanMapper extends BaseMapper<SCollocationPlan>{
    int deleteByPrimaryKey(String scollocationplanid);

    int insert(SCollocationPlan record);

    int insertSelective(SCollocationPlan record);

    SCollocationPlan selectByPrimaryKey(String scollocationplanid);

    int updateByPrimaryKeySelective(SCollocationPlan record);

    int updateByPrimaryKey(SCollocationPlan record);
}