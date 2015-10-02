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
    
<title>�鿴����</title>
<link href="<%=request.getContextPath()%>/style/gov_style_10.css" rel="stylesheet" type="text/css">
<link href="/BDplatformWeb/style/gov_style_10.css" rel="stylesheet" type="text/css">   
<script type="text/javascript" src="<%=path %>/js/jquery-1.8.0.js"></script>  
<script type="text/javascript"> 

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
 </head>
  
 <body>
<form id="GoodsForm" name="GoodsForm" method="post" theme="simple"  namespace="/" action="SearchGoods.action">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="<%=request.getContextPath()%>/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">���ʹ���>>��������ѯ����</td>
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
					<td  class="tr1" align="right">��������:</td>
					<td><input type="text" name="goodsName" value=${goodsname}></td>
					<td  class="tr1" align="right">���ʱ��:</td>
					<td><input type="text" name="goodsNo" value=${goodsno}></td>
					<td  class="tr1" align="right">*��������:</td>									
					<td>
					<select id="goodsTypeName" name="goodsTypeName">
                        <c:forEach var="item" items="${goodsTypeName}">
							<option value="${item}" <c:if test="${item eq goodsType.goodsTypeName}">selected</c:if>>${item}</option>
						</c:forEach>
     				</select>										
					<select id="goodsTypeId" name="goodsTypeId">
						<c:forEach var="item" items="${goodsTypelist}">
							<option value="${item.goodsTypeId}" <c:if test="${item.goodsTypeId eq goodsType.goodsTypeId}">selected</c:if>>${item.grade}</option>
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
					<td width="100%" class="f3">���ʹ���>>�鿴��������</td>
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
          <td width="5%"><b>��������</b></td>
          <td width="5%"><b>���ʱ��</b></td>
          <td width="5%"><b>��������</b></td>
          <td width="5%"><b>��Ҫ��;</b></td>
          <td width="5%"><b>������λ</b></td>
          <td width="5%"><b>������</b></td>
          <td width="5%"><b>���</b></td>
          <td width="5%"><b>�ߴ��С</b></td>
          <td width="5%"><b>��ע</b></td>
          <td width="3%"><b>�޸�</b></td>
          <td width="3%"><b>ɾ��</b></td>
        </tr>

       <c:forEach var="item" items="${Pagelist}" varStatus="status">
        	<tr class="tr2" align="center">
	        	<td>${item.goodsName}</td>
	        	<td>${item.goodsNo}</td>
	        	<td>${item.goodsType.grade}${item.goodsType.goodsTypeName}</td>	        	
	        	<td>${item.mainUse}</td>
	        	<td>${item.measureUnit}</td>
	        	<td>${item.guaranteePeriod}</td>	        	
	        	<td>${item.specification}</td>
	        	<td>${item.size}</td>
	        	<td>${item.note}</td>                
	    		<td><a href="EditGoods.action?goodsId=${item.goodsId}">�޸�</a></td>
	    		<td><a href="DeleteGoods.action?goodsId=${item.goodsId}&goodsName=${goodsName}&goodsNo=${goodsNo}&goodsTypeId=${goodsTypeId}">ɾ��</a></td>	
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
