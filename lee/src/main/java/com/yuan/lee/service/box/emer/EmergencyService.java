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
			String usertype=(String)params.get("usertype");
			String userid=(String)params.get("userid");
			if(usertype != null && usertype.length()> 0)
			{
				if(usertype.equals("1")){
					if(userid !=null)
						params.remove("userid");
					return emergencyMapper.selectByEmerTypeName(params);
				}
				else 
					return emergencyMapper.selectByEmerTypeName(params);
			}
			else return null;
		}
	
}
