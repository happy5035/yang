package com.yuan.lee.controller.disaster;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yuan.lee.common.PageBean;
import com.yuan.lee.entity.Area;
import com.yuan.lee.entity.DisasterNode;
import com.yuan.lee.entity.ENRelation;
import com.yuan.lee.entity.EmerType;
import com.yuan.lee.entity.Emergency;
import com.yuan.lee.entity.Nodes;
import com.yuan.lee.entity.Users;
import com.yuan.lee.service.box.disaster.AreaService;
import com.yuan.lee.service.box.disaster.DisasterNodesService;
import com.yuan.lee.service.box.disaster.ENrelationService;
import com.yuan.lee.service.box.disaster.NodesService;
import com.yuan.lee.service.box.emer.EmerTypeService;
import com.yuan.lee.service.box.emer.EmergencyService;
import com.yuan.lee.util.Identities;

@Controller
public class DisasterNodeController {
	@Autowired
	AreaService areaService;
	@Autowired
	EmerTypeService emerTypeService;
	@Autowired
	EmergencyService emergencyService;
	@Autowired
	NodesService nodesService;
	@Autowired
	DisasterNodesService disasterNodesService;
	@Autowired
	ENrelationService enRelationService;
	
	@Autowired
	ENRelation enRelaion;
	
	
	
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpServletResponse response;
	
	@RequestMapping("/gotoAddDisaster")
	public String gotoAddDisaster(ModelMap modelmap,Area area,String nodeId){
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("arealevel", "1");
		List<Area> areas=areaService.findByParams(params);
		modelmap.put("areas", areas);
		List<Area> streetlist =  new ArrayList<Area>();
		List<Area> roadlist = new ArrayList<Area>();
		Area street = new Area();
		Area road = new Area();
		String areaid=area.getAreaid();
		String streetid = null;
		if (areaid == null && areas.size() > 0) {
			// 第一次进入默认选择第一个逻辑柜
			areaid = areas.get(1).getAreaid();
			area = areaService.selectByPrimaryKey(areaid);
			params.put("parareaid", areaid);
			params.put("arealevel", "2");
			streetlist = areaService.findByParams(params);
			
			if (streetid == null && streetlist.size() > 0) {
				streetid = streetlist.get(0).getAreaid();
			}
			street = areaService.selectByPrimaryKey(streetid);
			params.put("parareaid", streetid);
			params.put("arealevel", "3");
			roadlist =  areaService.findByParams(params);
			road=roadlist.get(0);
		} else if (nodeId != null) {
			// 第二次选择点击查询时
			area =  areaService.selectByPrimaryKey(areaid);
			params.put("parareaid", areaid);
			params.put("arealevel", "2");
			streetlist = areaService.findByParams(params);
			if (streetid == null && streetlist.size() > 0) {
				streetid = streetlist.get(0).getAreaid();
			}
			street = areaService.selectByPrimaryKey(streetid);
			params.put("parareaid", streetid);
			params.put("arealevel", "3");
			roadlist =  areaService.findByParams(params);
		}
		modelmap.put("road", road);
		modelmap.put("area", area);
		modelmap.put("roadlist",roadlist );
		modelmap.put("street", street);
		modelmap.put("streetlist",streetlist );
		modelmap.put("areas",areas );
		modelmap.put("areaid",areaid );
		
		List<EmerType> list= emerTypeService.selectAll();
		List<String>emertypenames=new ArrayList<String>();
		List<EmerType> emerTypelist=new ArrayList<EmerType>();
		for (EmerType emerType : list) {
			if(!emertypenames.contains(emerType.getEmertypename()) ){
				emertypenames.add(emerType.getEmertypename());
				emerTypelist.add(emerType);
			}
		}
		Users user=(Users)request.getSession().getAttribute("user");
		String userid=user.getUserid();
		Map<String, Object> params1=new HashMap<String, Object>();
		params1.put("userid", userid);
		params1.put("emertypename", "水灾");
		List<Emergency> emergencylist=emergencyService.selectByEmerTypeName(params1);
		if(emertypenames.size() >0)
		{
			modelmap.put("emergencylist", emergencylist);
		}else {
			String listStrng="No Option";
			modelmap.put("emergencylist", listStrng);
		}
		modelmap.put("emerTypeName", emertypenames);
		
		return "WebRoot/DisasterNode/addDisasterNode";
	}
	
