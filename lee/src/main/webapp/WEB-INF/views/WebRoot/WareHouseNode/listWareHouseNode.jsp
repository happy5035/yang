<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
    
<title>�鿴�ֿ��</title>
<link href="<%=request.getContextPath()%>/style/gov_style_10.css" rel="stylesheet" type="text/css">
<link href="/BDplatformWeb/style/gov_style_10.css" rel="stylesheet" type="text/css">   
<script type="text/javascript" src="<%=path %>/js/jquery-1.8.0.js"></script>  
<script type="text/javascript"> 

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
 </head>
  
 <body>
<form id="DisasterNodeForm" name="DisasterNodeForm" method="post" theme="simple"  namespace="/" action="SearchWareHouse.action">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="<%=request.getContextPath()%>/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">�ֿ����Ϣ����>>��������ѯ�ֿ��</td>
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
					<td  class="tr1" align="right">�ֿ������:</td>
					<td><input type="text" name="wareHouseName" value=${wareHouseName}></td>
					<td  class="tr1" align="right">*�����ֺ��¼�����:</td>
					<td>
					<select id="emerTypeName" name="emerTypeName">
						<c:forEach var="item" items="${emerTypeName}">
							<option value="${item}" <c:if test="${item eq emergency.emerType.emerTypeName}">selected</c:if>>${item}</option>
						</c:forEach>
					</select>
					</td>
					<td  class="tr1" align="right">*�����ֺ��¼�:</td>
					<td>
					<select id="emerId" name="emerId">
						<c:forEach var="item" items="${emergencylist}">
							<option value="${item.emerId}" <c:if test="${item.emerId eq emergency.emerId}">selected</c:if>>${item.emerName}</option>
						</c:forEach>
					</select>
                    </td>	
                    </tr>					
			<tr class="tr10">
					<td  class="tr1" align="right">�ֿ�����:</td>
					<td><input type="text" name="wareHouseNo" value=${wareHouseNo}></td>
					<td  class="tr1" align="right">*�ֿ��ȼ�:</td>
					<td class="tr1">
					    <input type="radio" name="wareHouseLevel" value="P" <c:if test="${fn:contains(wareHouseLevel, 'P')}">checked</c:if>>ʡ
					    <input type="radio" name="wareHouseLevel" value="C" <c:if test="${fn:contains(wareHouseLevel, 'C')}">checked</c:if>>�� 
					    <input type="radio" name="wareHouseLevel" value="D" <c:if test="${fn:contains(wareHouseLevel, 'D')}">checked</c:if>>��/��
					</td>
					<td  class="tr1" align="right">*�ֿ�����:</td>
					<td class="tr1">
					    <input type="radio" name="property" value="C" <c:if test="${fn:contains(property, 'P')}">checked</c:if>>����
					    <input type="radio" name="property" value="L" <c:if test="${fn:contains(property, 'P')}">checked</c:if>>�ط�����
					    <input type="radio" name="property" value="S" <c:if test="${fn:contains(property, 'P')}">checked</c:if>>���� 
					</td>															
				</tr>
			<tr class="tr10">
    	  			<td align="center" colspan="6">
	   					<input type=image src="<%=request.getContextPath()%>/images/pub/lzoa_pub_search.gif" width="67" height="19" style="cursor:hand;border:0px" ; return false;">&nbsp;&nbsp;					
	  				</td>
  				</tr>
			</table>
		</td>
    </tr>
</table>
 <table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="<%=request.getContextPath()%>/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">�ֿ����Ϣ����>>�鿴���вֿ��</td>
                </tr>
            </table></td>
          <td width="50%"></td>
        </tr>
      </table></td>
  </tr>
</table> 

<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="20"></td>
  </tr>
  <tr>
    <td width="100%" align="center">
      <table width="800" cellspacing="1" border="0" class="table1" height="95">
        <tr class="tr1" align="center">
          <td width="5%"><b>�ֿ������</b></td>
          <td width="5%"><b>�ֿ������</b></td>
          <td width="5%"><b>�����ֺ��¼�����</b></td>
          <td width="5%"><b>�����ֺ��¼�</b></td>
          <td width="5%"><b>���ھ���</b></td>
          <td width="5%"><b>����γ��</b></td>
          <td width="5%"><b>��ϸ��ַ</b></td>
          <td width="5%"><b>��ע</b></td>
          <td width="3%"><b>�޸�</b></td>
          <td width="3%"><b>ɾ��</b></td>
        </tr>

       <c:forEach var="item" items="${Pagelist}" varStatus="status">
        	<tr class="tr2" align="center">
	        	<td>${item.nodes.nodeName}</td>
	        	<td><a href="DetailWareHouse.action?wnodeId=${item.nodes.nodeId}">�ֿ������</a></td>
	        	<td>${item.emergency.emerType.emerTypeName}</td>	        	
	        	<td>${item.emergency.emerName}</td>        	
	        	<td>${item.nodes.longitude}</td> 
	        	<td>${item.nodes.latitude}</td>
	        	<td>${item.nodes.address}</td>
	        	<td>${item.nodes.notes}</td>                  
	    		<td><a href="EditWareHouse.action?nodeId=${item.nodes.nodeId}&enrelationId=${item.enrelationId}">�޸�</a></td>
	    		<td><a href="DeleteWareHouse.action?nodeId=${item.nodes.nodeId}&wareHouseName=${wareHouseName}&wareHouseNo=${wareHouseNo}&emerId=${emerId}&wareHouseLevel=${wareHouseLevel}&property=${property}&enrelationId=${item.enrelationId}">ɾ��</a></td>	
	    	</tr>
		</c:forEach>
      </table>    
    </td>
 </tr>
</table>
</form>
<div align="right""><%@ include file="../page.jsp"%></div> 
</body>
</html>
