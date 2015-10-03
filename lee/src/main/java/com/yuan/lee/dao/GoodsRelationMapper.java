package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.GoodsRelation;
@MyBatisRepository
public interface GoodsRelationMapper extends BaseMapper<GoodsRelation> {
    int deleteByPrimaryKey(String goodsreid);

    int insert(GoodsRelation record);

    int insertSelective(GoodsRelation record);

    GoodsRelation selectByPrimaryKey(String goodsreid);

    int updateByPrimaryKeySelective(GoodsRelation record);

    int updateByPrimaryKey(GoodsRelation record);
}