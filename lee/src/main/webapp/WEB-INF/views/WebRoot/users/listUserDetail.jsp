<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="<c:url value="/static/style/gov_style_10.css" />">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>�޸��û���Ϣ</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<script type="text/javascript">
function cbt_res()
{
	document.getElementById("stuForm").reset();
	return false;
}
</script>

  </head>
  
  <body>
<form name="stuForm" method="post" action="updateSystemuser">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="/lee/static/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="503" cellspacing="0" cellpadding="0" height="22">
                <tr>
					<td width="100%" class="f3">�û���Ϣ����</td>
                </tr>
            </table></td>
          <td width="50%"></td>
        </tr>
      </table></td>
  </tr>
</table>
<table align="center" width="50%" border="0" cellspacing="1" cellpadding="3">
	<tr>
		<td align="center" > 
			<table border="0" cellpadding="3" cellspacing="1" class="table3">
							<tr class="tr2">
			<td  class="tr1">�û�����:</td>
					<td>${userlogin.username}</td>
			</tr>
				<tr class="tr2">
					<td  class="tr1">��������:</td>
					<td>${userlogin.birdayS}</td>				
					</tr>
					<tr class="tr2">
					<td  class="tr1">֤������:</td>
					<td>
				    <c:if test="${fn:contains(userlogin.certitype, 0)}">����</c:if>
	    		    <c:if test="${fn:contains(userlogin.certitype, 1)}">���֤</c:if>
	    		    </td>					
				</tr>	
					<tr class="tr2">
					<td  class="tr1">֤������:</td>
					<td>${userlogin.certicobe}</td>	
									
				</tr>	
					<tr class="tr2">
					<td  class="tr1">��ϵ�绰:</td>
                   <td>${userlogin.cellphone}</td>				
                   </tr>
                   <tr class="tr2">
					<td  class="tr1">�ֻ�:</td>
                   <td>${userlogin.telephone}</td>				
                   </tr>
				<tr class="tr2" >
			<td  class="tr1">QQ:</td>
					<td>${userlogin.userqq}</td>
			</tr>
				<tr class="tr2">
					<td  class="tr1">����:</td>
					<td>${userlogin.email}</td>
					</tr>
					
					<tr class="tr2">
					<td  class="tr1">ע��ʱ��:</td>
					<td>${userlogin.registertimeS}</td>				
				</tr>	
					<tr class="tr2">
					<td  class="tr1">�û�����:</td>
					<td>
					<c:if test="${fn:contains(userlogin.usertype, 0)}">��ͨ�û�</c:if>
	    		    <c:if test="${fn:contains(userlogin.usertype, 1)}">����Ա�û�</c:if>		
	    		    </td>							
				</tr>	
					<tr class="tr2">
					<td  class="tr1">�û�״̬:</td>
					<td>
					<c:if test="${fn:contains(userlogin.userstate, 0)}">��ְ</c:if>
	    		    <c:if test="${fn:contains(userlogin.userstate, 1)}">��ְ</c:if>		
                    </td>	

                   </tr>                   
                   <tr class="tr2">
					<td  class="tr1">��¼��:</td>
					<td>${userlogin.logname}</td>				
				</tr>	
					<tr class="tr2">
					<td  class="tr1">��½����:</td>
					<td>${userlogin.logpwd}</td>	
									
				</tr>	
					<tr class="tr2">
					<td  class="tr1">�ܱ�����:</td>
                   <td>${userlogin.pwdquestion}</td>				
                   </tr>
                   <tr class="tr2">
					<td  class="tr1">�ܱ���:</td>
                   <td>${userlogin.pwdanswer}</td>				
                   </tr>
                   <tr class="tr2">
					<td class="tr1">��ע:</td>
                   <td>${userlogin.note}</td>				
                   </tr>
			
			
				<tr class="tr10">
    	  			<td align="center" colspan="4">
	   					<a href="javascript:history.back(-1);"><img border="0" src="/lee/static/images/pub/lzoa_pub_back.gif"/></a>         
	  				</td>
  				</tr>
			</table>
		</td>
    </tr>
</table>
       
 <input type="hidden" name="userid" id="userid" value="${userlogin.userid}"/>
                       
</form> 
</body>
</html>
