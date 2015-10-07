package com.yuan.lee.service.box.edge;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuan.lee.common.BaseService;
import com.yuan.lee.dao.PathMapper;
import com.yuan.lee.entity.Path;
@Service
public class PathService extends BaseService<Path> {
	@Autowired
	PathMapper pathMapper;
	public List<Path> findByTaskId(String taskid){
		return pathMapper.findByTaskId(taskid);
	}
	
}
