package com.yuan.lee.service.box.emer;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuan.lee.common.BaseService;
import com.yuan.lee.dao.EmergencyMapper;
import com.yuan.lee.entity.Emergency;
@Service
public class EmergencyService extends BaseService<Emergency> {

		@Autowired
		EmergencyMapper emergencyMapper;
		
		public List<Emergency> selectByUserid(String userid){
			return emergencyMapper.selectByUserid(userid);
		}
		
		public List<Emergency> selectByEmerTypeName(Map<String, Object> params){
			return emergencyMapper.selectByEmerTypeName(params);
		}
	
}
