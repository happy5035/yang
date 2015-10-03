package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.TranModel;
@MyBatisRepository
public interface TranModelMapper extends BaseMapper<TranModel>{
    int deleteByPrimaryKey(String tranmodelid);

    int insert(TranModel record);

    int insertSelective(TranModel record);

    TranModel selectByPrimaryKey(String tranmodelid);

    int updateByPrimaryKeySelective(TranModel record);

    int updateByPrimaryKey(TranModel record);
}