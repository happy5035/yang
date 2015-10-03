<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
    
<title>�鿴�ֺ���</title>
<link href="<c:url value="/static/style/gov_style_10.css" />" rel="stylesheet" type="text/css">
<link href="/BDplatformWeb/style/gov_style_10.css" rel="stylesheet" type="text/css">   
   <script type="text/javascript" src="<c:url value="/static/js/js/jquery-1.8.0.js"/>"></script> 
<script type="text/javascript"> 

            $(document).ready(function(){          	
		    $( "#emerTypeName" ).change(function(){
		    $.ajax({
		    	type: "POST",
		    	url: "findEmergency?emerTypeName="+encodeURI(encodeURI($(this).val())),
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
<form id="DisasterNodeForm" name="DisasterNodeForm" method="post" theme="simple"  namespace="/" action="SearchDisasterNode">
<table border="0" width="70%" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="/lee/static/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">�ֺ�����Ϣ����>>��������ѯ�ֺ���</td>
                </tr>
            </table></td>
          <td width="50%"></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="70%" border="0" cellspacing="1" cellpadding="3" align="center">
	<tr>
		<td align="center" class="tr4"> 
			<table border="0" cellpadding="3" cellspacing="1" class="table3">

				<tr class="tr2">
					<td  class="tr1" align="right">�ֺ�������:</td>
					<td><input type="text" name="disasterName" value=${disasterName}></td>
					<td  class="tr1" align="right">*�����ֺ��¼�����:</td>
					<td>
					<select id="emerTypeName" name="emerTypeName">
						<c:forEach var="item" items="${emerTypeName}">
							<option value="${item}" >${item}</option>
						</c:forEach>
					</select>
					</td>
					<td  class="tr1" align="right">*�����ֺ��¼�:</td>
					<td>
					<select id="emerId" name="emerId">
						<c:forEach var="item" items="${emergencylist}">
							<option value="${item.emerid}" >${item.emername}</option>
						</c:forEach>
					</select>
                    </td>	
                    </tr>					
			<tr class="tr2">
					<td  class="tr1" align="right">�ֺ�����:</td>
					<td><input type="text" name="disasterNo" value=${disasterNo}></td>
					<td  class="tr1" align="right">*����������:</td>
					<td><input type="text" name="principal" value=${principal}></td>
                    <td  class="tr1" align="right">*�ֺ���ȼ�:</td>
					<td><input type="radio" name="disasterLevel" value="C" <c:if test="${fn:contains(disasterLevel, 'C')}">checked</c:if>>��
					    <input type="radio" name="disasterLevel" value="D" <c:if test="${fn:contains(disasterLevel, 'D')}">checked</c:if>>��/��
					    <input type="radio" name="disasterLevel" value="T" <c:if test="${fn:contains(disasterLevel, 'T')}">checked</c:if>>��/�ֵ� 
					    <input type="radio" name="disasterLevel" value="V" <c:if test="${fn:contains(disasterLevel, 'V')}">checked</c:if>>��
					</td>
																	
				</tr>
			<tr class="tr10">
    	  			<td align="center" colspan="6">
	   					<input type=image src="/lee/static/images/pub/lzoa_pub_search.gif" width="67" height="19" style="cursor:hand;border:0px" ; return false;">&nbsp;&nbsp;					
	  				</td>
  				</tr>
			</table>
		</td>
    </tr>
</table>
 <table border="0" width="70%" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="/lee/static/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">�ֺ�����Ϣ����>>�鿴�����ֺ���</td>
                </tr>
            </table></td>
          <td width="50%"></td>
        </tr>
      </table></td>
  </tr>
</table> 

<table border="0" width="70%" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td width="100%" align="center">
      <table width="800" cellspacing="1" border="0" class="table1" height="95">
        <tr class="tr1" align="center">
          <td width="5%"><b>�ֺ�������</b></td>
          <td width="5%"><b>�ֺ�������</b></td>
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
	        	<td>${item.nodes.nodename}</td>
	        	<td><a href="DetailDisasterNode?dnodeId=${item.nodes.nodeid}">�ֺ�������</a></td>
	        	<td>${item.emertype.emertypename}</td>	        	
	        	<td>${item.emergency.emername}</td>        	
	        	<td>${item.nodes.longitude}</td> 
	        	<td>${item.nodes.latitude}</td>
	        	<td>${item.nodes.address}</td>
	        	<td>${item.nodes.notes}</td>                  
	    		<td><a href="EditDisasterNode.?nodeId=${item.nodes.nodeid}&enrelationId=${item.enrelationid}">�޸�</a></td>
	    		<td><a href="DeleteDisasterNode?nodeId=${item.nodes.nodeid}&disasterName=${disastername}&disasterNo=${disasterNo}&emerId=${emerId}&disasterLevel=${disasterLevel}&principal=${principal}&enrelationId=${item.enrelationid}">ɾ��</a></td>	
	    	</tr>
		</c:forEach>
      </table>    
    </td>
 </tr>
</table>
</form>
<div align="center"><%@ include file="../page.jsp"%></div> 
</body>
</html>
