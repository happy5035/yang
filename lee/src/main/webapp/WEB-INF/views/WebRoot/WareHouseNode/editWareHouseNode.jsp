<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="<c:url value="/static/style/gov_style_10.css" />" rel="stylesheet" type="text/css">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <script type="text/javascript" src="<c:url value="/static/js/js/jquery-1.8.0.js"/>"></script> 
<script type="text/javascript">
function cbt_res()
{
  document.forms[0].reset();
  return false;
}

$(document).ready(function(){  
        	$( "#areaid" ).change(function(){
		    $.ajax({
		    	type: "POST",
		    	url: "findArea?areaid="+$(this).val()+"&amt=" + Math.random(),
		    	cache: false,
		    	async: false,
		    	success: function(data){
		    		$("#streetid").html(data);
		    	}});
		     $.ajax({
		    	type: "POST",
		    	url: "findStreet?streetid="+$("#streetid").val()+"&amt=" + Math.random(),
		    	cache: false,
		    	async: false,
		    	success: function(data){
		    		$("#roadid").html(data);
		    	}});	
		    }); 
		    $( "#streetid" ).change(function(){
		    $.ajax({
		    	type: "POST",
		    	url: "findStreet?streetid="+$(this).val()+"&amt=" + Math.random(),
		    	cache: false,
		    	async: false,
		    	success: function(data){
		    		$("#roadid").html(data);
		    	}});
		    }); 
     }); 
  
     $(document).ready(function(){          	
		    $( "#emerTypeName" ).change(function(){
		    $.ajax({
		    	type: "POST",
		    	url: "findEmergency?emerTypeName="+encodeURI(encodeURI($(this).val())),
		    	cache: false,
		    	async: false,
		    	success: function(data){
		    		$("#emerId").html(data);
		    	}});		    
		    }); 		    
     });  
     
     function OpenWindow(){ 

	window.open("getAllArea?showinfoFlag=4"); 	
	} 
	function setValue(lngValue,latValue)   
	{ 
	document.getElementById("longitude").value = lngValue; 
	document.getElementById("latitude").value = latValue;
	}    
</script>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改仓库点信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
 <form name="WareHouseNodeForm" method="post" action="UpdateWareHouse.action">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="/lee/static/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">仓库点信息管理>>修改仓库点详细信息</td>
                </tr>
            </table></td>
          <td width="50%"></td>
        </tr>
      </table></td>
  </tr>
