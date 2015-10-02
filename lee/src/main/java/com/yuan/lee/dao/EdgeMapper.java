package com.yuan.lee.dao;

import com.yuan.lee.entity.Edge;

public interface EdgeMapper {
    int deleteByPrimaryKey(String edgeid);

    int insert(Edge record);

    int insertSelective(Edge record);

    Edge selectByPrimaryKey(String edgeid);

    int updateByPrimaryKeySelective(Edge record);

    int updateByPrimaryKey(Edge record);
}