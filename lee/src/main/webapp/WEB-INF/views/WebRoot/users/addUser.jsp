<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<c:url value="/static/style/gov_style_10.css" />"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>����û���Ϣ</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.2.js"></script>
     <script type="text/javascript" src="<c:url value="/static/js/js/jquery-1.8.0.js"/>"></script>  
     <script type="text/javascript"> 
	function cbt_res()
	{
		document.getElementById("boxForm").reset();
		return false;
	}
	
	function validate(logname)
	{alert("����validate");
				if (!(logname.match(/^\S+$/))) {alert("��¼������Ϊ��");return false;}
			    $.ajax({
			    	type: "POST",
			    	url: "checkUser.action?logname="+logname,
			    	cache: false,
			    	async: false,
			    	success: function(data){
			    		if(data==1){alert(logname+"�û����Ѿ����ڣ�");}
		                else if(data==2){alert("��¼������Ϊ�գ�");}
	                }
	              });		   
	}
</script>
     <script type="text/javascript" src="<c:url value="/static/js/js/My97DatePicker/WdatePicker.js"/>"></script>  

  </head>
  
  <body>
<form id="boxForm" method="post"  name="boxForm" action="saveUser">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="/lee/static/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
                <td width="100%" class="f3">�û���Ϣ����>>����û���Ϣ</td>
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
			<tr>
			<!--<td  class="tr1">������ͱ��:</td>
					<td><input type="integer" name="boxtypeid" ></td>
			</tr>
			--><tr class="tr2">
			<td  class="tr1">�û�����:</td>
					<td><input type="text" name="username" ></td>
			</tr>
				<tr class="tr2">
					<td  class="tr1">��������:</td>
					<td><input class="Wdate" type="text" name="birday" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" ><font color=red> &lt;- ���ѡ������</font></td>				
					</tr>
					<tr class="tr2">
					<td  class="tr1">֤������:</td>
					<td>
						<select name="certitype">
							<option value="1">���֤</option>
							<option value="0">����</option>
						</select>
					</td>					
				</tr>	
					<tr class="tr2">
					<td  class="tr1">֤������:</td>
					<td><input type="text" name="certicobe" ></td>	
									
				</tr>	
					<tr class="tr2">
					<td  class="tr1">��ϵ�绰:</td>
                   <td><input type="text" name="cellphone" ></td>				
                   </tr>
                   <tr class="tr2">
					<td  class="tr1">�ֻ�:</td>
                   <td><input type="text" name="telephone" ></td>				
                   </tr>
				<tr class="tr2">
			<td  class="tr1">QQ:</td>
					<td><input type="text" name="userqq" ></td>
			</tr>
				<tr class="tr2">
					<td  class="tr1">����:</td>
					<td><input type="text" name="email" ></td>
					</tr>
					
					<tr class="tr2">
					<td  class="tr1">ע��ʱ��:</td>
					<td><input class="Wdate" type="text" name="registertime" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" ><font color=red> &lt;- ���ѡ������</font></td>				
				</tr>						
					<tr class="tr2">
					<td  class="tr1">�û�״̬:</td>
                    <td>
						<select name="userstate">
							<option value="1">��ְ</option>
							<option value="0">��ְ</option>
						</select>
					</td> 
                   </tr>
                   	<tr class="tr2">
					<td  class="tr1">��¼��:</td>
					<td><input type="text" id="logname" name="logname" onBlur="validate(this.value);"></td>				
				</tr>	
					<tr class="tr2">
					<td  class="tr1">��½����:</td>
					<td><input type="text" name="logpwd" ></td>	
									
				</tr>	
					<tr class="tr2">
					<td  class="tr1">�ܱ�����:</td>
                   <td><input type="text" name="pwdquestion" ></td>				
                   </tr>
                   <tr class="tr2">
					<td  class="tr1">�ܱ���:</td>
                   <td><input type="text" name="pwdanswer" ></td>				
                   </tr>
                   <tr class="tr2">
					<td  class="tr1">��ע:</td>
                   <td><input type="text" name="note" ></td>				
                   </tr>
		<tr>
			<tr class="tr10">
    	  			<td align="center" colspan="4">
	   					<input type=image src="<c:url value="/static/images/pub/lzoa_pub_save.gif"/>" width="67" height="19" style="cursor:hand;border:0px" ; return false;">&nbsp;&nbsp;		
						<input type="image" src="<c:url value="/static/images/pub/lzoa_pub_reset.gif"/>" width="67" height="19" style="cursor:hand" onClick="return cbt_res();">
	   					<a href="javascript:history.back(-1);"><img border="0" src="<c:url value="/static/images/pub/lzoa_pub_back.gif"/>"/></a>         
	  				</td>
  				</tr>
			</table>			
		</td>
    </tr>
</form> 
</body>
</html>










