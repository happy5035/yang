4<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�����ͼ</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" href="<%=request.getContextPath()%>/style/gov_style_10.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/style/zTreeStyle.css">
	<style type="text/css">
		 
		#saDiv{ float:left; width:10%; height:800px;}
		#bMapDiv{ float:right; width:86%; height:800px;} 
	</style>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.ztree.core-3.4.js"></script><!--
	 <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
	--><script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=4fa4bb8fca02bdcbe06bb07be3a75fcc"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/DistanceTool/1.2/src/DistanceTool_min.js"></script>
<script type="text/javascript" charset="gbk"  src="http://api.map.baidu.com/library/MarkerTool/1.2/src/MarkerTool_min.js" ></script>   
<!--���������ƹ���-->
<script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
<link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" />
	<SCRIPT type="text/javascript">
		//zTree����
		var disastername;
		var dnodeId;
		var setting = {
			treeId: "areaTree", //����tree��id
			treeObj: null,
			
			data: {
				key:{
					name: "areaName", 
					title: "",
					url: null
				},
				simpleData: {
					enable: true,
					idKey: "areaId",
					pIdKey: "parAreaId",
					rootPid: "0"
				}
			},
			view: {
				fontCss: getFontCss
			},
			callback: {
				onClick: zTreeOnClick
			}
			
		};
 		
 		function focusKey(e) {
			if (key.hasClass("empty")) {
				key.removeClass("empty");
			}
		}
		function blurKey(e) {
			if (key.get(0).value === "") {
				key.addClass("empty");
			}
		}
		var lastValue = "", nodeList = [], fontCss = {};
		function searchNode(e) {
			var zTree = $.fn.zTree.getZTreeObj("areaTreeDiv");
			var value = $.trim(key.get(0).value);	
			if (lastValue === value) return;
			lastValue = value;		
			if (value === "") return;
			updateNodes(false);
			nodeList = zTree.getNodesByParamFuzzy("areaName", value);
			updateNodes(true);
			zTree.expandAll(true);//չ��ȫ���ڵ�

		}
		function updateNodes(highlight) {
			var zTree = $.fn.zTree.getZTreeObj("areaTreeDiv");
			for( var i=0, l=nodeList.length; i<l; i++) {
				nodeList[i].highlight = highlight;
				zTree.updateNode(nodeList[i]);
			}
		}
		function getFontCss(treeId, treeNode) {
			return (!!treeNode.highlight) ? {color:"#A60000", "font-weight":"bold"} : {color:"#333", "font-weight":"normal"};
		}
        getAllNodeCup();
        getAllEdge();
        //onetrsport();
		var key;
 		var areas=${areaList };
		$(document).ready(function(){
			$.fn.zTree.init($("#areaTreeDiv"), setting,areas);
			key = $("#txtSearch");		
			key.bind("focus", focusKey)
			.bind("blur", blurKey)
			.bind("propertychange", searchNode)
			.bind("input", searchNode);
			
		});		
		//���tree
		function zTreeOnClick(event, treeId, treeNode) {
		    map.clearOverlays();//�����ͼ�����и������ע��
		     getAllNodeCup();
             getAllEdge();
		    var zarealevel = parseInt(treeNode.areaLevel);
		    var zareaname = treeNode.areaName;	 
		   
		    if(zarealevel === 1){
				map.centerAndZoom(zareaname);
		    }else if( zarealevel === 2){
		    	map.centerAndZoom(treeNode.getParentNode().areaName);
		    	var local = new BMap.LocalSearch(map, {  
				 renderOptions:{map: map}  
				});  
				local.search(zareaname);  
		    }else if( zarealevel === 3){
		    
		    	map.centerAndZoom(treeNode.getParentNode().getParentNode().areaName);	
				var myGeo = new BMap.Geocoder();
				// ����ַ���������ʾ�ڵ�ͼ��,��������ͼ��Ұ
				myGeo.getPoint(treeNode.getParentNode().getParentNode().areaName+treeNode.getParentNode().areaName+zareaname, function(point){
				  if (point) {
				    map.centerAndZoom(point, 15);
				    //map.addOverlay(new BMap.Marker(point));
				  }
				}, treeNode.getParentNode().getParentNode().areaName);
				getNodeCup(treeNode);	    
		    }
		}; 
		
		//��ҳ�ս�����ʱ�򣬻�����нڵ���Ϣ�����б��
		function getAllNodeCup(){
			$.ajax({
				type: "post",
				url: "getNodesByEmer?emerId="+encodeURI(encodeURI($(this).val())),
				async: true,
				success: function(data){
				   $.each(data,function(idx,item){   				   
					    addMarker(item);//����ע������ڵ�ͼ��
					})					
				}			
			});
		}
		
		//��ҳ�ս�����ʱ�򣬻���������ӱ���Ϣ��������ʾ
		function getAllEdge(){
			$.ajax({
				type: "post",
				url: "getEdgesByEmer?emerId="+($(this).val()),
				async: true,
				success: function(data){
				   $.each(data,function(idx,item){   				   
					    addEdge(item);//��������ڵ�ͼ��
					})					
				}			
			});
		}
		//����ֺ�����Ϣ
		function getNodeCup(treeNode){
			$.ajax({
				type: "post",
				url: "getNodesByAreaId?areaid="+treeNode.areaId+"&randomn="+Math.random(),
				async: true,
				success: function(data){
				   $.each(data,function(idx,item){   				   
					    addMarker(item);//����ע������ڵ�ͼ��
					})
					
				}			
			});
		}
		//�ڵ�ͼ����ӱ�ע
		function addMarker(item){
		  var point = new BMap.Point(item.axisx, item.axisy);//������ע��
		  var myIcon = new BMap.Icon("http://api.map.baidu.com/img/markers.png", new BMap.Size(23, 25), {  
                        offset: new BMap.Size(10, 25), // ָ����λλ��   
                        imageOffset: new BMap.Size(0, 0 - 10 * 25) // ����ͼƬƫ��   
                    });
         // var myIcon = new BMap.Icon("<%=request.getContextPath()%>/picture/save.png", new BMap.Size(23, 25), {  
                      //  offset: new BMap.Size(10, 25), // ָ����λλ��   
                    //    imageOffset: new BMap.Size(0, 0 - 10 * 25) // ����ͼƬƫ��   
                   // });
                    //�Զ����ע--by ����          
		  var sContent;
		  if(item.type=='D'){ sContent =
			"<h4 style='margin:0 0 5px 0;padding:0.2em 0'>"+item.nodename+"</h4>" + 
			"<img style='float:right;margin:4px' id='imgDemo' src='picture/psb1.jpg' width='119' height='84'/>"+
			"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:0em'>"+item.installaddress+"</p>" +
			"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:0em'><b>"+"��������"+"</b></p>" + 
			"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:0em'>"+"ʳƷ��20t<br>"+"ҩƷ��10t<br>"+"����ˮ��300��"+"</p>" + 
			"</div>";}
			else if(item.type=='W'){ sContent =
			"<h4 style='margin:0 0 5px 0;padding:0.2em 0'>"+item.nodename+"</h4>" + 
			"<img style='float:right;margin:4px' id='imgDemo' src='picture/psb.jpg' width='119' height='84'/>"+
			"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:0em'>"+item.installaddress+"</p>" + 
			"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:0em'><b>"+"<br>���ʴ洢��"+"</b></p>" + 
			"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:0em'>"+"������Ʒ��1000t &nbsp;&nbsp;"+"ʳƷ��500t<br>"+"ҩƷ��500t &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+"����ˮ��2000��"+"</p>" + 
			"</div>";}
		 
		  var infoWindow = new BMap.InfoWindow(sContent);  // ������Ϣ���ڶ���
		  var marker;
		  //var marker = new BMap.Marker(point);
		  if(item.type=='D'){marker = new BMap.Marker(point);}
		  else if(item.type=='W') {marker = new BMap.Marker(point, {icon: myIcon});}   //������ע
		  marker.setTitle(item.nodename);//���ñ�ע�ı��⣬�����������ע��ʱ��ʾ�˱���;
		  marker.addEventListener("click", function(){ // ����¼���������     
		   this.openInfoWindow(infoWindow);//����Ϣ����
		   //ͼƬ��������ػ�infowindow
		   document.getElementById('imgDemo').onload = function (){
		   infoWindow.redraw();
			   }
		   nodeId=item.nodeId;
		   nodename=item.nodename;
		   address = item.address;
		   
		   });
		  map.addOverlay(marker);//����ע��ӵ���ͼ		 
		}
		
		//�ڵ�ͼ����ӱ�
		function addEdge(item){
		//alert("������ʾ��");
		//alert("������ʾ��1"+item.axisx);
		  //�����ݻ�����γ�ȡ��������·ŵ�������
		  var lngs=item.axisx.split(",");
		  var lats=item.axisy.split(",");
		   var edgeType = item.edgeType;//��ʾ������--by ����
		  //alert("������ʾ��2"+item.axisx);
		 // alert("������ʾ������1"+item.edgeType);
		  var points=[];	  
		  for(var j=0;j<lngs.length;j++)
		  {
		     points[j] = new BMap.Point(lngs[j],lats[j]);//������
		     //var marker = new BMap.Marker(points[j]);//������ע
		     //map.addOverlay(marker);  //��������ӵ���ͼ
		     
		  }	
		 
		  
		  var polyline;	  
		  /*if(lngs.length<100){polyline = new BMap.Polyline(points,{strokeColor:"red", strokeWeight:2, strokeOpacity:1});}
		  else polyline = new BMap.Polyline(points,{strokeColor:"blue", strokeWeight:2, strokeOpacity:1});*/
		  //var edge=[points[0],points[1],points[2],points[3]];
		  // alert("������ʾ������2"+item.edgeType);
		  if(edgeType == 'H'){polyline = new BMap.Polyline(points,{strokeColor:"GREEN", strokeWeight:1.7, strokeOpacity:1});}
		else  if(edgeType == 'R'){polyline = new BMap.Polyline(points,{strokeColor:"#cc00ff", strokeWeight:1.7, strokeOpacity:1});}
		else  if(edgeType == 'A'){polyline = new BMap.Polyline(points,{strokeColor:"#3366FF", strokeWeight:1.7, strokeOpacity:1});}
		   // else  polyline = new BMap.Polyline(points,{strokeColor:"green", strokeWeight:2, strokeOpacity:1});
		 //  alert("������ʾ������3"+item.edgeType);
		
		  //��ͬ���͵ı���ʾ��ͬ����ɫ--by ����
		  map.addOverlay(polyline);  //��������ӵ���ͼ
		  //alert("������ʾ��4"+points);		 
		}
		
		
		function showInfo(e){
			var showinfoFlag = $("#showinfoFlag").val();
			if(showinfoFlag == "1"){
				if(confirm("������Ϊ"+e.point.lng+ ", " + e.point.lat+"���Ƿ��ֺ���������ˣ�")){
					opener.setValue(e.point.lng, e.point.lat); 
					window.close(); 				
				}
			}
			//���ص���ҳ�汻���õĵط�addEdge.jsp��������flag="2"
            if(showinfoFlag == "2"){
				if(confirm("��ѡ��������'"+nodename+"'���Ƿ񽫴˴�����Ϊ��·��㣿")){
					opener.setValue(nodeId,nodename,flag="2",e.point.lng,e.point.lat); 
					window.close(); 				
				}
			}
			//���ص���ҳ�汻���õĵط�addEdge.jsp��������flag="2"
			if(showinfoFlag == "3"){
				if(confirm("��ѡ����յ���'"+nodename+"'���Ƿ񽫴˴�����Ϊ��·�յ㣿")){
					opener.setValue(nodeId,nodename,flag="3",e.point.lng,e.point.lat); 
					window.close(); 				
				}
			}
			//���ص���ҳ�汻���õĵط�addWareHouse.jsp
			if(showinfoFlag == "4"){
				if(confirm("������Ϊ"+e.point.lng+ ", " + e.point.lat+"���Ƿ񽫲ֿ��������ˣ�")){
					opener.setValue(e.point.lng, e.point.lat);  
					window.close(); 				
				}
			}
			//��ʾ����
			if(showinfoFlag == "5"){
		    var originLng = window.opener.document.getElementById('originLng').value;
		    var originLat = window.opener.document.getElementById('originLat').value;
		    var terminalLng = window.opener.document.getElementById('terminalLng').value;
		    var terminalLat = window.opener.document.getElementById('terminalLat').value;
			var axisx=[];    
            var axisy=[];
            var pts;
            var polyline; 
			var origin=new BMap.Point(originLng,originLat);
			var terminal=new BMap.Point(terminalLng,terminalLat);			    
			var driving = new BMap.DrivingRoute(map); //�ݳ�ʵ��
			// alert("�����ݳ�·��1");   
            driving.search(origin, terminal);  
           // alert("�����ݳ�·��2");           
 
            //��ѯ����         
            driving.setSearchCompleteCallback(function(){
            if (driving.getStatus() != BMAP_STATUS_SUCCESS){alert("�������û��ֱ�ӿɵ���·��");}
            if (driving.getStatus() == BMAP_STATUS_SUCCESS){alert("���������ֱ�ӿɵ���·��");
            pts = driving.getResults().getPlan(0).getRoute(0).getPath(); //ͨ���ݳ�ʵ�������һϵ�е������
            polyline = new BMap.Polyline(pts); 
            map.addOverlay(polyline); 
            for(var j=0;j<pts.length;j++)
            {
            axisx[j]=pts[j].lng;
            axisy[j]=pts[j].lat;
            }                              
            }        
            })//��ѯ����ʾ����          
            
            setTimeout(function(){
            //������ӱߵ�ʱ��addEdge.jsp�����ò���Ϊflag == "5"	
             //alert("�����ݳ�·��3");   
   			if(confirm("�Ƿ񱣴����߲��˳���")){   
					opener.setValue(axisx,axisy,flag="5","","");  
					window.close(); 				
				}	    
            ;;},1000)
   			
			}

		}
		//������̬��ʾ		
