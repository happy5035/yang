<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
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
		 
		#bMapDiv{ float:right; width:86%; height:800px;} 
	</style>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/DistanceTool/1.2/src/DistanceTool_min.js"></script>
<script type="text/javascript" charset="gbk"  src="http://api.map.baidu.com/library/MarkerTool/1.2/src/MarkerTool_min.js" ></script>  
  </head>
  
  <body>
  <form action="" id="areaForm" method="post">
	  <input type="hidden" id="showinfoFlag" name="showinfoFlag" value="${showinfoFlag}"/>
	  <table border="0" width="100%" cellspacing="0" cellpadding="0">
		  <tr>
		    <td width="100%" height="27" bgcolor="#E3EBFE">
		    <table border="0" width="100%" cellspacing="0" cellpadding="0" height="27">
		        <tr>
		          <td width="3%"><img src="<%=request.getContextPath()%>/picture/truck.png" width="29" height="27"></td>
		          <td width="47%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
		                <tr>
							<td width="100%" class="f3">��ͼ>>�㡢��·</td>
		                </tr>
		            </table></td>
		          <td width="50%"></td>
		        </tr>
		      </table></td>
		  </tr>
	  </table>	  
		  <div id="bMapDiv"></div> 
		  <input type="button" value="��ʼ" onclick="run();" />
		  <input type="button" value="����" onclick="myDis.open()" />    
          <input type="button" value="�ر�" onclick="myDis.close()" />   
	</form>
  </body>
  <script type="text/javascript">	
       //��ͼ����
		var map = new BMap.Map("bMapDiv");                        // ����Mapʵ��		
		map.centerAndZoom("�й�", 6);     // ��ʼ����ͼ,�������ĵ�����͵�ͼ����
		//var opts = {type: BMAP_NAVIGATION_CONTROL_SMALL};   //�ı�ؼ�����
		//map.addControl(new BMap.NavigationControl(opts));               // ���ƽ�����ſؼ�    ����
		map.addControl(new BMap.NavigationControl());               // ���ƽ�����ſؼ�    ����
		map.addControl(new BMap.ScaleControl());                    // ��ӱ����߿ؼ�     ����
		map.addControl(new BMap.OverviewMapControl());              //������Ե�ͼ�ؼ�    ����
		map.enableScrollWheelZoom();                            //���ù��ַŴ���С
		//map.addControl(new BMap.MapTypeControl());          //��ӵ�ͼ���Ϳؼ�       ����
		//map.setCurrentCity("����");          // ���õ�ͼ��ʾ�ĳ��� �����Ǳ������õ�
		
		var myDis = new BMapLib.DistanceTool(map);
		
//��ע
var myP3 = new BMap.Point(108.424374,23.914668); //��ע��
var marker = new BMap.Marker(myP3); 
//�Զ�����ʾ�ı�ע��ͼƬ
//var myIcons = new BMap.Icon("picture/save.png", new BMap.Size(32, 70), { //С��ͼƬ
 //offset: new BMap.Size(0, -5), //�൱��CSS����
// imageOffset: new BMap.Size(0, 0) //ͼƬ��ƫ������Ϊ����ͼƬ�ײ����Ķ�׼����㡣
// }); 
//var marker = new BMap.Marker(myP3, {icon: myIcons});  
map.addOverlay(marker);     //����ע����ӵ���ͼ��
marker.addEventListener("click", function(){     //�����¼�  
 alert("������˱�ע");   
}); 

marker.enableDragging();    
marker.addEventListener("dragend", function(e){    
 alert("��ǰλ�ã�" + e.point.lng + ", " + e.point.lat);    
}); 

//��Ϣ����
var opts = {    
 width : 250,     // ��Ϣ���ڿ��    
 height: 100,     // ��Ϣ���ڸ߶�    
 title : "Hello"  // ��Ϣ���ڱ���   
}    
var infoWindow = new BMap.InfoWindow("World123", opts);  // ������Ϣ���ڶ���    
map.openInfoWindow(infoWindow, myP3);      // ����Ϣ���� 


//����
/*var polyline = new BMap.Polyline([    
   new BMap.Point(116.399, 39.910),    
   new BMap.Point(106.405, 38.920)    
 ],    
 {strokeColor:"red", strokeWeight:6, strokeOpacity:0.5}    
);    
map.addOverlay(polyline);*/

