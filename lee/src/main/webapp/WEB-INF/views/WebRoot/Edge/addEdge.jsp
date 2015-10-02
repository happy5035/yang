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
    <title>添加边</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
     <script type="text/javascript" src="<%=path %>/js/jquery-1.8.0.js"></script>  
     <script type="text/javascript"> 
function cbt_local()
{
if(document.forms[0].logiccabinetno.value =='')
{alert("逻辑柜编号不能为空");document.forms[0].logiccabinetno.focus(); return false;}
}
function cbt_res()
{
	document.getElementById("DisasterNodeForm").reset();
	return false;
}
function OpenWindow(){ 
	window.open("getAllArea.action?showinfoFlag=2&emerId="+document.getElementById("emerId").value); 	
	}	
	
function OpenWindow2(){ 
	window.open("getAllArea.action?showinfoFlag=3&emerId="+document.getElementById("emerId").value); 	
	} 
//子窗口关闭后，返回值到此处，进而设置起点、终点	
function setValue(dnodeId,disastername,flag,lng,lat){ 
        //起点
	if(flag == "2")
	   {document.getElementById("origin").value = disastername; 
	    document.getElementById("originid").value = dnodeId; 
	    document.getElementById("originLng").value = lng; 
	    document.getElementById("originLat").value = lat;
	   }
	   //终点
	if(flag == "3")
	    {document.getElementById("terminal").value = disastername; 
	     document.getElementById("terminalid").value = dnodeId;
	     document.getElementById("terminalLng").value = lng; 
	     document.getElementById("terminalLat").value = lat;
	    }
	    //画折线
	if(flag == "4")
	    {document.getElementById("axisx").value = dnodeId; 
	     document.getElementById("axisy").value = disastername;
	    }
	    //画曲线
	if(flag == "5")
	    {document.getElementById("axisx").value = dnodeId; 
	     document.getElementById("axisy").value = disastername;
	    }
	}  
		var checkflag = "false";
function drawline(){
    window.open("getAllArea.action?emerId="+document.getElementById("emerId").value+"&edgeType="+document.getElementById("edgeType").value); 
}

function drawline1(){
     window.open("getAllArea.action?showinfoFlag=5&emerId="+document.getElementById("emerId").value+"&originLng="+document.getElementById("originLng").value+"&originLat="+document.getElementById("originLat").value+"&terminalLng="+document.getElementById("terminalLng").value+"&terminalLat="+document.getElementById("terminalLat").value); 
     //alert("验证纬度");
     //alert("验证"+document.getElementById("axisx").value);
}

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
</script>

     <script type="text/javascript" src="<%=path %>/js/My97DatePicker/WdatePicker.js"></script>  

  </head>
  
  <body>
<form id="EdgeForm" method="post"  name="EdgeForm" action="saveEdge.action">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="<%=request.getContextPath()%>/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">连接边管理&gt;&gt;添加连接边</td>
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
				<td  class="tr1" align="right">起点:</td>
				<td><input type="text" id="origin" onclick="OpenWindow()" name="origin" ></td>
				<td  class="tr1" align="right">终点:</td>
				<td><input type="text" id="terminal" onclick="OpenWindow2()"  name="terminal" ></td>
			</tr>
			<tr class="tr2">
					<td  class="tr1" align="right" >*边名称:</td>
					<td><input type="text" name="edgeName" ></td>	
					<td  class="tr1" align="right" >*边编码:</td>
					<td><input type="text" name="edgeNo" ></td>				
			</tr>
			<tr class="tr2">
					<td  class="tr1" align="right">*边的类型:</td>
					<td><input type="radio" name="edgeType" id="edgeType" value="H">公路 <input type="radio" name="edgeType" id="edgeType" value="R">铁路<input type="radio" name="edgeType" id="edgeType" value="A">航空</td>
					<td  class="tr1" align="right">*长度:</td>
					<td><input type="text" name="length" ></td>				
				</tr>
			<tr class="tr10">
    	  			<td align="center" colspan="4">
    	  				 &nbsp;&nbsp;
    	  				 <input type=button value="查看曲线" onclick="drawline1()">
    	  				 <input type=button value="去画折线" onclick="drawline()">
    	  				 <input type=image src="<%=request.getContextPath()%>/images/pub/lzoa_pub_save.gif" width="67" height="19" style="cursor:hand;border:0px" ;  onClick="return cbt_local();  return false;">
                         <input type="image" src="<%=request.getContextPath()%>/images/pub/lzoa_pub_reset.gif" width="67" height="19" style="cursor:hand" onClick="return cbt_res();">
	   					<a href="javascript:history.back(-1);"><img border="0" src="<%=request.getContextPath()%>/images/pub/lzoa_pub_back.gif"/></a> 
	  				</td>
  			</tr>
			</table>
		</td>
    </tr>
</table>
<input type="hidden" id="originid" name="originid">
<input type="hidden" id="terminalid"  name="terminalid" >
<input type="hidden" id="originLng" name="originLng">
<input type="hidden" id="originLat"  name="originLat" >
<input type="hidden" id="terminalLng" name="terminalLng">
<input type="hidden" id="terminalLat"  name="terminalLat" >
<input type="hidden" id="axisx"  name="axisx" >
<input type="hidden" id="axisy"  name="axisy" >
</form> 
</body>
</html>
