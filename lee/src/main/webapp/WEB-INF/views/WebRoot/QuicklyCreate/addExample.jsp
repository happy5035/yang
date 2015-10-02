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
	document.getElementById("EmergencyForm").reset();
	return false;
}

     $(document).ready(function(){          	
		    $( "#emerTypeName" ).change(function(){
		    $.ajax({
		    	type: "POST",
		    	url: "findLevel.action?emerTypeName="+encodeURI(encodeURI($(this).val())),
		    	cache: false,
		    	async: false,
		    	success: function(data){
		    		$("#emerTypeId").html(data);
		    	}});
		    $.ajax({
		    	type: "POST",
		    	url: "findDescribe.action?emerTypeId="+$("#emerTypeId").val()+"&amt=" + Math.random(),
		    	cache: false,
		    	async: false,
		    	success: function(data){
		    		$("#describe").html(data);
		    	}});
		    }); 		    
     }); 
     
     $(document).ready(function(){          	
		    $( "#emerTypeId" ).change(function(){
		    $.ajax({
		    	type: "POST",
		    	url: "findDescribe.action?emerTypeId="+encodeURI(encodeURI($(this).val())),
		    	cache: false,
		    	async: false,
		    	success: function(data){
		    		$("#describe").html(data);
		    	}});
		    }); 
     }); 
     
     
     



   //�ֺ��� 
   var  i=0;
   function addRow(TabId){  
   //alert("�ֺ���"+disasterName[i-1]);
   //��ȡҪ�����еı��
   var table = document.getElementById(TabId);
   //�����һ�в���һ��
   var newRow = table.insertRow(table.rows.length);
   //�ڸ��в��뵥Ԫ��
   var newCel1 = newRow.insertCell(0);
   var newCel2 = newRow.insertCell(1);
   var newCel3 = newRow.insertCell(2);
   var newCel4 = newRow.insertCell(3);
   var newCel5 = newRow.insertCell(4);
   newCel1.innerHTML = "<input type=\"text\" name=\"disasterName"+i+"\" id=\"disasterName"+i+"\" title=\"disasterName"+i+"\">";
   newCel2.innerHTML = "<input type=\"text\" name=\"disasterNo"+i+"\" id=\"disasterNo"+i+"\" title=\"disasterNo"+i+"\">";
   newCel3.innerHTML = "<input type=\"text\" name=\"principal"+i+"\" id=\"principal"+i+"\" title=\"principal"+i+"\">";
   newCel4.innerHTML = "<input type=\"text\" name=\"phone"+i+"\" id=\"phone"+i+"\" title=\"phone"+i+"\">";
   newCel5.innerHTML = "<input type=\"radio\" name=\"disasterLevel"+i+"\" id=\"disasterLevel"+i+"\" title=\"disasterLevel"+i+"\" value=\"C\">��<input type=\"radio\" name=\"disasterLevel"+i+"\" id=\"disasterLevel"+i+"\" title=\"disasterLevel"+i+"\" value=\"D\">��/��<input type=\"radio\" name=\"disasterLevel"+i+"\" id=\"disasterLevel"+i+"\" title=\"disasterLevel"+i+"\" value=\"T\">��/�ֵ�<input type=\"radio\" name=\"disasterLevel"+i+"\" id=\"disasterLevel"+i+"\" title=\"disasterLevel"+i+"\" value=\"V\">��";
   i++;
   document.getElementById("length1").value = i;
   }  
   function tb_delete(){
   i--;
   var ls_t=document.all("Tab1");
   ls_t.deleteRow() ;
   }
   //�ֿ��
   var  j=0;
   function addRow2(TabId){  
   //��ȡҪ�����еı��
   var table = document.getElementById(TabId);
   //�����һ�в���һ��
   var newRow = table.insertRow(table.rows.length);
   //�ڸ��в��뵥Ԫ��
   var newCel1 = newRow.insertCell(0);
   var newCel2 = newRow.insertCell(1);
   var newCel3 = newRow.insertCell(2);
   var newCel4 = newRow.insertCell(3);
   var newCel5 = newRow.insertCell(4);
   var newCel6 = newRow.insertCell(5);
   var newCel7 = newRow.insertCell(6);
   var newCel8 = newRow.insertCell(7);
   newCel1.innerHTML = "<input type=\"text\" name=\"wareHouseName"+j+"\" id=\"wareHouseName"+j+"\" title=\"wareHouseName"+j+"\">";
   newCel2.innerHTML = "<input type=\"text\" name=\"wareHouseNo"+j+"\" id=\"wareHouseNo"+j+"\" title=\"wareHouseNo"+j+"\">";
   newCel3.innerHTML = "<input type=\"radio\" name=\"wareHouseLevel"+j+"\" id=\"wareHouseLevel"+j+"\" title=\"wareHouseLevel"+j+"\" value=\"P\">ʡ<input type=\"radio\" name=\"wareHouseLevel"+j+"\" id=\"wareHouseLevel"+j+"\" title=\"wareHouseLevel"+j+"\" value=\"C\">��<input type=\"radio\" name=\"wareHouseLevel"+j+"\" id=\"wareHouseLevel"+j+"\" title=\"wareHouseLevel"+j+"\" value=\"D\">��/��";
   newCel4.innerHTML = "<input type=\"text\" name=\"dimensions"+j+"\" id=\"dimensions"+j+"\" title=\"dimensions"+j+"\">";
   newCel5.innerHTML = "<input type=\"radio\" name=\"property"+j+"\" id=\"property"+j+"\" title=\"property"+j+"\" value=\"C\">����<input type=\"radio\" name=\"property"+j+"\" id=\"property"+j+"\" title=\"property"+j+"\" value=\"L\">�ط�����<input type=\"radio\" name=\"property"+j+"\" id=\"property"+j+"\" title=\"property"+j+"\" value=\"S\">����";
   newCel6.innerHTML = "<input type=\"text\" name=\"capacity"+j+"\" id=\"capacity"+j+"\" title=\"capacity"+j+"\">";
   newCel7.innerHTML = "<input type=\"text\" name=\"administrator"+j+"\" id=\"administrator"+j+"\" title=\"administrator"+j+"\">";
   newCel8.innerHTML = "<input type=\"text\" name=\"phone"+j+"\" id=\"phone"+j+"\" title=\"phone"+j+"\">";
   j++;
   document.getElementById("length2").value = j;
   }  
   function tb_delete2(){
   j--;
   var ls_t=document.all("Tab2");
   ls_t.deleteRow() ;
   }
   
   function openDetail(){
			$.ajax({
				type: "post",
				url: "openGoodsRelDetail?"+"&randomn="+Math.random(),
				async: true,
				success: function(data){
				   $.each(data,function(idx,item){   				   
					    addEdge(item);//��������ڵ�ͼ��
					})					
				}			
			});
		}
