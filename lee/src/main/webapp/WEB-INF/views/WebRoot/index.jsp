<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
    This is my JSP page. <br>
    <table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="/lee/static//images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">�ֺ������>>&gt;&gt;<a href="gotoAddDisaster.action">����ֺ���</a>&nbsp;&nbsp; <a href="getAllArea.action">�鿴�����ֺ��㼰���ӹ�ϵ</a> &nbsp;&nbsp;<a href="GotoSearchDisasterNode.action">�鿴�ֺ�����ϸ��Ϣ</a></td>
                </tr>
                <tr>
					<td width="100%" class="f3">�ֿ�����>>&gt;&gt;<a href="gotoAddWareHouse.action">��Ӳֿ��</a>&nbsp;&nbsp; <a href="getAllArea.action">�鿴���нڵ㼰���ӹ�ϵ</a> &nbsp;&nbsp;<a href="GotoSearchWareHouse.action">�鿴�ֿ����ϸ��Ϣ</a></td>
                </tr>
                <tr>
					<td width="100%" class="f3">���ӱ߹���>>&gt;&gt;<a href="gotoAddEdge.action">������ӱ�</a>&nbsp;&nbsp; <a href="getAllArea.action">�鿴�����ֺ��㼰���ӹ�ϵ</a> &nbsp;&nbsp;<a href="SearchPermission.action">����ռ�ù�ϵ</a></td>
                </tr>
                <tr>
					<td width="100%" class="f3">���ʹ���>>&gt;&gt;<a href="gotoAddGoods.action">�������</a>&nbsp;&nbsp; <a href="GotoSearchGoods.action">�鿴��������</a></td>
                </tr>
                <tr>
					<td width="100%" class="f3">���乤�߹���>>&gt;&gt;<a href="gotoAddTrsport.action">������乤��</a>&nbsp;&nbsp; <a href="GotoSearchTrsport.action">�鿴�������乤��</a></td>
                </tr>
                <tr>
					<td width="100%" class="f3">�ڵ�������֮�������ϵ����>>&gt;&gt;<a href="gotoAddGoodsRel.action">��ӽڵ�������֮�������ϵ</a>&nbsp;&nbsp; <a href="GotoSearchGoodsRel.action">�鿴���нڵ�������֮�������ϵ</a></td>
                </tr>
                <tr>
					<td width="100%" class="f3">�ֺ��¼�����>>&gt;&gt;<a href="gotoAddEmergency.action">����ֺ��¼�</a>&nbsp;&nbsp; <a href="GotoSearchEmergency.action">�鿴�����ֺ��¼�</a></td>
                </tr>
                <tr>
					<td width="100%" class="f3">һ�������Ķ�������>>&gt;&gt;<a href="one_Trsportation.action">һ�������Ķ�������</a>&nbsp;&nbsp; <a href="GotoSearchEmergency.action">�鿴�����ֺ��¼�</a></td>
                </tr>
            </table></td>
          <td width="50%"></td>
        </tr>
      </table></td>
  </tr>
</table> 
  </body>
</html>
