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
</script>
  <head>
    <base href="<%=basePath%>">
    
    <title>�޸�������ڵ㹩���ϵ</title>
    
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
 <form name="GoodsForm" action="UpdateGoodsRel.action" method="post" >
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="<%=request.getContextPath()%>/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">������ڵ㹩���ϵ����>>�޸�������ڵ㹩���ϵ</td>
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
				<td  class="tr1" align="right">*�ڵ�����:</td>
				<td>
				<select id="nodeId" name="nodeId">
						<c:forEach var="item" items="${nodellist}">
							<option value="${item.nodeId}" <c:if test="${item.nodeId eq goodsRel.nodes.nodeId}">selected</c:if>>${item.nodeName}</option>
						</c:forEach>
				</select>	
				</td>	
				<td  class="tr1" align="right">*��������:</td>
				<td>
				<select id="goodsId" name="goodsId">
						<c:forEach var="item" items="${goodslist}">
							<option value="${item.goodsId}" <c:if test="${item.goodsId eq goodsRel.goods.goodsId}">selected</c:if>>${item.goodsName}</option>
						</c:forEach>
				</select>	
				</td>	
			</tr>
			<tr class="tr2">
					<td  class="tr1" align="right">*��Ӧ������:</td>									
					<td><input type="radio" name="type" value="S" <c:if test="${fn:contains(goodsRel.demandNum, '+')}">checked</c:if>>�ɹ�Ӧ <input type="radio" name="type" value="F" <c:if test="${fn:contains(goodsRel.demandNum, '-')}">checked</c:if>>���� </td>					
					<td  class="tr1" align="right" >*����:</td>
					<td><input type="text" name="demandNum" value="${fn:substring(goodsRel.demandNum, 1, fn:length(goodsRel.demandNum) )}">${goodsRel.goods.measureUnit}</td>			
			</tr>
			<tr class="tr2">
					<td  class="tr1" align="right">*���ȼ�:</td>
					<td><input type="radio" name="priority" value="1" <c:if test="${fn:contains(goodsRel.priority, '1')}">checked</c:if>>���ȿ��� <input type="radio" name="priority" value="2" <c:if test="${fn:contains(goodsRel.priority, '2')}">>checked</c:if>>һ��<input type="radio" name="priority" value="3" <c:if test="${fn:contains(goodsRel.priority, '3')}">checked</c:if>>�����</td>					
					<td  class="tr1" align="right">*��ע:</td>
					<td><input type="text" name="note" value="${goodsRel.note}"></td>				
				</tr>
				<tr class="tr10">
    	  			<td align="center" colspan="4">
	   					<input type=image src="<%=request.getContextPath()%>/images/pub/lzoa_pub_save.gif" width="67" height="19" style="cursor:hand;border:0px" ; return false;">&nbsp;&nbsp;		
						<input type="image" src="<%=request.getContextPath()%>/images/pub/lzoa_pub_reset.gif" width="67" height="19" style="cursor:hand" onClick="return cbt_res();">
	   					<a href="javascript:history.back(-1);"><img border="0" src="<%=request.getContextPath()%>/images/pub/lzoa_pub_back.gif"/></a>         
	  				</td>
  				</tr>
			</table>
		</td>
    </tr>
</table>
<input type="hidden" name="goodsReId" id="goodsReId" value="${goodsRel.goodsReId}"/> 
</form>  
   
   
   
  </body>
</html>