</script>
     <script type="text/javascript" src="<%=path %>/js/My97DatePicker/WdatePicker.js"></script>  

  </head>
  
  <body>
<form id="EmergencyForm" method="post"  name="EmergencyForm" action="saveEmergency2.action">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="<%=request.getContextPath()%>/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">�ֺ��¼�����&gt;&gt;����ֺ��¼�</td>
                </tr>
            </table></td>
          <td width="50%"></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="50%" border="0" cellspacing="1" cellpadding="3" align="center">
	<tr>
		<td align="center" class="tr4"> 
			<table border="0" cellpadding="3" cellspacing="1" class="table3">
			<tr class="tr2">
				<td  class="tr1" align="right">�ֺ��¼�����:</td>
				<td><input type="text" name="emerName" ></td>	
				<td  class="tr1" align="right">�ֺ��¼�����:</td>
				<td><input type="text" name="emerNo" ></td>	
			</tr>
			<tr class="tr2">
					<td  class="tr1" align="right">�ֺ��¼�����:</td>									
					<td>
					<select id="emerTypeName" name="emerTypeName">
						<c:forEach var="item" items="${emerTypeName}">
							<option value="${item}">${item}</option>
						</c:forEach>
					</select>
					</td>		
					<td  class="tr1" align="right" >�ֺ��ȼ�:</td>
					<td>
					<select id="emerTypeId" name="emerTypeId">
						<c:forEach var="item" items="${emerTypelist}">
							<option value="${item.emerTypeId}">${item.level}</option>
						</c:forEach>
					</select>
					<select id="describe" name="describe">
						<c:forEach var="item" items="${emerTypelist2}">
							<option value="${item.emerTypeId}">${item.describe}</option>
						</c:forEach>
					</select>
				    </td>								
			</tr>
			<tr class="tr2">
					<td  class="tr1" align="right">�ֺ�����ʱ��:</td>
					<td><input class="Wdate" type="text" name="happenTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"><font color=red>&lt;- ���ѡ������</font></td>
					<td  class="tr1" align="right">�ֺ�����:</td>
					<td><input type="text" name="emerDescribe" ></td>				
				</tr>
			<tr class="tr2">
                    <td  class="tr1" align="right">���ǵ���:</td>
					<td><input type="text" name="inAddress" ></td>
					<td  class="tr1" align="right" >��ע:</td>
					<td><input type="text" name="note" ></td>				
				</tr>				
			<tr class="tr10">
    	  			<td align="center" colspan="4">
    	  				 &nbsp;&nbsp;
    	  				 <input type=image src="<%=request.getContextPath()%>/images/pub/lzoa_pub_save.gif" width="67" height="19" style="cursor:hand;border:0px" ;  onClick="return cbt_local();  return false;">
                         <input type="image" src="<%=request.getContextPath()%>/images/pub/lzoa_pub_reset.gif" width="67" height="19" style="cursor:hand" onClick="return cbt_res();">	   					
	  				</td>
  			</tr>
			</table>
		</td>
    </tr>
