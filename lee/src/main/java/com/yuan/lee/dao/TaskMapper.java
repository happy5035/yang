package com.yuan.lee.dao;

import com.yuan.lee.entity.Task;

public interface TaskMapper {
    int deleteByPrimaryKey(String taskid);

    int insert(Task record);

    int insertSelective(Task record);

    Task selectByPrimaryKey(String taskid);

    int updateByPrimaryKeySelective(Task record);

    int updateByPrimaryKey(Task record);
}