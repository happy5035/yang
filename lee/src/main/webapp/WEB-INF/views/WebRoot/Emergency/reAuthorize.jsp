<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
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
    
    <title>My JSP 'retpwd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script type="text/javascript">
function cbt_local()
{
if(document.forms[0].username.value =='')
{alert("�û�����Ϊ��");document.forms[0].logpwd.focus(); return false;}

if(document.forms[0].certicobe.value =='')
{alert("�ڸ�ϵͳ�����֤�����벻��Ϊ��");document.forms[0].newpsd1.focus(); return false;}

if(document.forms[0].logname.value =='')
{alert("��¼������Ϊ��");document.forms[0].newpsd2.focus(); return false;}

if(document.forms[0].logpwd.value =='')
{alert("��½���벻��Ϊ��");document.forms[0].newpsd2.focus(); return false;}
}



	function cbt_res()
	{
		document.getElementById("reAuthorizeForm").reset();
		return false;
	}
	</script>
  </head>
  
  <body>
    <form id="reAuthorizeForm" method="post"  name="reAuthorizeForm" action="reAuthorize.action">
    <table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="<%=request.getContextPath()%>/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">�ֺ��¼�����&gt;&gt;������û���Ȩ</td>
                </tr>
            </table></td>
          <td width="50%"></td>
        </tr>
      </table></td>
  </tr>
</table>
<table align="center" width="50%" border="0" cellspacing="1" cellpadding="3">
	<tr>
		<td align="center" class="tr4"> 
			<table border="0" cellpadding="3" cellspacing="1" class="table3">
			   <tr class="tr2">
				<td  class="tr1">*�ֺ��¼�:</td>
					<td>
					<select id="emerId" name="emerId">
						<c:forEach var="item" items="${emergencylist}">
							<option value="${item.emerId}">${item.emerName}</option>
						</c:forEach>
					</select>
                    </td>	
				<tr class="tr2">
					<td  class="tr1">*�û�����:</td>
					<td><input type="text" name="username" ></td>			
				</tr>
				<tr class="tr2">
					<td  class="tr1">*�ڸ�ϵͳ�����֤������:</td>
					<td><input type="text" name="certicobe" ></td>				
				</tr>
				<tr class="tr2">
					<td  class="tr1">*��¼��:</td>
					<td><input type="text" id="logname" name="logname"></td>			
				</tr>
				<tr class="tr2">
					<td  class="tr1">*��½����:</td>
					<td><input type="text" name="logpwd" ></td>				
				</tr>
			<tr class="tr10">
    	  			<td align="center" colspan="4">
	   					<input type="image" src="<%=request.getContextPath()%>/images/pub/lzoa_pub_save.gif" width="67" height="19" style="cursor:hand;border:0px" ; onClick="return cbt_local(); return false;">&nbsp;&nbsp;		
						<input type="image" src="<%=request.getContextPath()%>/images/pub/lzoa_pub_reset.gif" width="67" height="19" style="cursor:hand" onClick="return cbt_res();">    
	  				</td>
  				</tr>
			</table>
		</td>
    </tr>
</table>
</form>
</body>
</html>
