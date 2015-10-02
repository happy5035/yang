package com.yuan.lee.dao;

import com.yuan.lee.entity.GoodsRelation;

public interface GoodsRelationMapper {
    int deleteByPrimaryKey(String goodsreid);

    int insert(GoodsRelation record);

    int insertSelective(GoodsRelation record);

    GoodsRelation selectByPrimaryKey(String goodsreid);

    int updateByPrimaryKeySelective(GoodsRelation record);

    int updateByPrimaryKey(GoodsRelation record);
}