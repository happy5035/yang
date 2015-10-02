package com.yuan.lee.dao;

import com.yuan.lee.entity.Path;

public interface PathMapper {
    int deleteByPrimaryKey(String pathid);

    int insert(Path record);

    int insertSelective(Path record);

    Path selectByPrimaryKey(String pathid);

    int updateByPrimaryKeySelective(Path record);

    int updateByPrimaryKey(Path record);
}