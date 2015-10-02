package com.yuan.lee.dao;

import java.util.List;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.Popedem;

@MyBatisRepository
public interface PopedemMapper extends BaseMapper<Popedem>{
    int deleteByPrimaryKey(String popedemid);

    int insert(Popedem record);

    int insertSelective(Popedem record);

    Popedem selectByPrimaryKey(String popedemid);

    int updateByPrimaryKeySelective(Popedem record);

    int updateByPrimaryKey(Popedem record);
    
    List<Popedem> selectByRoleId(String roleid);
}