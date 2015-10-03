package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.ColloRatioRel;
@MyBatisRepository
public interface ColloRatioRelMapper extends BaseMapper<ColloRatioRel> {
    int deleteByPrimaryKey(String colloratiorelid);

    int insert(ColloRatioRel record);

    int insertSelective(ColloRatioRel record);

    ColloRatioRel selectByPrimaryKey(String colloratiorelid);

    int updateByPrimaryKeySelective(ColloRatioRel record);

    int updateByPrimaryKey(ColloRatioRel record);
}