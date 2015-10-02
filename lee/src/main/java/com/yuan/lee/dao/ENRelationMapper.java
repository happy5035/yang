package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.ENRelation;
@MyBatisRepository
public interface ENRelationMapper extends BaseMapper<ENRelation> {
    int deleteByPrimaryKey(String enrelationid);

    int insert(ENRelation record);

    int insertSelective(ENRelation record);

    ENRelation selectByPrimaryKey(String enrelationid);

    int updateByPrimaryKeySelective(ENRelation record);

    int updateByPrimaryKey(ENRelation record);
}