package com.yuan.lee.dao;

import java.util.List;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.Nodes;
@MyBatisRepository
public interface NodesMapper extends BaseMapper<Nodes>{
	
	public List<Nodes> selectByUserid(String userid);
	
	public List<Nodes> selectByEmerid(String emerid);
	
}