function onetrsport(){

     $.ajax({
				type: "post",
				url: "one_Trsportation?"+"&randomn="+Math.random(),
				async: true,
				success: function(data){
				   $.each(data,function(idx,item){   				   
					    cartoonStart(item);//��ʼ����
					})					
				}			
			});
}

//�ڵ�ͼ����ʾ���������Ķ�̬����
		function cartoonStart(item){
		//alert("����cartoonStart"+item.axisx);
		//alert("����cartoonStart"+item.axisy);
		//alert("����cartoonStart--edgeType"+item.edgeType); 
		  //�����ݻ�����γ�ȡ��������·ŵ�������
		  var lng=item.axisx.substring(0,item.axisx.length-1).split(",");
		  var lat=item.axisy.substring(0,item.axisy.length-1).split(",");
		 // alert("����cartoonStart--edgeType11"); 
		var edgeType=item.edgeType.substring(0,item.edgeType.length-1).split(",");
			var fnodename=item.fnodename.substring(0,item.fnodename.length-1).split(",");
			var snodename=item.snodename.substring(0,item.snodename.length-1).split(",");
		    //alert("����cartoonStart--edgeType22"); 
		  //��ʾ������--by ����
		  //alert("����cartoonStart--edgeType"+edgeType); 
		  //var lng=item.axisx.split(",");
		  //var lat=item.axisy.split(",");
		  var point=[];	
		 // alert("����cartoonStart"+lng);  
		  for(var j=0;j<lng.length;j++)
		  {
		     point[j] = new BMap.Point(lat[j],lng[j]);//������
	
		     
		  }		  
		 /* var myIcon = new BMap.Icon("http://api.map.baidu.com/img/markers.png", new BMap.Size(23, 25), {  
                        offset: new BMap.Size(2, 10), // ָ����λλ��   
                        imageOffset: new BMap.Size(0, 0 - 10 * 10) // ����ͼƬƫ��   
                    });
		  */
		  
		var myIcon ;
		if(edgeType=='H'){myIcon= new BMap.Icon("picture/truck2.jpg", new BMap.Size(43,30), { 
		//С��ͼƬ
         offset: new BMap.Size(100, 100), //�൱��CSS����
        imageOffset: new BMap.Size(0 , 0 - 10 * 10) //ͼƬ��ƫ������Ϊ����ͼƬ�ײ����Ķ�׼����㡣
         });}
         if(edgeType=='R'){myIcon= new BMap.Icon("picture/r1.jpg", new BMap.Size(43,30), { 
		//С��ͼƬ
         offset: new BMap.Size(100, 100), //�൱��CSS����
        imageOffset: new BMap.Size(0 , 0 - 10 * 10) //ͼƬ��ƫ������Ϊ����ͼƬ�ײ����Ķ�׼����㡣
         });}
          if(edgeType=='A'){myIcon= new BMap.Icon("picture/p1.jpg", new BMap.Size(43,30), { 
		//С��ͼƬ
         offset: new BMap.Size(100, 100), //�൱��CSS����
        imageOffset: new BMap.Size(0 , 0 - 10 * 10) //ͼƬ��ƫ������Ϊ����ͼƬ�ײ����Ķ�׼����㡣
         });}
		//ʵ�ֶ�ʱ������ʾ
		var carMk = new BMap.Marker(point[0],{icon:myIcon});
		var sContent;
		  if(edgeType=='H'){ 
		  //alert("������·--");
		  sContent ="<h4 style='margin:0 0 10px 0;padding:0.2em 0'>"+"����"+"</h4>" + 
			"<img style='float:right;margin:4px' id='imgDemo' src='picture/truckOigin.jpg' width='119' height='124'/>"+
			"<p style='margin:0;line-height:1.5;font-size:5px;text-indent:0em'>"+"<b>�ٶȣ�</b>80km/h<br><b>װж��ʱ�䣺</b><br>2h<br><b>��ʼ�ڵ㣺</b><br>"+item.fnodename+"<br><b>Ŀ��ڵ㣺</b><br>"+item.snodename+"<br><b>ҩƷ��</b>2t<br>"+"<b>ʳƷ��</b>3t"+"</p>" + 
			"</div>";}
			if(edgeType=='R'){
			//alert("������·--");
			sContent ="<h4 style='margin:0 0 5px 0;padding:0.2em 0'>"+"��"+"</h4>" + 
			"<img style='float:right;margin:4px' id='imgDemo' src='picture/trainOigin.jpg' width='119' height='124'/>"+
			"<p style='margin:0;line-height:1.5;font-size:5px;text-indent:0em'>"+"<b>�ٶȣ�</b>60km/h<br><b>װж��ʱ�䣺</b><br>5h<br><b>��ʼ�ڵ㣺</b><br>"+item.fnodename+"<br><b>Ŀ��ڵ㣺</b><br>"+item.snodename+"<br><b>ҩƷ��</b>5t<br>"+"<b>ʳƷ��</b>10t<br>"+"<b>����ˮ��</b>15t "+"<b>������Ʒ��</b>10t"+"</p>" + 
			"</div>";}
		 if(edgeType=='A'){ 
		// alert("���������ٶ�--");
		 sContent ="<h4 style='margin:0 0 5px 0;padding:0.2em 0'>"+"�ɻ�"+"</h4>" + 
			"<img style='float:right;margin:4px' id='imgDemo' src='picture/planeOigin.jpg' width='119' height='124'/>"+
			"<p style='margin:0;line-height:1.5;font-size:5px;text-indent:0em'>"+"<b>�ٶȣ�</b>200km/h<br><b>װж��ʱ�䣺</b><br>3h<br><b>��ʼ�ڵ㣺</b><br>"+item.fnodename+"<br><b>Ŀ��ڵ㣺</b><br>"+item.snodename+"<br><b>ҩƷ��</b>3t<br>"+"<b>ʳƷ��</b>2t<br>"+"<b>����ˮ��</b>10t "+"</p>" + 
			"</div>";}
		  var infoWindow = new BMap.InfoWindow(sContent);  // ������Ϣ���ڶ���
		 
		// var marker = new BMap.Marker( point[j]);
		carMk.addEventListener("click", function(){ // ����¼���������     
		   this.openInfoWindow(infoWindow);//����Ϣ����
		   //ͼƬ��������ػ�infowindow
		  document.getElementById('imgDemo').onload = function (){
		   infoWindow.redraw();
			  }
		  
		   
		   });
		
			 
		
		//alert("����cartoonStart��ͼƬ��λ");
        map.addOverlay(carMk); 
        //alert("����cartoonStart��ͼƬ��λ"+point[0].lng);             
        var len =point.length;
       resetMkPoint(1,len,point,carMk)

    
    function resetMkPoint(i,len,point,carMk){       
        carMk.setPosition(point[i]);
        //alert("����resetMkPoint������"+points[i].lng+"γ��"+points[i].lat);
        if(i < len){
            setTimeout(function(){
                i++;
                resetMkPoint(i,len,point,carMk);
            },100);
        }
    }
    
    
}	
		
		//�������ȷ���
		function oneScheme(){

     $.ajax({
				type: "post",
				url: "one_Scheme?"+"&randomn="+Math.random(),
				async: true,
				success: function(data){
				   $.each(data,function(idx,item){   				   
					    cartoonStart(item);//��ʼ����
					})					
				}			
			});
}
/*function areaclose(){

$.ajax({
				type: "post",
				url: "savepolylinepoints?axisx="+axisx+"&axisy="+axisy+"&randomn="+Math.random(),
				cache: false,
		    	async: false,
		    	success: function(data){
		    		$("#points").html(data);
		    	}});
		    	points=[];	//����������������գ��Է����¼��һ�����ߵ����겢����
		    	axisx=[];
		    	axisy=[];   

}*/		
	</SCRIPT>
	
	
  </head>
  
  <body>
  <form action="" id="areaForm" method="post">
	  <input type="hidden" id="showinfoFlag" name="showinfoFlag" value="${showinfoFlag}"/>
	  <table border="0" width="100%" cellspacing="0" cellpadding="0">
		  <tr>
		    <td width="100%" height="27" bgcolor="#E3EBFE"><table border="0" width="100%"
		    cellspacing="0" cellpadding="0" height="27">
		        <tr>
		          <td width="3%"><img src="<%=request.getContextPath()%>/images/desktop/icon-main-001.gif" width="29" height="27"></td>
		          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
		                <tr>
							<td width="100%" class="f3">�������>>����չ�F</td>
		                </tr>
		            </table></td>
		          <td width="50%"></td>
		        </tr>
		      </table></td>
		  </tr>
	  </table>
	  	  <div id="saDiv">
	  	  <div id="serarchDiv">
	  	  
	  	  <input type="button" value="������������" onclick="myDis.open()" />    
          <input type="button" value="�رղ�������" onclick="myDis.close()" />
          <input type="button" value="�����乤�߶�����ʾ" onclick="onetrsport()" />
          <input type="button" value="���ȷ���������ʾ" onclick="oneScheme()" />
         <!--   <input type="button" value="���߽���" onclick="areaclose()" />  -->
		  <input id="txtSearch" name="txtSearch" type="text">
	  	  </div>
		  <div id="areaTreeDiv"  class="ztree"></div> 	
		  </div>	  
		  <div id="bMapDiv"></div> 
	</form>
  </body>
  <script type="text/javascript">	
		var map = new BMap.Map("bMapDiv");                        // ����Mapʵ��
		map.centerAndZoom("�й�", 6);     // ��ʼ����ͼ,�������ĵ�����͵�ͼ����
		map.addControl(new BMap.NavigationControl());               // ���ƽ�����ſؼ�
		map.addControl(new BMap.ScaleControl());                    // ��ӱ����߿ؼ�
		map.addControl(new BMap.OverviewMapControl());              //������Ե�ͼ�ؼ�
		map.enableScrollWheelZoom();                            //���ù��ַŴ���С
		//map.addControl(new BMap.MapTypeControl());          //��ӵ�ͼ���Ϳؼ�
		//map.setCurrentCity("����");          // ���õ�ͼ��ʾ�ĳ��� �����Ǳ������õ�
		
		
		var  mapStyle ={ 
        features: ["road","water"],//���ص�ͼ�ϵ�poi
        style : "light"  //���õ�ͼ���Ϊ�߶˺�
    }
