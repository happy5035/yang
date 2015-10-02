package com.yuan.lee.dao;

import java.util.List;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.Emergency;
@MyBatisRepository
public interface EmergencyMapper  extends BaseMapper<Emergency>{
    
	public List<Emergency> selectByUserid(String userid);
}