</table>
</form> 

<form id="DisasterNodeForm" method="post"  name="DisasterNodeForm" action="saveDisasterNode2.action">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="<%=request.getContextPath()%>/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">�ֺ��¼�����&gt;&gt;����ֺ���</td>
                </tr>
            </table></td>
          <td width="50%"></td>
        </tr>
      </table></td>
  </tr>
</table>
<center>
   <table id="Tab1" border="0" cellspacing="1" cellpadding="3">
     <tr class="tr2">
        <td class="tr1" align="middle">�ֺ�������</td>
        <td class="tr1" align="middle">�ֺ������</td>
        <td class="tr1" align="middle">����������</td>
        <td class="tr1" align="middle">��ϵ�绰</td>
        <td class="tr1" align="middle">�ֺ���ȼ�</td>
   </table>
   <input type="button" onclick="addRow('Tab1');" value="�����ֺ���"/>
   <input type=button value="ɾ���ֺ���" onclick="tb_delete()" >
   <input type=image src="<%=request.getContextPath()%>/images/pub/lzoa_pub_save.gif" width="67" height="19" style="cursor:hand;border:0px" ;  onClick="return cbt_local();  return false;">    <!-- "Ҫ��д����ת�ĵط���������" -->
   <input type="hidden" id="length1"  name="length1" >
   </center>   
</form>

<form id="WareHouseNodeForm" method="post"  name="WareHouseNodeForm" action="saveWareHouse2.action">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="<%=request.getContextPath()%>/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">�ֺ��¼�����&gt;&gt;��Ӳֿ��</td>
                </tr>
            </table></td>
          <td width="50%"></td>
        </tr>
      </table></td>
  </tr>
</table>
<center>
   <table id="Tab2" border="0" cellspacing="1" cellpadding="3">
     <tr class="tr2">
        <td class="tr1" align="middle">�ֿ������</td>
        <td class="tr1" align="middle">�ֿ�����</td>
        <td class="tr1" align="middle">�ֿ��ȼ�</td>        
        <td class="tr1" align="middle">�ֿ��ģ</td>
        <td class="tr1" align="middle">�ֿ�����</td>
        <td class="tr1" align="middle">�ֿ�����</td>
        <td class="tr1" align="middle">�ֿ����Ա</td>
        <td class="tr1" align="middle">��ϵ�绰</td>
   </table>
   <br><input type="button" onclick="addRow2('Tab2');" value="���Ӳֿ��"/>
   <input type=button value="ɾ���ֿ��" onclick="tb_delete2()" >
   <input type=image src="<%=request.getContextPath()%>/images/pub/lzoa_pub_save.gif" width="67" height="19" style="cursor:hand;border:0px" ;  onClick="return cbt_local();  return false;">    <!-- "Ҫ��д����ת�ĵط���������" -->
   <input type="hidden" id="length2"  name="length2" >
   </center>
</form>

<form id="GoodsRelForm" method="post"  name="GoodsRelForm" action="openGoodsRelDetail.action">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
    cellspacing="0" cellpadding="0" height="27">
        <tr>
          <td width="3%"><img src="<%=request.getContextPath()%>/images/desktop/icon-main-001.gif" width="29" height="27"></td>
          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
					<td width="100%" class="f3">�ֺ��¼�����&gt;&gt;������������ϵ</td>
                </tr>
            </table></td>
          <td width="50%"></td>
        </tr>
      </table></td>
  </tr>
</table>
<center>
   <table id="Tab3" border="0" cellspacing="1" cellpadding="3" style="display:block">
     <tr class="tr2">
        <td class="tr1" align="middle">�ڵ�/��������</td>
     <%
     Object m=request.getAttribute("number");      
     int b =Integer.valueOf(String.valueOf(m));
     System.out.println("�鿴"+b);
     
     //for(Nodes node : nodelist){
     //out.println("<li>" + node.getNodeName() + "</li>");
     for(int i=0;i<b;i++){
     pageContext.setAttribute("i",i);
     %>      
        <td class="tr1" align="middle">i+1</td>
     <% } %>
     </tr>
     
     <tr class="tr2">
     </tr>
     
   </table>
   <br><input type="button" onclick="openDetail();" value="չ������"/>
   <input type=image src="<%=request.getContextPath()%>/images/pub/lzoa_pub_save.gif" width="67" height="19" style="cursor:hand;border:0px" ;  onClick="return cbt_local();  return false;">    <!-- "Ҫ��д����ת�ĵط���������" -->
   </center>
</form>

</body>
</html>










