package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.Gene;
@MyBatisRepository
public interface GeneMapper extends BaseMapper<Gene>{
    int deleteByPrimaryKey(String geneid);

    int insert(Gene record);

    int insertSelective(Gene record);

    Gene selectByPrimaryKey(String geneid);

    int updateByPrimaryKeySelective(Gene record);

    int updateByPrimaryKey(Gene record);
}