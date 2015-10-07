package com.yuan.lee.service.box.edge;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuan.lee.common.BaseService;
import com.yuan.lee.dao.GeneMapper;
import com.yuan.lee.entity.Gene;
@Service
public class GeneService extends BaseService<Gene> {
	@Autowired
	GeneMapper geneMapper;
	public List<Gene> findByTransIDandSchemeID(String transid,String schemeid){
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("schemeid", schemeid);
		params.put("transid", transid);
		return geneMapper.findByParams(params);
		
	}
}
