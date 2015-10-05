package com.yuan.lee.service.box.disaster;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuan.lee.common.BaseService;
import com.yuan.lee.dao.NodesMapper;
import com.yuan.lee.entity.Nodes;
@Service
public class NodesService extends BaseService<Nodes> {
		@Autowired
		NodesMapper nodesMapper;
		public List<Nodes> findByUseridAndUserType(String userid,String usertype)
		{
				if(usertype.equals("0")){
					return nodesMapper.selectByUserid(userid);
				}
				else if(usertype.equals("1")){
					return nodesMapper.selectAll(null);
				}
				else
					return null;
		}
		
		public List<Nodes> findByEmerid(String emerid){
			if(emerid != null && emerid.length() >0){
				return nodesMapper.selectByEmerid(emerid);
			}
			return null;
			
		}
}
