package com.yuan.lee.dao;

import com.yuan.lee.entity.DisasterNode;

public interface DisasterNodeMapper {
    int deleteByPrimaryKey(String dnodeid);

    int insert(DisasterNode record);

    int insertSelective(DisasterNode record);

    DisasterNode selectByPrimaryKey(String dnodeid);

    int updateByPrimaryKeySelective(DisasterNode record);

    int updateByPrimaryKey(DisasterNode record);
}