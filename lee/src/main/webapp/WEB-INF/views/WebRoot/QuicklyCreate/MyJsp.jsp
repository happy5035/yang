<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
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
   <div id="denglu" style="display:block;>
   <form name="form1" action="/kcglxt/UserSer" method="post">    	    
<div style="width:300px;height:200px;margin:0 auto;">
<p>QQ:<input type="text" name="qq"><br><br>密码:<input type="password" name="spass">
   	 <br>${requestScope.error}<br>
    	 <input type="button" value="登录" onclick="form1submit()" />
    	 <input type="hidden" name="status" value="loginUser" />  
    	 <!-- <a  href="/kcglxt/signIn.jsp">注册</a> -->
    	 <input type="button" onclick="change()" value="注册"/>
    	 ${requestScope.success} 	  
    	 </p>
 	 </div>
    </form>
    </div>
    <div id="zhuce" style="display:none;">
    <form name="form2" action="/kcglxt/UserSer" method="post">
    <table align="center">
    <tr>
    <td style="text-align:center">  
    	 QQ:<input type="text" name="qq" /><font color=red>*</font>${requestScope.ttt}<br>
    	 </td>
     </tr> 
     <tr>
     <td>
    	   密码:<input type="password" name="spass"/><font color=red>*</font><br>
    	   </td>
     </tr> 
     <tr>
     <td>
    	  确认密码:<input type="password" name="cpass"/><font color=red>*</font><br/> 
     	<input type="button" value="注册" onclick="form2submit()"/>
     	${requestScope.fault}
     	<input type="hidden" name="status" value="signUser" />
     </td>
     </tr>  
    </table>
     </form>
    </div>
    <script type="text/javascript">
function change(){
document.getElementById("denglu").style.display="none";
document.getElementById("zhuce").style.display="block";
}
function form1submit(){
alert('form1');
document.form1.submit();
}
function form2submit(){
alert('form2');
document.form2.submit();
}
</script>
  </body>
</html>
