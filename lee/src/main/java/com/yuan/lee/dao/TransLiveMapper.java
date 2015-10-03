package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.TransLive;
@MyBatisRepository
public interface TransLiveMapper extends BaseMapper<TransLive>{
    int deleteByPrimaryKey(String transliveid);

    int insert(TransLive record);

    int insertSelective(TransLive record);

    TransLive selectByPrimaryKey(String transliveid);

    int updateByPrimaryKeySelective(TransLive record);

    int updateByPrimaryKey(TransLive record);
}