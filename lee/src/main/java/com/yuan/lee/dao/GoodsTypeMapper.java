package com.yuan.lee.dao;

import com.yuan.lee.entity.GoodsType;

public interface GoodsTypeMapper {
    int deleteByPrimaryKey(String goodstypeid);

    int insert(GoodsType record);

    int insertSelective(GoodsType record);

    GoodsType selectByPrimaryKey(String goodstypeid);

    int updateByPrimaryKeySelective(GoodsType record);

    int updateByPrimaryKey(GoodsType record);
}