map.setMapStyle(mapStyle);
		
		map.addEventListener("click", showInfo);
		
		//��������Ĺ���
		var myDis = new BMapLib.DistanceTool(map);
		
var e1,e2,j=0;
var p = [];           //�����洢���ߵĵ�
var points=[];     //���ڴ洢���������޸ĺ��ת�۴��Ĺؼ���
var axisx=[];     //���ڴ洢���������޸ĺ��ת�۴��Ĺؼ���ľ���
var axisy=[];     //���ڴ洢���������޸ĺ��ת�۴��Ĺؼ����γ��
var polyline;
var overlays = [];	


var overlaycomplete = function(e){
    overlays.push(e.overlay);
    //alert("j1��ֵ"+overlays.length+e.overlay);
    //alert("j2��ֵ"+overlays[overlays.length-1]+(overlays.length-1));
    overlays[overlays.length-1].enableEditing(); 
    points=overlays[overlays.length-1].getPath();
    //alert("j3��ֵ"+points.length);
          for(var j=0;j<points.length;j++)
          {
          axisx[j]=points[j].lng;
          axisy[j]=points[j].lat;
          }
          //alert("�����ϵĵ�"+axisx+"��������"+axisy);
         /*�����Ե�ʱ�򣬲鿴���ߵĵ��ǲ��ǿ��Ա���ʱ�õģ����ڳ�����Ҫ*/ 
		/*	$.ajax({
				type: "post",
				url: "savepolylinepoints?axisx="+axisx+"&axisy="+axisy+"&randomn="+Math.random(),
				cache: false,
		    	async: false,
		    	success: function(data){
		    		$("#points").html(data);
		    	}});   */
		    	//������ӱߵ�ʱ��addEdge.jsp�����ò���Ϊflag="4"
		    	opener.setValue(axisx,axisy,flag="4","","");
		    	window.close();
		        //points=[];	//����������������գ��Է����¼��һ�����ߵ����겢����
		    	//axisx=[];
		    	//axisy=[];       
    };
