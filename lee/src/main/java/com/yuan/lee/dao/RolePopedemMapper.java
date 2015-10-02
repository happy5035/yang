package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.RolePopedem;
@MyBatisRepository
public interface RolePopedemMapper extends BaseMapper<RolePopedem>{
    int deleteByPrimaryKey(String rpid);

    int insert(RolePopedem record);

    int insertSelective(RolePopedem record);

    RolePopedem selectByPrimaryKey(String rpid);

    int updateByPrimaryKeySelective(RolePopedem record);

    int updateByPrimaryKey(RolePopedem record);
}