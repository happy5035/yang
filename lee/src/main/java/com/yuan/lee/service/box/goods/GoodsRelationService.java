package com.yuan.lee.service.box.goods;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuan.lee.common.BaseService;
import com.yuan.lee.dao.GoodsRelationMapper;
import com.yuan.lee.entity.GoodsRelation;
@Service
public class GoodsRelationService extends BaseService<GoodsRelation> {
	@Autowired
	GoodsRelationMapper goodsRelationMapper;
	public List<GoodsRelation> findByUserParam(Map<String, Object> params ,String userid,String usertype){
		
		if(userid != null && usertype != null){
			params.put("userid", userid);
			params.put("usertype", usertype);
			return goodsRelationMapper.findByParams(params);
		}
		else {
			return new ArrayList<GoodsRelation>();
		}
	}
	
}
