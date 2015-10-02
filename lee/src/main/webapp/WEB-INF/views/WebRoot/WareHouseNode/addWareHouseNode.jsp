<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style/gov_style_10.css">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>添加仓库点</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
     <script type="text/javascript" src="<%=path %>/js/jquery-1.8.0.js"></script>  
     <script type="text/javascript"> 
 
               $(document).ready(function(){  
        	$( "#areaid" ).change(function(){
		    $.ajax({
		    	type: "POST",
		    	url: "findArea.action?areaid="+$(this).val()+"&amt=" + Math.random(),
		    	cache: false,
		    	async: false,
		    	success: function(data){
		    		$("#streetid").html(data);
		    	}});
		     $.ajax({
		    	type: "POST",
		    	url: "findStreet.action?streetid="+$("#streetid").val()+"&amt=" + Math.random(),
		    	cache: false,
		    	async: false,
		    	success: function(data){
		    		$("#roadid").html(data);
		    	}});	
		    }); 
		    $( "#streetid" ).change(function(){
		    $.ajax({
		    	type: "POST",
		    	url: "findStreet.action?streetid="+$(this).val()+"&amt=" + Math.random(),
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
		    	url: "findEmergency.action?emerTypeName="+encodeURI(encodeURI($(this).val())),
		    	cache: false,
		    	async: false,
		    	success: function(data){
		    		$("#emerId").html(data);
		    	}});		    
		    }); 		    
     });     
         
         
 
function cbt_local()
{
if(document.forms[0].logiccabinetno.value =='')
{alert("逻辑柜编号不能为空");document.forms[0].logiccabinetno.focus(); return false;}
}
function cbt_res()
{
	document.getElementById("WareHouseNodeForm").reset();
	return false;
}
function OpenWindow(){ 

	window.open("getAllArea.action?showinfoFlag=4&emerId="+document.getElementById("emerId").value); 	
	} 
	function setValue(lngValue,latValue)   
	{ 
	document.getElementById("longitude").value = lngValue; 
	document.getElementById("latitude").value = latValue;
	} 
		var checkflag = "false";

</script>

     <script type="text/javascript" src="<%=path %>/js/My97DatePicker/WdatePicker.js"></script>  

  </head>
  
  <body>
<form id="WareHouseNodeForm" method="post"  name="WareHouseNodeForm" action="saveWareHouse.action">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="<%=request.getContextPath()%>/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">仓库点信息管理&gt;&gt;添加仓库点</td>
                </tr>
            </table></td>
          <td width="50%"></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="1" cellpadding="3" >
	<tr>
		<td align="center" class="tr4"> 
			<table border="0" cellpadding="3" cellspacing="1" class="table3">
			<tr class="tr2">
					<td  class="tr1" align="right" >*仓库点名称:</td>
					<td><input type="text" name="wareHouseName" ></td>	
					<td  class="tr1" align="right" >*仓库点编码:</td>
					<td><input type="text" name="wareHouseNo" ></td>				
				</tr>
			<tr class="tr2">
					<td  class="tr1" align="right">*所属灾害事件类型:</td>
					<td>
					<select id="emerTypeName" name="emerTypeName">
						<c:forEach var="item" items="${emerTypeName}">
							<option value="${item}">${item}</option>
						</c:forEach>
					</select>
					</td>
					<td  class="tr1" align="right">*所属灾害事件:</td>
					<td>
					<select id="emerId" name="emerId">
						<c:forEach var="item" items="${emergencylist}">
							<option value="${item.emerId}">${item.emerName}</option>
						</c:forEach>
					</select>
                    </td>				
				</tr>
			<tr class="tr2">
					<td  class="tr1" align="right">*仓库点等级:</td>
					<td><input type="radio" name="wareHouseLevel" value="P">省<input type="radio" name="wareHouseLevel" value="C">市 <input type="radio" name="wareHouseLevel" value="D">县/区 </td>
				    <td  class="tr1" align="right">*仓库性质:</td>
					<td><input type="radio" name="property" value="C">国有<input type="radio" name="property" value="L">地方所有 <input type="radio" name="property" value="S">个人 </td>
				</tr>
				<tr class="tr2">
					<td  class="tr1" align="right">*仓库规模:</td>
					<td><input type="text" name="dimensions" ></td>
					<td  class="tr1" align="right">*仓库容量:</td>
					<td><input type="text" name="capacity" ></td>				
				</tr>
				<tr class="tr2">
					<td  class="tr1" align="right">*隶属部门:</td>
					<td><input type="text" name="belong" ></td>
					<td  class="tr1" align="right">*仓库管理员:</td>
					<td><input type="text" name="administrator" ></td>				
				</tr>
				<tr class="tr2">
					<td  class="tr1" align="right">*法人:</td>
					<td><input type="text" name="legalman" ></td>
					<td  class="tr1" align="right">*法人联系方式:</td>
					<td><input type="text" name="legalmanPhone" ></td>				
				</tr>
				<tr class="tr2">
					<td  class="tr1" align="right">*联系人:</td>
					<td><input type="text" name="linkman" ></td>
					<td  class="tr1" align="right">*联系人电话:</td>
					<td><input type="text" name="linkmanPhone" ></td>				
				</tr>
			<tr class="tr2">
				<td  class="tr1" align="right">X坐标:</td>
				<td><input type="text" id="longitude" onclick="OpenWindow()" name="longitude" >  
				</td>
				<td  class="tr1" align="right">Y坐标:</td>
				<td><input type="text" id="latitude" onclick="OpenWindow()"  name="latitude" >        
				</td>
			</tr>
			<tr class="tr2">
			        <td  class="tr1" align="right">*所在地区:</td>
					<td >
						<select id="areaid"  name="areaid"  >
							<c:forEach var="item" items="${areas}">
								<option value="${item.areaId}">${item.areaName}</option>
							</c:forEach>
						</select>
						<select   id="streetid" name="streetid" style="width:100;"  >
							<!--	<option value="${street.areaId}">${street.areaName}</option>    -->
							<c:forEach var="item" items="${streetlist}">
								<option value="${item.areaId}">${item.areaName}</option>
							</c:forEach>
						</select>
					 	<select name="roadid" id="roadid" style="width:100;" > 
						<!--  		<option value="${road.areaId}">${road.areaName}</option>   -->
						<c:forEach var="item" items="${roadlist}">
							<option value ="${item.areaId}">${item.areaName}</option>	
						</c:forEach> 
						</select>
				</td>
					<td  class="tr1" align="right">详细地址:</td>
					<td><input type="text" name="address" ></td>
					</tr>
			<tr class="tr2">
			        <td  class="tr1" align="right">*联系电话:</td>
					<td><input type="text" name="phone" ></td>
					<td  class="tr1" align="right">备注:</td>
					<td><input type="text" name="note" ></td>
					</tr>
			<tr class="tr10">
    	  			<td align="center" colspan="4">
    	  				 &nbsp;&nbsp;
    	  				 <input type=image src="<%=request.getContextPath()%>/images/pub/lzoa_pub_save.gif" width="67" height="19" style="cursor:hand;border:0px" ;  onClick="return cbt_local();  return false;">
                         <input type="image" src="<%=request.getContextPath()%>/images/pub/lzoa_pub_reset.gif" width="67" height="19" style="cursor:hand" onClick="return cbt_res();">	   					
	  				</td>
  			</tr>
			</table>
		</td>
    </tr>
</table>
</form> 
</body>
</html>
