package com.yuan.lee.dao;

import com.yuan.lee.entity.CrossEdge;

public interface CrossEdgeMapper {
    int deleteByPrimaryKey(String crossedgeid);

    int insert(CrossEdge record);

    int insertSelective(CrossEdge record);

    CrossEdge selectByPrimaryKey(String crossedgeid);

    int updateByPrimaryKeySelective(CrossEdge record);

    int updateByPrimaryKey(CrossEdge record);
}