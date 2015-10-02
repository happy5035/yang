package com.yuan.lee.dao;

import com.yuan.lee.entity.ENRelation;

public interface ENRelationMapper {
    int deleteByPrimaryKey(String enrelationid);

    int insert(ENRelation record);

    int insertSelective(ENRelation record);

    ENRelation selectByPrimaryKey(String enrelationid);

    int updateByPrimaryKeySelective(ENRelation record);

    int updateByPrimaryKey(ENRelation record);
}