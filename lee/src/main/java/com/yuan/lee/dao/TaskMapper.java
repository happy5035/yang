package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.Task;
@MyBatisRepository
public interface TaskMapper extends BaseMapper<Task>{
    int deleteByPrimaryKey(String taskid);

    int insert(Task record);

    int insertSelective(Task record);

    Task selectByPrimaryKey(String taskid);

    int updateByPrimaryKeySelective(Task record);

    int updateByPrimaryKey(Task record);
}