/*�Զ��帲����
// �����Զ��帲����Ĺ��캯��  
function SquareOverlay(center, length, color){    
 this._center = center;    
 this._length = length;    
 this._color = color;    
}    
// �̳�API��BMap.Overlay    
SquareOverlay.prototype = new BMap.Overlay(); 

// ʵ�ֳ�ʼ������  
SquareOverlay.prototype.initialize = function(map){    
// ����map����ʵ��   
 this._map = map;        
 // ����divԪ�أ���Ϊ�Զ��帲���������   
 var div = document.createElement("div");    
 div.style.position = "absolute";        
 // ���Ը��ݲ�������Ԫ�����   
 div.style.width = this._length + "px";    
 div.style.height = this._length + "px";    
 div.style.background = this._color;      
// ��div��ӵ�������������   
 map.getPanes().markerPane.appendChild(div);      
// ����divʵ��   
 this._div = div;      
// ��Ҫ��divԪ����Ϊ�����ķ���ֵ�������øø������show��   
// hide���������߶Ը���������Ƴ�ʱ��API����������Ԫ�ء�   
 return div;    
}  

// ʵ�ֻ��Ʒ���   
SquareOverlay.prototype.draw = function(){    
// ���ݵ�������ת��Ϊ�������꣬�����ø�����    
 var position = this._map.pointToOverlayPixel(this._center);    
 this._div.style.left = position.x - this._length / 2 + "px";    
 this._div.style.top = position.y - this._length / 2 + "px";    
}  

// ʵ����ʾ����    
SquareOverlay.prototype.show = function(){    
 if (this._div){    
   this._div.style.display = "";    
 }    
}      
// ʵ�����ط���  
SquareOverlay.prototype.hide = function(){    
 if (this._div){    
   this._div.style.display = "none";    
 }    
}  

var mySquare = new SquareOverlay(myP3, 100, "red");    
map.addOverlay(mySquare);  

//�����Ǹ���ͼ��Ӽ����� 
map.addEventListener("click", function(e){   
  alert("������˵�ͼ2��"+e.point.lng + ", " + e.point.lat);     
});   */    
 
 
 //�ڵ�ͼ���ֻ����ߣ�ֻ�ܻ���һ��
/*var points = []; 
map.addEventListener("click", function (e) {

alert("��ǰλ��1��" + e.point.lng + ", " + e.point.lat);
map.clearOverlays();
points.push(new BMap.Point(e.point.lng, e.point.lat));
map.addOverlay(new BMap.Polyline(points));
alert("��ǰλ��2��" + points.length);
}); */

 //�ڵ�ͼ���ֻ����ߣ�ֻ�ܻ���һ�Σ���������һ����Ч��
var e1,e2,j=0;
var p = [];           //�����洢���ߵĵ�
var polyline;
var doneDraw = 0;     //�ж��Ƿ�������߽���
  
function addMarker(point, index){
var marker = new BMap.Marker(point);
map.addOverlay(marker);     //����ע����ӵ���ͼ��
}

map.addEventListener("click",function(e1){        //����굥��ʱ  
  if(doneDraw == 0){                              //�ж��Ƿ�����������    
    p.push(new BMap.Point(e1.point.lng,e1.point.lat))   //�洢������ÿ����ľ�γ��     
    if(polyline){polyline.setPath(p,{strokeColor:"blue", strokeWeight:2, strokeOpacity:1});}                //������ߴ��ڣ����ȡ�����ϵĵ�    
    else{polyline = new BMap.Polyline(p,{strokeColor:"red", strokeWeight:2, strokeOpacity:1});}              //������߲����ڣ������Ӵ˵�    
    if(p.length<2){return ;}                            //�������ϵĵ�ֻ��һ��ʱ��������    
    map.addOverlay(polyline);                           //��������  
  }
});
map.addEventListener("dblclick",function(e2){     //�����˫��ʱ���������ƣ������Ա༭����  
  // ����Զ���ؼ�����ͼ����
  alert("j��ֵ"+p.length);
  doneDraw = 10;  
  polyline.enableEditing();
  for(var k=0;k<p.length;k++){
     addMarker(p[k], k); 
        alert("waypoint["+k+"]=new BMap.Point("+p[k].lng + "," +p[k].lat+")<br/>");
      }  
});
      
/*var myPushpin = new BMap.PushpinTool(map);          // ������ע����ʵ��
myPushpin.addEventListener("markend", function(e){  // �����¼�����ʾ��ע��������Ϣ
  alert("����ע��λ�ã�" +    
       e.marker.getPoint().lng + ", "+    
       e.marker.getPoint().lat);   
});   
myPushpin.open();*/ 


var myP1 = new BMap.Point(110.380967,39.913285); //���
var myP2 = new BMap.Point(116.424374,25.914668); //�յ�    
var myIcon = new BMap.Icon("picture/save.png", new BMap.Size(32, 70), { //С��ͼƬ
 //offset: new BMap.Size(0, -5), //�൱��CSS����
 imageOffset: new BMap.Size(0, 0) //ͼƬ��ƫ������Ϊ����ͼƬ�ײ����Ķ�׼����㡣
 });
var driving2 = new BMap.DrivingRoute(map, {renderOptions:{map: map, autoViewport: true}}); //�ݳ�ʵ��
driving2.search(myP1, myP2); //��ʾһ��������·


function run(){
 var driving = new BMap.DrivingRoute(map); //�ݳ�ʵ��
 driving.search(myP1, myP2);
 driving.setSearchCompleteCallback(function(){
 var pts = driving.getResults().getPlan(0).getRoute(0).getPath(); //ͨ���ݳ�ʵ�������һϵ�е������
 var paths = pts.length; //����м�����

 var carMk = new BMap.Marker(pts[0],{icon:myIcon});
 map.addOverlay(carMk);                     
 i=0;
 function resetMkPoint(i){
 carMk.setPosition(pts[i]);
 if(i < paths){
 setTimeout(function(){
 i++;
 resetMkPoint(i);
 },1);  //�޸������ֵ�����Ըı�С���������ٶ�
 }
 }
 setTimeout(function(){
 resetMkPoint(5);
 console.log(i);
 },100)

 });
}



</script>
</html>


