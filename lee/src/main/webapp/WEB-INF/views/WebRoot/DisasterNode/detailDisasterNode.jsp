<%@ page language="java" import="java.util.*" pageEncoding="GBK" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style/gov_style_10.css">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script language="javascript" type="text/javascript" src="http://localhost:8080/expressWeb/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-1.8.0.js"></script> 
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
</script>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改灾害点信息</title>
    
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
 <form name="disasterNodeForm" method="post" >
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="<%=request.getContextPath()%>/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">灾害点详情管理>>查看灾害点详细信息</td>
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
				<td  class="tr1" align="right">灾害点名称:</td>
				<td><input type="text" name="disasterName" value="${disasterNode.disasterName}"></td>
				<td  class="tr1" align="right">灾害点编码:</td>
				<td><input type="text" name="disasterNo" value="${disasterNode.disasterNo}"></td>	
			</tr>
			<tr class="tr2">
					<td  class="tr1" align="right">*灾害点等级:</td>
					<td>					
					<input type="radio" name="disasterLevel" value="C" <c:if test="${fn:contains(disasterNode.disasterLevel, 'C')}">checked</c:if>>市
					    <input type="radio" name="disasterLevel" value="D" <c:if test="${fn:contains(disasterNode.disasterLevel, 'D')}">checked</c:if>>县/区
					    <input type="radio" name="disasterLevel" value="T" <c:if test="${fn:contains(disasterNode.disasterLevel, 'T')}">checked</c:if>>镇/街道 
					    <input type="radio" name="disasterLevel" value="V" <c:if test="${fn:contains(disasterNode.disasterLevel, 'V')}">checked</c:if>>村
                    </td>
                    <td  class="tr1" align="right">*所在地区:</td>
					<td >
						<select id="areaid"  name="areaid"  >
							<c:forEach var="item" items="${areas}">
								<option value="${item.areaId}" <c:if test="${item.areaId eq area.areaId}">selected</c:if>>${item.areaName}</option>
							</c:forEach>
						</select>
						<select   id="streetid" name="streetid" style="width:100;"  >
							<!--	<option value="${street.areaId}">${street.areaName}</option>    -->
							<c:forEach var="item" items="${streetlist}">
								<option value="${item.areaId}" <c:if test="${item.areaId eq street.areaId}">selected</c:if>>${item.areaName}</option>
							</c:forEach>
						</select>
					 	<select name="roadid" id="roadid" style="width:100;" > 
						<!--  		<option value="${road.areaId}">${road.areaName}</option>   -->
						<c:forEach var="item" items="${roadlist}">
							<option value ="${item.areaId}" <c:if test="${item.areaId eq road.areaId}">selected</c:if>>${item.areaName}</option>	
						</c:forEach> 
						</select>
				</td>								
				</tr>
			<tr class="tr2">
			        <td  class="tr1" align="right">*灾区负责人:</td>
					<td><input type="text" name="principal" value="${disasterNode.principal}"></td>	
                    <td  class="tr1" align="right">联系电话:</td>
					<td><input type="text" name="phone" value="${disasterNode.phone}"></td>		
				</tr>
				<tr class="tr10">
    	  			<td align="center" colspan="4">
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
