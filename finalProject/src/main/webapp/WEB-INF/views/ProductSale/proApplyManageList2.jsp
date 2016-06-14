
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">

  <script src="//code.jquery.com/jquery-1.10.2.js"></script>

  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

  <link rel="stylesheet" href="/resources/demos/style.css">
</head>

<body>
<script>

 function clickLayer(vals){

var urlX ="http://www.url.com/notice_view.php?seq="+vals

var widthX = 700;

var heightX = 500;

var titleX ="팝업창";

// jquery..dialog() 로그라는 플러그인을 이용해서 사용하는 방법입니다. 

$('#layerPop').load(urlX).dialog({

autoOpen: true,

modal:true,

width:widthX,

maxWidth:widthX,

maxHeight:heightX,

resizable:true,

title:titleX,

open: function() {

$(this).css({

'overflow-x':'hidden',

'overflow-y':'auto',

});

}

});

}

</script>


<div id="layerPop" style="display:none;">asdfsdf</div>

<button onclick="clickLayer(1);">클릭</button>
</body>
</html>