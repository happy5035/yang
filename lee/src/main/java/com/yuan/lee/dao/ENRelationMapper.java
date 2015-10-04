package com.yuan.lee.dao;

import java.util.List;
import java.util.Map;

import com.yuan.lee.common.BaseMapper;
import com.yuan.lee.common.MyBatisRepository;
import com.yuan.lee.entity.ENRelation;
@MyBatisRepository
public interface ENRelationMapper extends BaseMapper<ENRelation> {
    
	public List<ENRelation> selectByWareHouseParmas(Map<String, Object> params);
	
	public int selectCountByWareHouseParams(Map<String, Object> params);
}