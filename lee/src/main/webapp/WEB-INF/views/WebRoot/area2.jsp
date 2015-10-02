<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
body, html{width: 100%;height: 100%;overflow: hidden;margin:0;}
#allmap {margin-right: 300px;height: 100%;overflow: hidden;}
#result {border-left:1px dotted #999;height:100%;width:295px;position:absolute;top:0px;right:0px;font-size:12px;}
dl,dt,dd,ul,li{
    margin:0;
    padding:0;
    list-style:none;
}
p{font-size:12px;}
dt{
    font-size:14px;
    font-family:"΢���ź�";
    font-weight:bold;
    border-bottom:1px dotted #000;
    padding:5px 0 5px 5px;
    margin:5px 0;
}
dd{
    padding:5px 0 0 5px;
}
li{
    line-height:28px;
}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=4fa4bb8fca02bdcbe06bb07be3a75fcc"></script>
<!--���������ƹ���-->
<script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
<link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" />
<!--���ؼ�����Ϣ����-->
<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.js"></script>
<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.css" />

<title>�����ƹ���</title>
</head>
<body>
<div id="allmap" style="overflow:hidden;zoom:1;position:relative;">	
    <div id="map" style="height:100%;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;"></div>
    <div id="showPanelBtn" style="position:absolute;font-size:14px;top:50%;margin-top:-95px;right:0px;width:20px;padding:10px 10px;color:#999;cursor:pointer;text-align:center;height:170px;background:rgba(255,255,255,0.9);-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;font-family:'΢���ź�';font-weight:bold;">��ʾ����������<br/>&lt;</div>
    <div id="panelWrap" style="width:0px;position:absolute;top:0px;right:0px;height:100%;overflow:auto;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;">
        <div style="width:20px;height:200px;margin:-100px 0 0 -10px;color:#999;position:absolute;opacity:0.5;top:50%;left:50%;" id="showOverlayInfo">�˴�����չʾ��������Ϣ</div>
        <div id="panel" style="position:absolute;"></div>
    </div>
</div>

<div id="result">
    <dl>
    	<dt>���ƹ��߹���</dt>
            <ul>
                <li><label><input type="radio" name="openClose1" onclick="drawingManager.open()"/>��</label>  <label><input type="radio" name="openClose1" onclick="drawingManager.close()" checked="checked"/>�ر�</label></li>
            </ul>
        </dd>
    	<dt>�Ƿ�����߻�����ļ���(��λ��)</dt>
            <ul>
                <li><label><input type="radio" name="openClose" onclick="drawingManager.enableCalculate()"/>��</label>  <label><input type="radio" name="openClose" onclick="drawingManager.disableCalculate()"  checked="checked"/>�ر�</label></li>
            </ul>
        </dd>
    	<dt>���ƹ���</dt>
        <dd>
            <ul>
                <li>
                    <label><input type="radio" name="drawmode" onclick="drawingManager.setDrawingMode(BMAP_DRAWING_MARKER)" checked="checked"/>����</label>
                    <input type="checkbox" id="isInfowindow"/> �Ƿ����Ϣ����
                </li>
                <li>
                    <label><input type="radio" name="drawmode" onclick="drawingManager.setDrawingMode(BMAP_DRAWING_CIRCLE)"/>��Բ</label>
                </li>
                <li>
                    <label><input type="radio" name="drawmode" onclick="drawingManager.setDrawingMode(BMAP_DRAWING_POLYLINE)"/>����</label>
                </li>
                <li>
                    <label><input type="radio" name="drawmode" onclick="drawingManager.setDrawingMode(BMAP_DRAWING_POLYGON)"/>�������</label>
                </li>
                <li>
                    <label><input type="radio" name="drawmode" onclick="drawingManager.setDrawingMode(BMAP_DRAWING_RECTANGLE)"/>������</label>
                </li>
            </ul>
        </dd>
    	<dt>���������</dt>
        <dd>
            <ul>
                <li>
                    <input type="button" value="��ȡ���Ƶĸ��������" onclick="alert(overlays.length)"/>
                    <input type="button" value="������и�����" onclick="clearAll()"/>
                    <input type="button" value="��ȡ���һ����������Ϣ" id="getLastOverLay"/>
                </li>
            </ul>
        </dd>
    </dl>

</div>

<script type="text/javascript">

