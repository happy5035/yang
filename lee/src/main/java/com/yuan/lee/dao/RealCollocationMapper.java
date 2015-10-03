package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.RealCollocation;
@MyBatisRepository
public interface RealCollocationMapper extends BaseMapper<RealCollocation>{
    int deleteByPrimaryKey(String realcollocationid);

    int insert(RealCollocation record);

    int insertSelective(RealCollocation record);

    RealCollocation selectByPrimaryKey(String realcollocationid);

    int updateByPrimaryKeySelective(RealCollocation record);

    int updateByPrimaryKey(RealCollocation record);
}