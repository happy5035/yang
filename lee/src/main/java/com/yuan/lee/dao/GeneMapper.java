package com.yuan.lee.dao;

import com.yuan.lee.entity.Gene;

public interface GeneMapper {
    int deleteByPrimaryKey(String geneid);

    int insert(Gene record);

    int insertSelective(Gene record);

    Gene selectByPrimaryKey(String geneid);

    int updateByPrimaryKeySelective(Gene record);

    int updateByPrimaryKey(Gene record);
}