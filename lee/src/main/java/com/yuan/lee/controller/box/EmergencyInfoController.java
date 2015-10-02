package com.yuan.lee.controller.box;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yuan.lee.common.PageBean;
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
	HttpServletResponse response;
	@Autowired
	EmerTypeService emerTypeService;
	@Autowired
	EmergencyService emergencyService;
	@Autowired
	UeRelationService ueRelationService;
	
	@Autowired
	UERelation ueRelation;
	
	
	private List<EmerType> emerTypelist2;
	
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
		this.emerTypelist2= emerTypelist2;
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
	@ResponseBody
	@RequestMapping("/findDescribe")
	public void findDescribe(ModelMap modelmap,String emerTypeId) throws IOException{
		List<EmerType> emerTypelist2=this.emerTypelist2;
		String cSelect="";
	 	emerTypeId=URLDecoder.decode(emerTypeId, "UTF-8");
	 	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		if (emerTypelist2 != null && emerTypelist2.size() > 0) {
			for (int i = 0; i < emerTypelist2.size(); i++) {
				EmerType type = emerTypelist2.get(i);
				cSelect += "<option value=" + type.getEmertypeid()
						+ ">" + type.getDescribe() + "</option>";
			}
		} else {
			cSelect += "<option value=\"0\">无符合该类型的灾害事件</option>";
		}	
		response.getWriter().write(cSelect);
	}
	@RequestMapping("/GotoSearchEmergency")
	public String gotoSearchEmergency(ModelMap modelmap,Emergency emergency,String page){
		Users user=(Users)request.getSession().getAttribute("user");
		String userid=user.getUserid();
		String usertype=user.getUsertype();
		
		String emerno=emergency.getEmerno();
		String emername=emergency.getEmername();
		StringBuffer url=new StringBuffer();
		//把action跳转的地址存在url中
		url.append(request.getContextPath()+"/GotoSearchEmergency?method=GotoSearchEmergency");
		int current=1;
		if (page != null && !page.trim().equals("")) {
			current=Integer.parseInt(page);
		}
		try {
			int first=0;
			int pageSize=Integer.parseInt(String.valueOf(PageBean.pagecount));
			if(current!=0){
				first=(current-1)*pageSize;
			}
			int startNum = first;
			Map<String, Object> params=new HashMap<String, Object>();
			params.put("sortName", "emerid");
	        params.put("pageSize", pageSize);
		    params.put("startNum", startNum);
		    if(emerno != null && !"".equals(emerno))
	    	 {
	    		params.put("emerno", "%"+emerno+"%"); 
	    		 url.append("&emerno="+emerno);
	    	 }
			 if(emername != null && !"".equals(emername))
	    	 {
				 params.put("emername", "%"+emername+"%");
	    		 url.append("&emername="+emername);
	    	 }
			params.put("userid", userid);
			params.put("usertype", usertype);
			
			int num=emergencyService.findByParamsCount(params);
			List<Emergency> listEmergency=emergencyService.findByParams(params);
			PageBean PageBean=new PageBean(current,pageSize,num,listEmergency); 
			PageBean.setUrl(url.toString());
			modelmap.put("pageBean", PageBean);
			modelmap.put("Pagelist", PageBean.getList());
			return "WebRoot/Emergency/listEmergency";
		} catch (Exception e) {
			e.printStackTrace();
			return "error/404";
		}
		
	}
}
