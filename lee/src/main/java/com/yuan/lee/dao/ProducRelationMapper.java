package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.ProducRelation;
@MyBatisRepository
public interface ProducRelationMapper extends BaseMapper<ProducRelation>{
    int deleteByPrimaryKey(String producrelationid);

    int insert(ProducRelation record);

    int insertSelective(ProducRelation record);

    ProducRelation selectByPrimaryKey(String producrelationid);

    int updateByPrimaryKeySelective(ProducRelation record);

    int updateByPrimaryKey(ProducRelation record);
}