package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.Path;
@MyBatisRepository
public interface PathMapper extends BaseMapper<Path>{
    int deleteByPrimaryKey(String pathid);

    int insert(Path record);

    int insertSelective(Path record);

    Path selectByPrimaryKey(String pathid);

    int updateByPrimaryKeySelective(Path record);

    int updateByPrimaryKey(Path record);
}