	@RequestMapping("/saveDisasterNode")
	public String saveDisasterNode(ModelMap modelmap,String emerTypeName,String emerId ,String disasterLevel,Nodes node
			,String roadid,String disastername,String note,DisasterNode disasterNode){
		int resault=0;
		String nodeid=Identities.uuid2();
		node.setNodeid(nodeid);
		node.setAreaid(roadid);
		node.setNodename(disastername);
		node.setNodetype("D");
		node.setNotes(note);
		resault= nodesService.insertSelective(node);
		disasterNode.setDisasterlevel(disasterLevel);
		disasterNode.setDnodeid(nodeid);
		resault*= disasterNodesService.insertSelective(disasterNode);
		enRelaion.setEnrelationid(Identities.uuid2());
		enRelaion.setEmerid(emerId);
		enRelaion.setNodeid(nodeid);
		resault*= enRelationService.insertSelective(enRelaion);
		if(resault >0)
			return "WebRoot/DisasterNode/addSuccess";
		else
			return "WebRoot/DisasterNode/addfailed";
		
	}
	
	@RequestMapping("/GotoSearchDisasterNode")
	public String GotoSearchDisasterNode(ModelMap modelmap){
		List<EmerType> list= emerTypeService.selectAll();
		List<String>emertypenames=new ArrayList<String>();
		List<EmerType> emerTypelist=new ArrayList<EmerType>();
		for (EmerType emerType : list) {
			if(!emertypenames.contains(emerType.getEmertypename()) ){
				emertypenames.add(emerType.getEmertypename());
				emerTypelist.add(emerType);
			}
		}
		Users user=(Users)request.getSession().getAttribute("user");
		String userid=user.getUserid();
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("userid", userid);
		params.put("emertypename", "水灾");
		List<Emergency> emergencylist=emergencyService.selectByEmerTypeName(params);
		if(emertypenames.size() >0)
		{
			modelmap.put("emergencylist", emergencylist);
		}else {
			String listStrng="No Option";
			modelmap.put("emergencylist", listStrng);
		}
		modelmap.put("emerTypeName", emertypenames);
		return "WebRoot/DisasterNode/listDisasterNode";
	}
	
