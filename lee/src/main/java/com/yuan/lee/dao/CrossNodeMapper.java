package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.CrossNode;
@MyBatisRepository
public interface CrossNodeMapper extends BaseMapper<CrossNode> {
    int deleteByPrimaryKey(String cnodeid);

    int insert(CrossNode record);

    int insertSelective(CrossNode record);

    CrossNode selectByPrimaryKey(String cnodeid);

    int updateByPrimaryKeySelective(CrossNode record);

    int updateByPrimaryKey(CrossNode record);
}