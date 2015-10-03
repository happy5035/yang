package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.ScheduleScheme;
@MyBatisRepository
public interface ScheduleSchemeMapper extends BaseMapper<ScheduleScheme>{
    int deleteByPrimaryKey(String schemeid);

    int insert(ScheduleScheme record);

    int insertSelective(ScheduleScheme record);

    ScheduleScheme selectByPrimaryKey(String schemeid);

    int updateByPrimaryKeySelective(ScheduleScheme record);

    int updateByPrimaryKey(ScheduleScheme record);
}