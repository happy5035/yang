package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.Edge;
@MyBatisRepository
public interface EdgeMapper extends BaseMapper<Edge> {
    int deleteByPrimaryKey(String edgeid);

    int insert(Edge record);

    int insertSelective(Edge record);

    Edge selectByPrimaryKey(String edgeid);

    int updateByPrimaryKeySelective(Edge record);

    int updateByPrimaryKey(Edge record);
}