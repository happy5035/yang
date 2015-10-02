package com.yuan.lee.dao;

import com.yuan.lee.entity.Events;

public interface EventsMapper {
    int deleteByPrimaryKey(String eventid);

    int insert(Events record);

    int insertSelective(Events record);

    Events selectByPrimaryKey(String eventid);

    int updateByPrimaryKeySelective(Events record);

    int updateByPrimaryKey(Events record);
}