<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
    <title>�����ֺ��¼�ʵ��</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.2.js"></script>
     <script type="text/javascript" src="<%=path %>/js/jquery-1.8.0.js"></script>  
     <script type="text/javascript"> 
function cbt_res()
{
	document.getElementById("GoodsRelForm").reset();
	return false;
}
</script>
     <script type="text/javascript" src="<%=path %>/js/My97DatePicker/WdatePicker.js"></script>  

  </head>
  
  <body>
<form id="EdgeForm" method="post"  name="EdgeForm" action="saveEdge2.action">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="<%=request.getContextPath()%>/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">�ֺ��¼�����&gt;&gt;��ӽڵ����ӱ߹�ϵ</td>
                </tr>
            </table></td>
          <td width="50%"></td>
        </tr>
      </table></td>
  </tr>
</table> 
<!--  
<center>
 <table id="Tab3" border="0" cellspacing="1" cellpadding="3">
 <tr class="tr2">
<td  class="tr1" align="right">���ӱ�����:</td>
<td><input type="radio" name="edgeType" value="H">��· <input type="radio" name="edgeType" value="R">��·<input type="radio" name="edgeType" value="A">����</td>
</tr>
</table>
</center>
-->
<center>
   <table id="Tab3" border="0" cellspacing="1" cellpadding="3" style="display:block">
     <%
     Object m=request.getAttribute("number");  //�ڵ����Ŀ    
     int a =Integer.valueOf(String.valueOf(m));%>
     <tr class="tr2">
        <td class="tr1" align="middle">�ڵ�����</td>
     <%
     for(int i=0;i<a;i++){
     pageContext.setAttribute("i",i);
     %>      
        <td class="tr1" align="middle">${nodeNames[i]}</td>
     <% } %>
     </tr>
     
     <%  //�ڶ��м��Ժ���������
     for(int j=0;j<a;j++){
     pageContext.setAttribute("j",j);
      %>
      <tr class="tr2">   
         <td class="tr1" align="middle">${nodeNames[j]}</td>
      <%for(int k=0;k<j;k++){    
      pageContext.setAttribute("k", k);     
      String length="length"+j+","+k;
      pageContext.setAttribute("length", length); 
      String edgeNo="edgeNo"+j+","+k;
      pageContext.setAttribute("edgeNo", edgeNo);
      String edgeType="edgeType"+j+","+k;
      pageContext.setAttribute("edgeType", edgeType);        
      %>
      <td class="tr8">���룺<input type="text" name="${edgeNo}" ><br/><input type="radio" name="${edgeType}" value="H">��· <input type="radio" name="${edgeType}" value="R">��·<input type="radio" name="${edgeType}" value="A">����</br>���ȣ�<input type="text" name="${length}" >ǧ��</td>
      <% } %>
      </tr>
      <% } %>
   </table>
   <input type=image src="<%=request.getContextPath()%>/images/pub/lzoa_pub_save.gif" width="67" height="19" style="cursor:hand;border:0px" ;  onClick="return cbt_local();  return false;">    <!-- "Ҫ��д����ת�ĵط���������" -->
   </center>
   <input type="hidden" id="length1"  name="length1" value="${number}">
</form>



</body>
</html>










