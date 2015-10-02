package com.yuan.lee.dao;

import com.yuan.lee.entity.ColloRatioRel;

public interface ColloRatioRelMapper {
    int deleteByPrimaryKey(String colloratiorelid);

    int insert(ColloRatioRel record);

    int insertSelective(ColloRatioRel record);

    ColloRatioRel selectByPrimaryKey(String colloratiorelid);

    int updateByPrimaryKeySelective(ColloRatioRel record);

    int updateByPrimaryKey(ColloRatioRel record);
}