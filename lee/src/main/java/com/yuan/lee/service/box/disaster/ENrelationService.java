package com.yuan.lee.service.box.disaster;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuan.lee.common.BaseService;
import com.yuan.lee.dao.ENRelationMapper;
import com.yuan.lee.entity.ENRelation;
import com.yuan.lee.entity.WareHouse;
@Service	
public class ENrelationService extends BaseService<ENRelation> {
	@Autowired
	ENRelationMapper enRelationMapping;
	
	public List<ENRelation> selectByWareHouseParams(Map<String, Object> params,WareHouse wareHouse){
		
		String warehousename= wareHouse.getWarehousename() ;
		if(warehousename != null && !"".equals(warehousename))
    	 {
    		params.put("warehousename", "%"+warehousename+"%"); 
    	 }
		String warehouseno=wareHouse.getWarehouseno();
		if(warehouseno != null && !"".equals(warehouseno))
		{
			params.put("warehouseno", "%"+warehouseno+"%"); 
		}
		String warehouselevel=wareHouse.getWarehouselevel();
		if((warehouselevel != null) && warehouselevel.length()>0)
		{
			params.put("warehouselevel", "%"+warehouselevel+"%"); 
		}
		String property=wareHouse.getProperty();
		if((property != null) && property.length()>0)
		{
			params.put("property", "%"+property+"%"); 
		}
		return enRelationMapping.selectByWareHouseParmas(params);
	}
	
	public int selectCountByWareHouseParams(Map<String, Object> params,WareHouse wareHouse){
		String warehousename= wareHouse.getWarehousename() ;
		if(warehousename != null && !"".equals(warehousename))
    	 {
    		params.put("warehousename", "%"+warehousename+"%"); 
    	 }
		String warehouseno=wareHouse.getWarehouseno();
		if(warehouseno != null && !"".equals(warehouseno))
		{
			params.put("warehouseno", "%"+warehouseno+"%"); 
		}
		String warehouselevel=wareHouse.getWarehouselevel();
		if(warehouselevel != null && !"".equals(warehouselevel))
		{
			params.put("warehouselevel", warehouselevel); 
		}
		String property=wareHouse.getProperty();
		if(property != null && !"".equals(property))
		{
			params.put("property", property); 
		}
		return enRelationMapping.selectCountByWareHouseParams(params);
	}
}
