package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.UERelation;

@MyBatisRepository
public interface UERelationMapper extends BaseMapper<UERelation> {
    int deleteByPrimaryKey(String uerelationid);

    int insert(UERelation record);

    int insertSelective(UERelation record);

    UERelation selectByPrimaryKey(String uerelationid);

    int updateByPrimaryKeySelective(UERelation record);

    int updateByPrimaryKey(UERelation record);
}