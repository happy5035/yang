package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.Nodes;
@MyBatisRepository
public interface NodesMapper extends BaseMapper<Nodes>{
    int deleteByPrimaryKey(String nodeid);

    int insert(Nodes record);

    int insertSelective(Nodes record);

    Nodes selectByPrimaryKey(String nodeid);

    int updateByPrimaryKeySelective(Nodes record);

    int updateByPrimaryKey(Nodes record);
}