package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.VirtualNode;
@MyBatisRepository
public interface VirtualNodeMapper extends BaseMapper<VirtualNode>{
    int deleteByPrimaryKey(String vnodeid);

    int insert(VirtualNode record);

    int insertSelective(VirtualNode record);

    VirtualNode selectByPrimaryKey(String vnodeid);

    int updateByPrimaryKeySelective(VirtualNode record);

    int updateByPrimaryKey(VirtualNode record);
}