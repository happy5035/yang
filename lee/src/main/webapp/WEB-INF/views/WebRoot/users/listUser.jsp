<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<title>�û���Ϣ�б�</title>
<style type="text/css">body{ text-align:center;}
</style>
<link href="<c:url value="/static/style/gov_style_10.css" />" rel="stylesheet" type="text/css">
<link href="/BDplatformWeb/style/gov_style_10.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	<!--
	function jumppage(currentIndex, showSize) {
		boxForm.offset.value = currentIndex;
		boxForm.submit();
	}
	//-->
</script>
</head>
<body topmargin="0" leftmargin="0">
<form id="boxForm" name="box" action="listUser.action" method="post">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="/lee/static/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
                <td width="100%" class="f3">�û���Ϣ����>>��������ѯ</td>
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
					<td  class="tr1" align="right">�û�����:</td>
					<td><input type="radio" name="usertype" value="0">��ͨ�û� <input type="radio" name="usertype" value="1">����Ա�û� </td>
					<td  class="tr1" align="right">��Ա״̬:</td>
					<td><input type="radio" name="userstate" value="0">��ְ<input type="radio" name="userState" value="1">��ְ</td>
					<td  class="tr1" align="right">�û�������</td>									
					<td><input type="text" name="username"></td>																
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
 <table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="/lee/static/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">�û���Ϣ����>>�û���Ϣ�б�</td>
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
      <table width="800" cellspacing="1" border="0" class="table1" height="95" align="">
        <tr class="tr1" align="center">
          <td width="5%"><b>���</b></td>
          <td width="8%"><b>�û�����</b></td>
          <td width="8%"><b>��������</b></td>
          <td width="10%"><b>֤������</b></td>
          <td width="10%"><b>֤������</b></td>   
          <td width="10%"><b>��ϵ�绰</b></td> 
          <td width="10%"><b>�ֻ�</b></td>
           <td width="10%"><b>QQ</b></td>
           <td width="5%"><b>����</b></td>
          <td width="10%"><b>����</b></td>
          <td width="4%"><b>�޸�</b></td>
          <td width="4%"><b>ɾ��</b></td>
        </tr>
        <% int i=1; %>
        <c:forEach var="item" items="${PageList}">
        	<tr class="tr2" align="center">
	        	<td><%=i++%></td>
	        	<td>${item.username}</td>
	        	<td>${item.birdayS}</td>
	        	<td> 
	        	<c:if test="${fn:contains(item.certitype, 0)}">����</c:if>
	    		<c:if test="${fn:contains(item.certitype, 1)}">���֤</c:if>
	        	</td>	
	        	<td>${item.certicobe}</td>
	            <td>${item.cellphone}</td>
	        	<td>${item.telephone}</td>
	            <td>${item.userqq}</td>
	            <td>${item.email}</td>
	            <td><a href="listUserDetail?userid=${item.userid}">����</a></td>
	    		<td><a href="editUser?userid=${item.userid}">�޸�</a></td>
	    		<td><a href="deleteUser?userid=${item.userid}&usertype=${usertype}&userstate=${userstate}&username=${username}">ɾ��</a></td>
	    		
    		</tr>
		</c:forEach>
      </table>
    </td>
 </tr>
</table>
</form>
<div align="right"><%@ include file="../page.jsp"%></div> 
</body>

 
</html>
