package com.yuan.lee.dao;

import com.yuan.lee.entity.CrossNode;

public interface CrossNodeMapper {
    int deleteByPrimaryKey(String cnodeid);

    int insert(CrossNode record);

    int insertSelective(CrossNode record);

    CrossNode selectByPrimaryKey(String cnodeid);

    int updateByPrimaryKeySelective(CrossNode record);

    int updateByPrimaryKey(CrossNode record);
}