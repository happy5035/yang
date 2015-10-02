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
    <title>�������</title>    
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
{alert("�������Ʋ���Ϊ��");document.forms[0].logiccabinetno.focus(); return false;}
}
function cbt_res()
{
	document.getElementById("GoodsForm").reset();
	return false;
}

            $(document).ready(function(){          	
		    $( "#goodsTypeName" ).change(function(){
		    $.ajax({
		    	type: "POST",
		    	url: "findGrade.action?goodsTypeName="+encodeURI(encodeURI($(this).val())),
		    	cache: false,
		    	async: false,
		    	success: function(data){
		    		$("#goodsTypeId").html(data);
		    	}});
		    }); 
     }); 

</script>

     <script type="text/javascript" src="<%=path %>/js/My97DatePicker/WdatePicker.js"></script>  

  </head>
  
  <body>
<form id="GoodsForm" method="post"  name="GoodsForm" action="saveGoods.action">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="<%=request.getContextPath()%>/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">���ʹ���&gt;&gt;�������</td>
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
				<td  class="tr1" align="right">*��������:</td>
				<td><input type="text" name="goodsName" ></td>	
				<td  class="tr1" align="right">*���ʱ���:</td>
				<td><input type="text" name="goodsNo" ></td>	
			</tr>
			<tr class="tr2">
					<td  class="tr1" align="right">*��������:</td>									
					<td>
					<select id="goodsTypeName" name="goodsTypeName">
						<c:forEach var="item" items="${goodsTypeName}">
							<option value="${item}">${item}</option>
						</c:forEach>
					</select>
					<select id="goodsTypeId" name="goodsTypeId">
						<c:forEach var="item" items="${goodsTypelist}">
							<option value="${item.goodsTypeId}">${item.grade}</option>
						</c:forEach>
					</select>
				    </td>		
					<td  class="tr1" align="right" >*������λ:</td>
					<td><s:select name="measureUnit" list="%{#{'ǧ��':'ǧ��','��':'��','��':'��','����':'����'}}" value="ǧ��" theme="simple"/><font color=red>  *</font></td>			
			</tr>
			<tr class="tr2">
					<td  class="tr1" align="right">*�ߴ��С:</td>
					<td><input type="text" name="size" ></td>
					<td  class="tr1" align="right">*���:</td>
					<td><input type="text" name="specification" ></td>				
				</tr>
			<tr class="tr2">
                    <td  class="tr1" align="right">������:</td>
					<td><input type="text" name="guaranteePeriod" ></td>
					<td  class="tr1" align="right" >��Ҫ��;:</td>
					<td><input type="text" name="mainUse" ></td>				
				</tr>
				<tr class="tr2">
					<td  class="tr1" align="right">*��ע:</td>
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