// �ٶȵ�ͼAPI����
    var map = new BMap.Map('map');
    var poi = new BMap.Point(116.307852,40.057031);
    map.centerAndZoom(poi, 16);
    map.enableScrollWheelZoom();

    $("getLastOverLay").onclick = function(){
        if(overlays.length){
            alert(overlays[overlays.length - 1]);
        }else{
            alert("û�и�����");
        }
    }

    //��Ϣ���ڵ����ݶ���
    var content = '<div style="margin:0;line-height:20px;padding:2px;">' +
                    '��ַ�������к������ϵ�ʮ��10��<br/>�绰��(010)59928888<br/>��飺�ٶȴ���λ�ڱ����к��������������վ������Ϊ�ٶȹ�˾�ۺ��з����칫�ܲ���' +
                  '</div>';
    
    //��������Ϣ���ڵ�poi��
    var searchInfoWindow = new BMapLib.SearchInfoWindow(map, content, {
        title  : "�ٶȴ���",      //����
        width  : 290,             //���
        height : 105,              //�߶�
        panel  : "panel",         //����������
        enableAutoPan : true,     //�Զ�ƽ��
        searchTypes   :[
            BMAPLIB_TAB_SEARCH,   //�ܱ߼���
            BMAPLIB_TAB_TO_HERE,  //������ȥ
            BMAPLIB_TAB_FROM_HERE //���������
        ]
    });    
    
    var overlays = [];
    //�ص���ø�������Ϣ
    var overlaycomplete = function(e){
        overlays.push(e.overlay);
        var result = "";
        result = "<p>";
        result += e.drawingMode + ":";
        if (e.drawingMode == BMAP_DRAWING_MARKER) {
            result += ' ���꣺' + e.overlay.getPosition().lng + ',' + e.overlay.getPosition().lat;
            if ($('isInfowindow').checked) {
                searchInfoWindow.open(e.overlay);
            }
        }
        if (e.drawingMode == BMAP_DRAWING_CIRCLE) {
            result += ' �뾶��' + e.overlay.getRadius();
            result += ' ���ĵ㣺' + e.overlay.getCenter().lng + "," + e.overlay.getCenter().lat;
        }
        if (e.drawingMode == BMAP_DRAWING_POLYLINE || e.drawingMode == BMAP_DRAWING_POLYGON || e.drawingMode == BMAP_DRAWING_RECTANGLE) {
            result += ' �����ĵ������' + e.overlay.getPath().length;
        }
        result += "</p>";
        $("showOverlayInfo").style.display = "none";
        $("panel").innerHTML += result; //�����Ƶĸ�������Ϣ��������������
    };

    var styleOptions = {
        strokeColor:"red",    //������ɫ��
        fillColor:"red",      //�����ɫ��������Ϊ��ʱ��Բ�ν�û�����Ч����
        strokeWeight: 3,       //���ߵĿ�ȣ�������Ϊ��λ��
        strokeOpacity: 0.8,	   //����͸���ȣ�ȡֵ��Χ0 - 1��
        fillOpacity: 0.6,      //����͸���ȣ�ȡֵ��Χ0 - 1��
        strokeStyle: 'solid' //���ߵ���ʽ��solid��dashed��
    }
    //ʵ���������ƹ���
    var drawingManager = new BMapLib.DrawingManager(map, {
        isOpen: false, //�Ƿ�������ģʽ
        enableDrawingTool: true, //�Ƿ���ʾ������
        drawingToolOptions: {
            anchor: BMAP_ANCHOR_TOP_RIGHT, //λ��
            offset: new BMap.Size(5, 5), //ƫ��ֵ
            scale: 0.8 //���������ű���
        },
        circleOptions: styleOptions, //Բ����ʽ
        polylineOptions: styleOptions, //�ߵ���ʽ
        polygonOptions: styleOptions, //����ε���ʽ
        rectangleOptions: styleOptions //���ε���ʽ
    });

    
    //��������ƹ��߼����¼������ڻ�ȡ���ƽ��
    drawingManager.addEventListener('overlaycomplete', overlaycomplete);
    

    function $(id){
        return document.getElementById(id);
    }

    function clearAll() {
        for(var i = 0; i < overlays.length; i++){
            map.removeOverlay(overlays[i]);
        }
        overlays.length = 0
    }

    var isPanelShow = false;
    //��ʾ�����嶯��
    $("showPanelBtn").onclick = showPanel;
    function showPanel(){
        if (isPanelShow == false) {
            isPanelShow = true;
            $("showPanelBtn").style.right = "230px";
            $("panelWrap").style.width = "230px";
            $("map").style.marginRight = "230px";
            $("showPanelBtn").innerHTML = "���ػ��ƽ����Ϣ<br/>>";
        } else {
            isPanelShow = false;
            $("showPanelBtn").style.right = "0px";
            $("panelWrap").style.width = "0px";
            $("map").style.marginRight = "0px";
            $("showPanelBtn").innerHTML = "��ʾ���ƽ����Ϣ<br/><";
        }
    }

</script>

</body>
</html>
