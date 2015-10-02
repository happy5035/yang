package com.yuan.lee.dao;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.EmerType;
@MyBatisRepository
public interface EmerTypeMapper  extends BaseMapper<EmerType>{
    int deleteByPrimaryKey(String emertypeid);

    int insert(EmerType record);

    int insertSelective(EmerType record);

    EmerType selectByPrimaryKey(String emertypeid);

    int updateByPrimaryKeySelective(EmerType record);

    int updateByPrimaryKey(EmerType record);
}