package com.yuan.lee.service.box.users;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuan.lee.common.BaseService;
import com.yuan.lee.dao.UserRoleMapper;
import com.yuan.lee.entity.UserRole;

@Service

public class UserRoleService extends BaseService<UserRole>{
	@Autowired
	UserRoleMapper userRoleMapper;
	public List<UserRole> selectByUserId (String userid){
		return userRoleMapper.selectByUserId(userid);
	}
}
