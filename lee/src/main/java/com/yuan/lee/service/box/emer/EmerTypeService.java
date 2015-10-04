package com.yuan.lee.service.box.emer;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuan.lee.common.BaseService;
import com.yuan.lee.dao.EmerTypeMapper;
import com.yuan.lee.entity.EmerType;
@Service
public class EmerTypeService extends BaseService<EmerType> {
	@Autowired
	EmerTypeMapper emerTypeMapper;
	public List<String> selectAllEmerTypeNames(){
		List<EmerType> emerTypes=emerTypeMapper.selectAll(null);
		List<String>emertypenames=new ArrayList<String>();
		for (EmerType emerType : emerTypes) {
			if(!emertypenames.contains(emerType.getEmertypename()))
			{
				emertypenames.add(emerType.getEmertypename());
			}
		}
		return emertypenames;
	}
}
