package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.CrossEdge;
@MyBatisRepository
public interface CrossEdgeMapper extends BaseMapper<CrossEdge>{
    int deleteByPrimaryKey(String crossedgeid);

    int insert(CrossEdge record);

    int insertSelective(CrossEdge record);

    CrossEdge selectByPrimaryKey(String crossedgeid);

    int updateByPrimaryKeySelective(CrossEdge record);

    int updateByPrimaryKey(CrossEdge record);
}