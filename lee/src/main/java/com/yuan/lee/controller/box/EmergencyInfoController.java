package com.yuan.lee.controller.box;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuan.lee.entity.EmerType;
import com.yuan.lee.entity.Emergency;
import com.yuan.lee.entity.UERelation;
import com.yuan.lee.entity.Users;
import com.yuan.lee.service.box.emer.EmerTypeService;
import com.yuan.lee.service.box.emer.EmergencyService;
import com.yuan.lee.service.box.emer.UeRelationService;
import com.yuan.lee.util.Identities;

@Controller
public class EmergencyInfoController {
	@Autowired
	HttpServletRequest request;
	@Autowired
	EmerTypeService emerTypeService;
	@Autowired
	EmergencyService emergencyService;
	@Autowired
	UeRelationService ueRelationService;
	
	@Autowired
	UERelation ueRelation;
	
	
	@RequestMapping("/gotoAddEmergency")
	public String gotoAddEmergency(ModelMap modelmap){
		List<EmerType> list= emerTypeService.selectAll();
		List<String>emertypenames=new ArrayList<String>();
		List<String>emertypedescribes=new ArrayList<String>();
		List<EmerType> emerTypelist=new ArrayList<EmerType>();
		List<EmerType> emerTypelist2=new ArrayList<EmerType>();
		for (EmerType emertype : list) {
			if (!emertypenames.contains(emertype.getEmertypename())) {
				emertypenames.add(emertype.getEmertypename());	
			}
			if(!emertypedescribes.contains(emertype.getDescribe()))
			{
				emertypedescribes.add(emertype.getDescribe());
				emerTypelist2.add(emertype);
				emerTypelist.add(emertype);
			}
		}
		modelmap.put("emerTypeName",emertypenames);
		modelmap.put("emerTypelist",emerTypelist);
		modelmap.put("emerTypelist2",emerTypelist2 );
		return "WebRoot/Emergency/addEmergency";
	}
	@RequestMapping("/saveEmergency")
	public String saveEmergency(Emergency emergency,String emertypeid){
		Emergency test=new Emergency();
		Users user=(Users)request.getSession().getAttribute("user");
		emergency.setEmerid(Identities.uuid2());
		emergencyService.insert(emergency);
		//将用户与灾害事件匹配起来
		ueRelation.setUerelationid(Identities.uuid2());
		ueRelation.setEmerid(emergency.getEmerid());
		ueRelation.setUserid(user.getUserid());
		ueRelation.setState("1");   //是自己创建的，而不是被别人授权的
		ueRelationService.insert(ueRelation);
		return "forward:gotoAddEmergency";
	}
}
