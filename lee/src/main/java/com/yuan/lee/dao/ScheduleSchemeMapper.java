package com.yuan.lee.dao;

import com.yuan.lee.entity.ScheduleScheme;

public interface ScheduleSchemeMapper {
    int deleteByPrimaryKey(String schemeid);

    int insert(ScheduleScheme record);

    int insertSelective(ScheduleScheme record);

    ScheduleScheme selectByPrimaryKey(String schemeid);

    int updateByPrimaryKeySelective(ScheduleScheme record);

    int updateByPrimaryKey(ScheduleScheme record);
}