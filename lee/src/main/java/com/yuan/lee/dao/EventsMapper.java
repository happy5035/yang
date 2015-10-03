package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.Events;
@MyBatisRepository
public interface EventsMapper extends BaseMapper<Events>{
    int deleteByPrimaryKey(String eventid);

    int insert(Events record);

    int insertSelective(Events record);

    Events selectByPrimaryKey(String eventid);

    int updateByPrimaryKeySelective(Events record);

    int updateByPrimaryKey(Events record);
}