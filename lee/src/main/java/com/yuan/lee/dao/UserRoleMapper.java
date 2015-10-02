package com.yuan.lee.dao;

import java.util.List;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.UserRole;
@MyBatisRepository
public interface UserRoleMapper extends BaseMapper<UserRole>{
    int deleteByPrimaryKey(String crid);

    int insert(UserRole record);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(String crid);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);
    List<UserRole> selectByUserId (String userid);
}