//�ߵ���ʽ
var styleOptions = {
        strokeColor:"red",    //������ɫ��
        fillColor:"red",      //�����ɫ��������Ϊ��ʱ��Բ�ν�û�����Ч����
        strokeWeight: 3,       //���ߵĿ�ȣ�������Ϊ��λ��
        strokeOpacity: 0.8,	   //����͸���ȣ�ȡֵ��Χ0 - 1��
        fillOpacity: 0.6,      //����͸���ȣ�ȡֵ��Χ0 - 1��
        strokeStyle: 'solid' //���ߵ���ʽ��solid��dashed��
    }
//ʵ���������ƹ���
    var myDrawingManagerObject = new BMapLib.DrawingManager(map, {
    isOpen: true, 
    drawingMode:BMAP_DRAWING_POLYLINE,
    enableDrawingTool: true,
    enableCalculate: false,
    drawingToolOptions: {
        anchor: BMAP_ANCHOR_TOP_RIGHT,//λ��
        offset: new BMap.Size(5, 5), //ƫ��ֵ
        scale: 0.8       //���������ű���
    },
    polylineOptions: styleOptions //�ߵ���ʽ
    });

   
    //��������ƹ��߼����¼������ڻ�ȡ���ƽ��
    myDrawingManagerObject.addEventListener('overlaycomplete', overlaycomplete);
    //myDrawingManagerObject.addEventListener('polylinecomplete', polylinecomplete);
</script>
</html>


