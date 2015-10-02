package com.yuan.lee.dao;

import com.yuan.lee.entity.TranModel;

public interface TranModelMapper {
    int deleteByPrimaryKey(String tranmodelid);

    int insert(TranModel record);

    int insertSelective(TranModel record);

    TranModel selectByPrimaryKey(String tranmodelid);

    int updateByPrimaryKeySelective(TranModel record);

    int updateByPrimaryKey(TranModel record);
}