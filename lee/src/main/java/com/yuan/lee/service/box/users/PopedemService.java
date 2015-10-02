package com.yuan.lee.service.box.users;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuan.lee.common.BaseService;
import com.yuan.lee.dao.PopedemMapper;
import com.yuan.lee.entity.Popedem;

@Service
public class PopedemService extends BaseService<Popedem>{

	@Autowired
	PopedemMapper popedemmapper;
	
	 public  List<Popedem> selectByRoleId (String roleid){
		return popedemmapper.selectByRoleId(roleid);
		
	}
}
