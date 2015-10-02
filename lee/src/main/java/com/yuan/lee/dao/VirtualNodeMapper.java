package com.yuan.lee.dao;

import com.yuan.lee.entity.VirtualNode;

public interface VirtualNodeMapper {
    int deleteByPrimaryKey(String vnodeid);

    int insert(VirtualNode record);

    int insertSelective(VirtualNode record);

    VirtualNode selectByPrimaryKey(String vnodeid);

    int updateByPrimaryKeySelective(VirtualNode record);

    int updateByPrimaryKey(VirtualNode record);
}