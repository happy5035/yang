package com.yuan.lee.dao;

import com.yuan.lee.entity.TransLive;

public interface TransLiveMapper {
    int deleteByPrimaryKey(String transliveid);

    int insert(TransLive record);

    int insertSelective(TransLive record);

    TransLive selectByPrimaryKey(String transliveid);

    int updateByPrimaryKeySelective(TransLive record);

    int updateByPrimaryKey(TransLive record);
}