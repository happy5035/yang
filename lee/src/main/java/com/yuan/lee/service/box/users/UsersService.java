package com.yuan.lee.service.box.users;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuan.lee.common.BaseService;
import com.yuan.lee.dao.UsersMapper;
import com.yuan.lee.entity.Users;

@Service
public class UsersService  extends BaseService<Users>{
	@Autowired
	UsersMapper usersmapper;
	 public List<Users> selectByLogname(String logname){
		 return usersmapper.selectByLogname(logname);
	 }
}
