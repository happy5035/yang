package com.yuan.lee.dao;

import com.yuan.lee.entity.ProducRelation;

public interface ProducRelationMapper {
    int deleteByPrimaryKey(String producrelationid);

    int insert(ProducRelation record);

    int insertSelective(ProducRelation record);

    ProducRelation selectByPrimaryKey(String producrelationid);

    int updateByPrimaryKeySelective(ProducRelation record);

    int updateByPrimaryKey(ProducRelation record);
}