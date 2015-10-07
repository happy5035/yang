package com.yuan.lee.service.box.edge;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuan.lee.common.BaseService;
import com.yuan.lee.dao.TaskMapper;
import com.yuan.lee.entity.Task;
@Service
public class TaskService extends BaseService<Task> {
	@Autowired
	TaskMapper taskMapper;
	public List<Task> findByGeneID(String geneid){
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("geneid", geneid);
		return taskMapper.findByParams(params);
	}

}