	/**
	 * @param modelmap
	 * @param page
	 * @param disasterName
	 * @param disasterNo
	 * @param principal
	 * @param disasterLevel
	 * @param emerId
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/SearchDisasterNode")
	public String SearchDisasterNode(ModelMap modelmap,String page,String disasterName,
			String disasterNo,String principal,String disasterLevel,String  emerId) throws IOException{
		Users user=(Users)request.getSession().getAttribute("user");
		String userid=user.getUserid();
		StringBuffer url=new StringBuffer();
	    url.append(request.getContextPath()+"/SearchDisasterNode?method=SearchDisasterNode");
	    
	    int current=1;
		if (page != null && !page.trim().equals("")) {
			current=Integer.parseInt(page);
		}
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
		    if(disasterName != null && !"".equals(disasterName))
	    	 {
	    		disasterName=URLDecoder.decode(disasterName, "UTF-8");
	    		params.put("disastername", "%"+disasterName+"%"); 
	    		 url.append("&disasterName="+disasterName);
	    	 }
		    if(disasterNo != null && !"".equals(disasterNo))
	    	 {
		    	disasterNo=URLDecoder.decode(disasterNo, "UTF-8");
	    		params.put("disasterno", "%"+disasterNo+"%"); 
	    		 url.append("&disasterNo="+disasterNo);
	    	 } 
		    if(principal != null && !"".equals(principal))
	    	 {
		    	principal=URLDecoder.decode(principal, "UTF-8");
	    		params.put("principal", "%"+principal+"%"); 
	    		 url.append("&principal="+principal);
	    	 }
		    if(disasterLevel != null && !"".equals(disasterLevel))
	    	 {
		    	disasterLevel=URLDecoder.decode(disasterLevel, "UTF-8");
	    		params.put("disasterlevel", "%"+disasterLevel+"%"); 
	    		 url.append("&disasterLevel="+disasterLevel);
	    	 }
		    
		    if(emerId != null && !"".equals(emerId))
	    	 {        
		    	params.put("emerid", emerId);
	    		 url.append("&emerId="+emerId);  //翻页的时候用的，拼接url！
	    	 }
		    modelmap.put("disasterNo",disasterNo);
		    modelmap.put("disasterLevel", disasterLevel);
		    modelmap.put("emerId", emerId);
		    Emergency emergency=emergencyService.selectByPrimaryKey(emerId);
		    modelmap.put("emergency", emergency);
			
		    List<ENRelation> enRelationlist=enRelationService.findByParams(params);
		    int num=enRelationService.findByParamsCount(params);
			PageBean PageBean=new PageBean(current,pageSize,num,enRelationlist); 
			PageBean.setUrl(url.toString());
			modelmap.put("pageBean", PageBean);
			modelmap.put("Pagelist", PageBean.getList());
		
		return "forward:GotoSearchDisasterNode";
	}
	
	
	@ResponseBody
	@RequestMapping("/findEmergency")
	public void findEmergency(String emerTypeName) throws IOException{
		emerTypeName=URLDecoder.decode(emerTypeName, "UTF-8");
		Users user=(Users)request.getSession().getAttribute("user");
		String userid=user.getUserid();
		String cSelect="";
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("userid", userid);
		params.put("emertypename", emerTypeName);
		List<Emergency> emergencylist=emergencyService.selectByEmerTypeName(params);
		if (emergencylist != null && emergencylist.size() > 0) {
			for (int i = 0; i < emergencylist.size(); i++) {
				Emergency emergency = emergencylist.get(i);
				cSelect += "<option value=" + emergency.getEmerid()
						+ ">" + emergency.getEmername() + "</option>";
			}
		} else {
			cSelect += "<option value=\"0\">无符合实例，请选择其它</option>";
		}			
	response.getWriter().write(cSelect);
	}
	
	@ResponseBody
	@RequestMapping("/findArea")
	public void findArea(String areaid) throws IOException{
		String cSelect="";
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("parareaid", areaid);
		params.put("arealevel", "2");
		
		if("0".equals(areaid)){
			List<Area> List = areaService.selectAll();
			if (List != null && List.size() > 0) {
				for (int i = 0; i < List.size(); i++) {
					Area street = List.get(i);
					cSelect += "<option value=" + street.getAreaid()
							+ ">" + street.getAreaname() + "</option>";
				}
			} else {
				cSelect += "<option value=\"0\">该市下无区</option>";
			}
		}else{
			List<Area> List = areaService.findByParams(params);
			if (List != null && List.size() > 0) {
				for (int i = 0; i < List.size(); i++) {
					Area street = List.get(i);
					cSelect += "<option value=" + street.getAreaid()
							+ ">" + street.getAreaname() + "</option>";
				}
			} else {
				cSelect += "<option value=\"0\">该市下无区</option>";
			}
		}
		response.getWriter().write(cSelect);
		
	}
	
	@ResponseBody
	@RequestMapping("/findStreet")
	public void findStreet(String streetid) throws IOException{
		String cSelect="";
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("parareaid", streetid);
		params.put("arealevel", "3");
		
		if("0".equals(streetid)){
			List<Area> List = areaService.selectAll();
			if (List != null && List.size() > 0) {
				for (int i = 0; i < List.size(); i++) {
					Area street = List.get(i);
					cSelect += "<option value=" + street.getAreaid()
							+ ">" + street.getAreaname() + "</option>";
				}
			} else {
				cSelect += "<option value=\"0\">该市下无区</option>";
			}
		}else{
			List<Area> List = areaService.findByParams(params);
			if (List != null && List.size() > 0) {
				for (int i = 0; i < List.size(); i++) {
					Area street = List.get(i);
					cSelect += "<option value=" + street.getAreaid()
							+ ">" + street.getAreaname() + "</option>";
				}
			} else {
				cSelect += "<option value=\"0\">该市下无区</option>";
			}
		}
		response.getWriter().write(cSelect);
		
	}
	

}
