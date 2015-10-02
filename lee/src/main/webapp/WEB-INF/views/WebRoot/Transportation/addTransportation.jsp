<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style/gov_style_10.css">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>添加运输工具</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
     <script type="text/javascript" src="<%=path %>/js/jquery-1.8.0.js"></script>  
     <script type="text/javascript"> 
function cbt_local()
{
if(document.forms[0].goodsName.value =='')
{alert("物资名称不能为空");document.forms[0].logiccabinetno.focus(); return false;}
}
function cbt_res()
{
	document.getElementById("GoodsForm").reset();
	return false;
}

            $(document).ready(function(){          	
		    $( "#transType" ).change(function(){
		    $.ajax({
		    	type: "POST",
		    	url: "findLoadWeight.action?transType="+encodeURI(encodeURI($(this).val())),
		    	cache: false,
		    	async: false,
		    	success: function(data){
		    		$("#tranModelId").html(data);
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
		    $.ajax({
		    	type: "POST",
		    	url: "findNodes.action?emerId="+$("#emerId").val()+"&amt=" + Math.random(),
		    	cache: false,
		    	async: false,
		    	success: function(data){
		    		$("#nodeId").html(data);
		    	}});	
		    }); 
		    $( "#emerId" ).change(function(){
		    $.ajax({
		    	type: "POST",
		    	url: "findNodes.action?emerId="+$("#emerId").val()+"&amt=" + Math.random(),
		    	cache: false,
		    	async: false,
		    	success: function(data){
		    		$("#nodeId").html(data);
		    	}});		    
		    }); 		    
     }); 

</script>

     <script type="text/javascript" src="<%=path %>/js/My97DatePicker/WdatePicker.js"></script>  

  </head>
  
  <body>
<form id="TrsportForm" method="post"  name="TrsportForm" action="saveTrsport.action">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="<%=request.getContextPath()%>/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">运输工具管理&gt;&gt;添加运输工具</td>
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
			    <td  class="tr1" align="right">*运输工具车牌号:</td>
				<td><input type="text" name="busNumber" ></td>	
				<td  class="tr1" align="right">*运输工具类型:</td>
				<td>
				    <select id="transType" name="transType">
						<c:forEach var="item" items="${transTypeName}">
							<option value="${item}">${item}</option>
						</c:forEach>
					</select>
					<select id="tranModelId" name="tranModelId">
						<c:forEach var="item" items="${tranModellist}">
							<option value="${item.tranModelId}">${item.loadWeight}</option>
						</c:forEach>
					</select>				    
				</td>					
			</tr>
			<tr class="tr2">
					<td  class="tr1" align="right">*运输工具编码:</td>									
					<td><input type="text" name="transNo" ></td>
					<td  class="tr1" align="right" >*运输工具状态:</td>
					<td><s:select name="state" list="%{#{'正常':'正常','维修中':'维修中','其它':'其它'}}" value="正常" theme="simple"/><font color=red>  *</font></td>			
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
					<td  class="tr1" align="right">*初始所处节点:</td>
					<td>
					<select id="nodeId" name="nodeId">
						<c:forEach var="item" items="${nodellist}">
							<option value="${item.nodeId}">${item.nodeName}</option>
						</c:forEach>
					</select>		
					</td>
					<td  class="tr1" align="right">*备注:</td>
					<td><input type="text" name="note" ></td>				
				</tr>			
			<tr class="tr10">
    	  			<td align="center" colspan="4">
    	  				 &nbsp;&nbsp;
    	  				 <input type=image src="<%=request.getContextPath()%>/images/pub/lzoa_pub_save.gif" width="67" height="19" style="cursor:hand;border:0px" ;  onClick="return cbt_local();  return false;">
                         <input type="image" src="<%=request.getContextPath()%>/images/pub/lzoa_pub_reset.gif" width="67" height="19" style="cursor:hand" onClick="return cbt_res();">
	   					<a href="javascript:history.back(-1);"><img border="0" src="<%=request.getContextPath()%>/images/pub/lzoa_pub_back.gif"/></a> 
	  				</td>
  			</tr>
			</table>
		</td>
    </tr>
</table>
</form> 
</body>
</html>
