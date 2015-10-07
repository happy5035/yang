package com.yuan.lee.service.box.edge;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuan.lee.common.BaseService;
import com.yuan.lee.dao.PointsMapper;
import com.yuan.lee.entity.Points;
@Service
public class PointsService extends BaseService<Points> {
	@Autowired
	PointsMapper pointsMapper;
	public List<Points> findByEdgeid(String edgeid){
		return pointsMapper.selectByEdgeId(edgeid);
	}
}