</table> 
<table width="100%" border="0" cellspacing="1" cellpadding="3">
	<tr>
		<td align="center" class="tr4"> 
			<table border="0" cellpadding="3" cellspacing="1" class="table3">			
			<tr class="tr2">
				<td  class="tr1" align="right">仓库点名称:</td>
				<td><input type="text" name="warehousename" value="${wareHouse.warehousename}"></td>
				<td  class="tr1" align="right">仓库点编码:</td>
				<td><input type="text" name="warehouseno" value="${wareHouse.warehouseno}"></td>	
			</tr>
			<tr class="tr2">
					<td  class="tr1" align="right">*所属灾害事件类型:</td>
					<td>
					<select id="emerTypeName" name="emertypename">
						<c:forEach var="item" items="${emertypename}">
							<option value="${item}" <c:if test="${item eq emertype.emertypename}">selected</c:if>>${item}</option>
						</c:forEach>
					</select>
					</td>
					<td  class="tr1" align="right">*所属灾害事件:</td>
					<td>
					<select id="emerId" name="emerid">
						<c:forEach var="item" items="${emergencylist}">
							<option value="${item.emerid}" <c:if test="${item.emerid eq emergency.emerid}">selected</c:if>>${item.emername}</option>
						</c:forEach>
					</select>
                    </td>	
				</tr>
			<tr class="tr2">
					<td  class="tr1" align="right">*仓库点等级:</td>
					<td>
					   <input type="radio" name="warehouselevel" value="P" <c:if test="${fn:contains(wareHouse.warehouselevel, 'P')}">checked</c:if>>省
					   <input type="radio" name="warehouselevel" value="C" <c:if test="${fn:contains(wareHouse.warehouselevel, 'C')}">checked</c:if>>市 
					   <input type="radio" name="warehouselevel" value="D" <c:if test="${fn:contains(wareHouse.warehouselevel, 'D')}">checked</c:if>>县/区					
					</td>
                    <td  class="tr1" align="right">*仓库性质:</td>
					<td>
					   <input type="radio" name="property" value="C" <c:if test="${fn:contains(wareHouse.property, 'C')}">checked</c:if>>国有
					   <input type="radio" name="property" value="L" <c:if test="${fn:contains(wareHouse.property, 'L')}">checked</c:if>>地方所有
					   <input type="radio" name="property" value="S" <c:if test="${fn:contains(wareHouse.property, 'S')}">checked</c:if>>个人 
					</td>		
				</tr>
				<tr class="tr2">
			        <td  class="tr1" align="right">*所在地区:</td>
					<td >
						<select id="areaid"  name="areaid"  >
							<c:forEach var="item" items="${areas}">
								<option value="${item.areaid}" <c:if test="${item.areaid eq area.areaid}">selected</c:if>>${item.areaname}</option>
							</c:forEach>
						</select>
						<select   id="streetid" name="streetid" style="width:100;"  >
							<c:forEach var="item" items="${streetlist}">
								<option value="${item.areaid}" <c:if test="${item.areaid eq street.areaid}">selected</c:if>>${item.areaname}</option>
							</c:forEach>
						</select>
					 	<select name="roadid" id="roadid" style="width:100;" > 
						<c:forEach var="item" items="${roadlist}">
							<option value ="${item.areaid}" <c:if test="${item.areaid eq road.areaid}">selected</c:if>>${item.areaname}</option>	
						</c:forEach> 
						</select>
				</td>
					<td  class="tr1" align="right">详细地址:</td>
					<td><input type="text" name="address" value="${nodes.address}"></td>				
			<tr class="tr2">
				<td  class="tr1" align="right">X坐标:</td>
				<td><input type="text" id="longitude" value="${nodes.longitude}" onclick="OpenWindow()" name="longitude" >  
				</td>
				<td  class="tr1" align="right">Y坐标:</td>
				<td><input type="text" id="latitude" value="${nodes.latitude}" onclick="OpenWindow()"  name="latitude" >        
				</td>
			</tr>	
			<tr class="tr2">
					<td  class="tr1" align="right">*仓库规模:</td>
					<td><input type="text" name="dimensions" value="${wareHouse.dimensions}"></td>
					<td  class="tr1" align="right">*仓库容量:</td>
					<td><input type="text" name="capacity" value="${wareHouse.capacity}"></td>				
				</tr>
				<tr class="tr2">
					<td  class="tr1" align="right">*隶属部门:</td>
					<td><input type="text" name="belong" value="${wareHouse.belong}"></td>
					<td  class="tr1" align="right">*仓库管理员:</td>
					<td><input type="text" name="administrator" value="${wareHouse.administrator}"></td>				
				</tr>
				<tr class="tr2">
					<td  class="tr1" align="right">*法人:</td>
					<td><input type="text" name="legalman" value="${wareHouse.legalman}"></td>
					<td  class="tr1" align="right">*法人联系方式:</td>
					<td><input type="text" name="legalmanphone" value="${wareHouse.legalmanphone}"></td>				
				</tr>
				<tr class="tr2">
					<td  class="tr1" align="right">*联系人:</td>
					<td><input type="text" name="linkman" value="${wareHouse.linkman}"></td>
					<td  class="tr1" align="right">*联系人电话:</td>
					<td><input type="text" name="linkmanphone" value="${wareHouse.linkmanphone}"></td>				
				</tr>		
			<tr class="tr2">
                    <td  class="tr1" align="right">联系电话:</td>
					<td><input type="text" name="phone" value="${wareHouse.phone}""></td>
					<td  class="tr1" align="right" >备注:</td>
					<td><input type="text" name="note" value="${wareHouse.note}"></td>				
				</tr>
				<tr class="tr10">
    	  			<td align="center" colspan="4">
	   					<input type=image src="/lee/static/images/pub/lzoa_pub_save.gif" width="67" height="19" style="cursor:hand;border:0px" ; return false;">&nbsp;&nbsp;		
						<input type="image" src="/lee/static/images/pub/lzoa_pub_reset.gif" width="67" height="19" style="cursor:hand" onClick="return cbt_res();">
	   					<a href="javascript:history.back(-1);"><img border="0" src="/lee/static/images/pub/lzoa_pub_back.gif"/></a>           
	  				</td>
  				</tr>
			</table>
		</td>
    </tr>
</table>
<input type="hidden" name="wnodeid" id="wnodeId" value="${wareHouse.wnodeid}"/> 
<input type="hidden" name="enrelationid" id="enrelationId" value="${enrelationid}"/> 
</form>  
   
   
   
  </body>
</html>
