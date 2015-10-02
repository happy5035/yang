package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.DisasterNode;
@MyBatisRepository
public interface DisasterNodeMapper extends BaseMapper<DisasterNode>{
    int deleteByPrimaryKey(String dnodeid);

    int insert(DisasterNode record);

    int insertSelective(DisasterNode record);

    DisasterNode selectByPrimaryKey(String dnodeid);

    int updateByPrimaryKeySelective(DisasterNode record);

    int updateByPrimaryKey(DisasterNode record);
}