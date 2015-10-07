package com.yuan.lee.controller.transport;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yuan.lee.entity.Emergency;
import com.yuan.lee.entity.Users;
import com.yuan.lee.service.box.emer.EmerTypeService;
import com.yuan.lee.service.box.emer.EmergencyService;

@Controller
public class TrsportController {
	//service
	@Autowired
	EmerTypeService emerTypeService;
	@Autowired
	EmergencyService emergencyService;
	
	//httpServlet
	@Autowired
	HttpServletRequest request;
	@RequestMapping("/gotoAddTrsport")
	public String gotoAddTrsport(ModelMap modelmap){
		List<String> statelist=new ArrayList<String>();
		statelist.add("正常");
		statelist.add("维修中");
		statelist.add("其它");
		modelmap.put("statelist", statelist);
		
		//加载灾害类型和事件
		List<String>emertypenames=emerTypeService.selectAllEmerTypeNames();
		Users user=(Users)request.getSession().getAttribute("user");
		String userid=user.getUserid();
		String usertype=user.getUsertype();
		Map<String, Object> params1=new HashMap<String, Object>();
		params1.put("userid", userid);
		params1.put("emertypename", emertypenames.get(0));
		params1.put("usertype", usertype);
		List<Emergency> emergencylist=emergencyService.selectByEmerTypeName(params1);
		if(emertypenames.size() >0)
		{
			modelmap.put("emergencylist", emergencylist);
		}else {
			String listStrng="No Option";
			modelmap.put("emergencylist", listStrng);
		}
		modelmap.put("emertypename", emertypenames);
		return "WebRoot/Transportation/addTransportation";
	}
	
	@RequestMapping("/GotoSearchTrsport")
	public String GotoSearchTrsport(ModelMap modelmap){
		return "WebRoot/Transportation/listTransportation";
	}
}
