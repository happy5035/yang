
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
    
<title>�鿴���乤��</title>
<link href="<%=request.getContextPath()%>/style/gov_style_10.css" rel="stylesheet" type="text/css">
<link href="/BDplatformWeb/style/gov_style_10.css" rel="stylesheet" type="text/css">   
<script type="text/javascript" src="<%=path %>/js/jquery-1.8.0.js"></script>  
<script type="text/javascript"> 

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

</script> 
 </head>
  
 <body>
<form id="TrsportForm" name="Trsport" method="post" theme="simple"  namespace="/" action="SearchTrsport.action">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="<%=request.getContextPath()%>/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">���乤�߹���>>��������ѯ���乤��</td>
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
					<td  class="tr1" align="right">���乤�߳��ƺ�:</td>
					<td><input type="text" name="busNumber" value=${busNumber}></td>
					<td  class="tr1" align="right">���乤�߱��:</td>
					<td><input type="text" name="transNo" value=${transNo}></td>
					<td  class="tr1" align="right">*���乤������:</td>									
					<td>
					<select id="transType" name="transType">
                        <c:forEach var="item" items="${transTypeName}">
							<option value="${item}" <c:if test="${item eq tranModel.transType}">selected</c:if>>${item}</option>
						</c:forEach>
     				</select>										
					<select id="tranModelId" name="tranModelId">
						<c:forEach var="item" items="${tranModellist}">
							<option value="${item.tranModelId}" <c:if test="${item.tranModelId eq tranModel.tranModelId}">selected</c:if>>${item.loadWeight}</option>
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
					<td width="100%" class="f3">���乤�߹���>>�鿴�������乤��</td>
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
          <td width="5%"><b>���乤�߳��ƺ�</b></td>
          <td width="5%"><b>���乤�߱���</b></td>
          <td width="5%"><b>���乤������</b></td>
          <td width="5%"><b>���乤��״̬</b></td>
          <td width="5%"><b>��ʼ�����ڵ�</b></td>         
          <td width="5%"><b>��ע</b></td>
          <td width="3%"><b>�޸�</b></td>
          <td width="3%"><b>ɾ��</b></td>
        </tr>

       <c:forEach var="item" items="${Pagelist}" varStatus="status">
        	<tr class="tr2" align="center">
	        	<td>${item.busNumber}</td>
	        	<td>${item.transNo}</td>
	        	<td>${item.tranModel.transType}������${item.tranModel.loadWeight}��</td>	        	
	        	<td>${item.state}</td>
	        	<td>${item.nodes.nodeName}</td>
	        	<td>${item.note}</td>                
	    		<td><a href="EditTrsport.action?transId=${item.transId}">�޸�</a></td>
	    		<td><a href="DeleteTrsport.action?transId=${item.transId}&busNumber=${busNumber}&transNo=${transNo}&tranModelId=${tranModelId}">ɾ��</a></td>	
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
