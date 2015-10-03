package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.CollocationRatio;
@MyBatisRepository
public interface CollocationRatioMapper extends BaseMapper<CollocationRatio> {
    int deleteByPrimaryKey(String colloratioid);

    int insert(CollocationRatio record);

    int insertSelective(CollocationRatio record);

    CollocationRatio selectByPrimaryKey(String colloratioid);

    int updateByPrimaryKeySelective(CollocationRatio record);

    int updateByPrimaryKey(CollocationRatio record);
}