<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">

function submitUrl(page){
	var percount=${pageBean.pagecount };
	var url="${pageBean.url}&page="+page+"&percount="+percount;
	url=encodeURI(url); 
	window.location.href=url;
}

function goToPage(){
	var page=document.getElementById("go");
	var rule = /^[0-9]+$/;
	if(!rule.test(page.value)){
		alert("��������Ч��ҳ��!");
		page.focus();
		return;
	}
	var pageCount = ${pageBean.totalpage };
	if(page.value>pageCount){
		alert("�����ҳ�����!");
		page.focus();
		return;
	}
	if(page.value<1){
		alert("�����ҳ��������0!");
		page.focus();
		return;
	}
	submitUrl(page.value);
}
</script>
<c:if test="${pageBean.hasFirst}">
	<a href="#" onclick="submitUrl('${pageBean.first }')">��ҳ</a>
</c:if>
<c:if test="${!pageBean.hasFirst}">
	��ҳ
</c:if>
<c:if test="${pageBean.hasPreview}">
	<a href="#" onclick="submitUrl('${pageBean.preview }')">��һҳ</a>
</c:if>
<c:if test="${!pageBean.hasPreview}">
	��һҳ


</c:if>
<c:if test="${pageBean.hasNext}">
	<a href="#" onclick="submitUrl('${pageBean.next }')">��һҳ</a>
</c:if>
<c:if test="${!pageBean.hasNext}">
	��һҳ


</c:if>
<c:if test="${pageBean.hasEnd}">
	<a href="#" onclick="submitUrl('${pageBean.end }')">δҳ</a>
</c:if>
<c:if test="${!pageBean.hasEnd}">
	δҳ
</c:if>
����<input type="text" id="go" size="4" maxlength="5" style="width: 20px" value="${pageBean.current}" />ҳ


<input type="button" class="btn7" value="GO" onclick="goToPage();" />
��${pageBean.totalpage }ҳ&nbsp;&nbsp;${pageBean.pagecount }��/ҳ&nbsp;&nbsp;��${pageBean.total}��


