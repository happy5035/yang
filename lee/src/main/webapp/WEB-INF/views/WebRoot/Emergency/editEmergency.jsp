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
    <script type="text/javascript" src="<c:url value="/static/js/js/My97DatePicker/WdatePicker.js"/>"></script>
<script type="text/javascript">
function cbt_res()
{
  document.forms[0].reset();
  return false;
}

     $(document).ready(function(){          	
		    $( "#emerTypeName" ).change(function(){
		    $.ajax({
		    	type: "POST",
		    	url: "findLevel?emerTypeName="+encodeURI(encodeURI($(this).val())),
		    	cache: false,
		    	async: false,
		    	success: function(data){
		    		$("#emerTypeId").html(data);
		    	}});
		    $.ajax({
		    	type: "POST",
		    	url: "findDescribe?emerTypeId="+$("#emerTypeId").val()+"&amt=" + Math.random(),
		    	cache: false,
		    	async: false,
		    	success: function(data){
		    		$("#describe").html(data);
		    	}});
		    }); 		    
     }); 
     
     $(document).ready(function(){          	
		    $( "#emerTypeId" ).change(function(){
		    $.ajax({
		    	type: "POST",
		    	url: "findDescribe?emerTypeId="+encodeURI(encodeURI($(this).val())),
		    	cache: false,
		    	async: false,
		    	success: function(data){
		    		$("#describe").html(data);
		    	}});
		    }); 
     }); 
</script>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改灾害事件信息</title>
    
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
 <form name="EmergencyForm" action="UpdateEmergency.action" method="post" >
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="/lee/static/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">灾害事件管理>>修改灾害事件信息</td>
                </tr>
            </table></td>
          <td width="50%"></td>
        </tr>
      </table></td>
  </tr>
</table> 
<table width="50%" border="0" cellspacing="1" cellpadding="3" align="center">
	<tr>
		<td align="center" class="tr4"> 
			<table border="0" cellpadding="3" cellspacing="1" class="table3">			
			<tr class="tr2">
				<td  class="tr1" align="right">*灾害事件名称:</td>
				<td><input type="text" name="emername" value="${emergency.emername}"></td>
				<td  class="tr1" align="right">*灾害事件编码:</td>
				<td><input type="text" name="emerno" value="${emergency.emerno}"></td>	
			</tr>
			<tr class="tr2">
					<td  class="tr1" align="right">*灾害事件类型:</td>									
					<td>
					<select id="emerTypeName" name="emertypename">
                        <c:forEach var="item" items="${emerTypeName}">
							<option value="${item}" <c:if test="${item eq emergency.emertype.emertypename}">selected</c:if>>${item}</option>
						</c:forEach>
     				</select>	
     				</td>		
					<td  class="tr1" align="right" >*灾害等级判定依据:</td>	
					<td>								
					<select id="emerTypeId" name="emertypeid">
						<c:forEach var="item" items="${emerTypelist}">
							<option value="${item.emertypeid}" <c:if test="${item.emertypeid eq emergency.emertype.emertypeid}">selected</c:if>>${item.level}</option>
						</c:forEach>
					</select>
					<select id="describe" name="describe">
						<c:forEach var="item" items="${emerTypelist2}">
							<option value="${item.emertypeid}" <c:if test="${item.emertypeid eq emergency.emertype.emertypeid}">selected</c:if>>${item.describe}</option>
						</c:forEach>
					</select>
				    </td>	
				    </tr>
			<tr class="tr2">	
					<td  class="tr1" align="right" >*灾害发生时间:</td>
					<td><input class="Wdate" type="text" name="happentime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${emergency.happentimeS}"><font color=red>&lt;- 点击选择日期</font></td>			
					<td  class="tr1" align="right">*灾害描述:</td>
					<td><input type="text" name="emerdescribe" value="${emergency.emerdescribe}"></td>
				</tr>
			<tr class="tr2">
					<td  class="tr1" align="right">*覆盖地区:</td>
					<td><input type="text" name="inaddress" value="${emergency.inaddress}"></td>				
                    <td  class="tr1" align="right">备注:</td>
					<td><input type="text" name="note" value="${emergency.note}"></td>
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
<input type="hidden" name="emerid" id="emerId" value="${emergency.emerid}"/> 
</form>  
   
   
   
  </body>
</html>
