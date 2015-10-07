package com.yuan.lee.dao;

import java.util.List;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.Path;
@MyBatisRepository
public interface PathMapper extends BaseMapper<Path>{
    
	public List<Path> findByTaskId(String taskid);
}