package com.yuan.lee.dao;

import java.util.List;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.Points;
@MyBatisRepository
public interface PointsMapper extends BaseMapper<Points>{
    public List<Points> selectByEdgeId(String edgeid);
}