package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.Roles;
@MyBatisRepository
public interface RolesMapper extends BaseMapper<Roles>{
    int deleteByPrimaryKey(String roleid);

    int insert(Roles record);

    int insertSelective(Roles record);

    Roles selectByPrimaryKey(String roleid);

    int updateByPrimaryKeySelective(Roles record);

    int updateByPrimaryKey(Roles record);
}