<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
    
<title>�鿴����</title>
<link href="<%=request.getContextPath()%>/style/gov_style_10.css" rel="stylesheet" type="text/css">
<link href="/BDplatformWeb/style/gov_style_10.css" rel="stylesheet" type="text/css">   
<script type="text/javascript" src="<%=path %>/js/jquery-1.8.0.js"></script>  
<script type="text/javascript"> 

           $(document).ready(function(){          	
		    $( "#emerTypeName" ).change(function(){
		    $.ajax({
		    	type: "POST",
		    	url: "findLevel.action?emerTypeName="+encodeURI(encodeURI($(this).val())),
		    	cache: false,
		    	async: false,
		    	success: function(data){
		    		$("#emerTypeId").html(data);
		    	}});
		    }); 		    
     }); 
</script> 
 </head>
  
 <body>
<form id="GoodsForm" name="GoodsForm" method="post" theme="simple"  namespace="/" action="SearchEmergency.action">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="<%=request.getContextPath()%>/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">�ֺ��¼�����>>��������ѯ�ֺ��¼�</td>
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
					<td  class="tr1" align="right">�ֺ��¼�����:</td>
					<td><input type="text" name="emerName" value=${emerName}></td>
					<td  class="tr1" align="right">�ֺ��¼�����:</td>
					<td><input type="text" name="emerNo" value=${emerNo}></td>
					<td  class="tr1" align="right">*�ֺ��¼�����:</td>									
					<td>
					<select id="emerTypeName" name="emerTypeName">
					    <!--   <option value=""></option>  -->
                        <c:forEach var="item" items="${emerTypeName}">
							<option value="${item}" <c:if test="${item eq emerType.emerTypeName}">selected</c:if>>${item}</option>
						</c:forEach>
     				</select>										
					<select id="emerTypeId" name="emerTypeId">
					    <!--   <option value=""></option>  -->
						<c:forEach var="item" items="${emerTypelist}">
							<option value="${item.emerTypeId}" <c:if test="${item.emerTypeId eq emerType.emerTypeId}">selected</c:if>>${item.level}</option>
						</c:forEach>
					</select>
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
					<td width="100%" class="f3">�ֺ��¼�����>>�鿴�����������ֺ��¼�</td>
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
          <td width="5%"><b>�ֺ��¼�����</b></td>
          <td width="5%"><b>�ֺ��¼����</b></td>
          <td width="5%"><b>�ֺ��¼�����</b></td>
          <td width="5%"><b>�ֺ�����ʱ��</b></td>
          <td width="5%"><b>�ֺ�����</b></td>
          <td width="5%"><b>���ǵ���</b></td>
          <td width="5%"><b>��ע</b></td>
          <td width="3%"><b>�޸�</b></td>
          <td width="3%"><b>ɾ��</b></td>
        </tr>

       <c:forEach var="item" items="${Pagelist}" varStatus="status">
        	<tr class="tr2" align="center">
	        	<td>${item.emerName}</td>
	        	<td>${item.emerNo}</td>
	        	<td>${item.emerType.level}��${item.emerType.emerTypeName}</td>	        	
	        	<td><fmt:formatDate value="${item.happenTime}" pattern="yyyy-MM-dd"  /></td>
	        	<td>${item.emerDescribe}</td>
	        	<td>${item.inAddress}</td>	        	
	        	<td>${item.note}</td>                
	    		<td><a href="EditEmergency.action?emerId=${item.emerId}">�޸�</a></td>
	    		<td><a href="DeleteEmergency.action?emerId=${item.emerId}&emerName=${emerName}&emerNo=${emerNo}&emerTypeId=${emerTypeId}">ɾ��</a></td>	
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
