package com.yuan.lee.dao;

import com.yuan.lee.entity.Nodes;

public interface NodesMapper {
    int deleteByPrimaryKey(String nodeid);

    int insert(Nodes record);

    int insertSelective(Nodes record);

    Nodes selectByPrimaryKey(String nodeid);

    int updateByPrimaryKeySelective(Nodes record);

    int updateByPrimaryKey(Nodes record);
}