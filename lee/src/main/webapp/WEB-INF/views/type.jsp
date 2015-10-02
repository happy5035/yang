<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Custom TextBox - jQuery EasyUI Demo</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/static/easyui/1.4/themes/metro/easyui.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/static/easyui/1.4/themes/icon.css" />">
	<script type="text/javascript" src="<c:url value="/static/easyui/1.4/jquery.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/static/easyui/1.4/jquery.easyui.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/static/easyui/1.4/locale/easyui-lang-zh_CN.js" />"></script>
	<script type="text/javascript" src="<c:url value="/static/js/main.js" />"></script>
	<script type="text/javascript"></script>
</head>
<body>
    <form id="uForm" action="inserttype" method="post">
		<input name="code" type="text" placeholder="编码"/>
		<input name="name" type="text" placeholder="名称"/>
		<input type="submit"value="insert";>
	</form>
	<form id="gForm" action="updatetype" method="post">
		<input name="code" type="text" placeholder="编码"/>
		<input name="name" type="text" placeholder="名称"/>
		<input type="submit" value="update";>
	</form>
	<form id="dForm" action="deletetype" method="post">
		<input name="code" type="text" placeholder="编码"/>
		<input type="submit" value="delete";>
	</form>
		<form id="cForm" action="selecttype" method="post">
		<input name="code" type="text" placeholder="编码"/>
		<input type="submit" value="select";>
	</form>

</body>
</html>