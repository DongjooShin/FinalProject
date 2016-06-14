<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

.radius_border {
	border: 1px solid #919191;
	border-radius: 5px;
}

.custom_typecontrol {
	position: absolute;
	top: 10px;
	right: 10px;
	overflow: hidden;
	width: 130px;
	height: 30px;
	margin: 0;
	padding: 0;
	z-index: 1;
	font-size: 12px;
	font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
}

.custom_typecontrol span {
	display: block;
	width: 65px;
	height: 30px;
	float: left;
	text-align: center;
	line-height: 30px;
	cursor: pointer;
}

.custom_typecontrol .btn {
	background: #fff;
	background: linear-gradient(#fff, #e6e6e6);
}

.custom_typecontrol .btn:hover {
	background: #f5f5f5;
	background: linear-gradient(#f5f5f5, #e3e3e3);
}

.custom_typecontrol .btn:active {
	background: #e6e6e6;
	background: linear-gradient(#e6e6e6, #fff);
}

.custom_typecontrol .selected_btn {
	color: #fff;
	background: #425470;
	background: linear-gradient(#425470, #5b6d8a);
}

.custom_typecontrol .selected_btn:hover {
	color: #fff;
}

.custom_zoomcontrol {
	position: absolute;
	top: 50px;
	right: 10px;
	width: 36px;
	height: 80px;
	overflow: hidden;
	z-index: 1;
	background-color: #f5f5f5;
}

.custom_zoomcontrol span {
	display: block;
	width: 36px;
	height: 40px;
	text-align: center;
	cursor: pointer;
}

.custom_zoomcontrol span img {
	width: 15px;
	height: 15px;
	padding: 12px 0;
	border: none;
}

.custom_zoomcontrol span:first-child {
	border-bottom: 1px solid #bfbfbf;
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
	
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

#category {
	position: absolute;
	top: 10px;
	left: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px; px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background:
		/* url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) */
		url(/resources/images/syeon/apt.png)
		no-repeat;
}

#category li .bank {
	background: url(/resources/images/syeon/bank_apt.png);
}

#category li .mart {
	background: url(/resources/images/syeon/mart_apt.png);
}

#category li .pharmacy {
	background: url(/resources/images/syeon/medicine_apt.png);
}

#category li .hospital {
	background: url(/resources/images/syeon/hospital_apt.png);
}

#category li .publicOffice {
	background: url(/resources/images/syeon/gonggong_apt.png);
}

#category li .subway {
	background: url(/resources/images/syeon/subway_apt.png);
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;

}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #25b7d3;
	background: #25b7d3
		url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
	
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}
</style>

</head>
<body style="background-color: #eaeaea;">
	<div class="header">
		 <jsp:include page="../include/head.jsp"></jsp:include> 
	</div>
	<div class="main">
		<div class="container" id="page" style="height: 850px;">
			<div class="col-md-3" >
				<div id="secondary">
					<aside id="archives" class="widget">
					<h3 class="widget-title">Archives</h3>
					<ul>
						<li><a href='http://demo.themegrill.com/spacious/2014/03/'>March
								2014</a></li>
						<li><a href='http://demo.themegrill.com/spacious/2014/02/'>February
								2014</a></li>

						<li><a href='http://demo.themegrill.com/spacious/2014/03/'>March
								2014</a></li>
						<li><a href='http://demo.themegrill.com/spacious/2014/02/'>February
								2014</a></li>
						<li><a href='http://demo.themegrill.com/spacious/2014/03/'>March
								2014</a></li>
						<li><a href='http://demo.themegrill.com/spacious/2014/02/'>February
								2014</a></li>
					</ul>
					</aside>
				</div><!-- 
				<div id="primary" style="height: 1000px;"></div>
 -->
			</div>
			<div class="col-md-8  col-lg-offset-1" style="margin-top: 70px;">
			<div style="border-bottom:  3px  solid #eaeaea; width: 90%; ">
						<h2 style="padding-bottom: 6px;">아파트 주변 시설</h2>
			</div>
			<br>
				<div class="map_wrap" >
					<div id="map" style="width: 90%; height: 600px; position: relative; overflow: hidden; border: 3px solid #eaeaea;  	border-radius: 3px;"></div>
					
					
					<ul id="category">
						<li id="BK9" data-order="0"><span class="category_bg bank"></span>
							은행</li>
						<li id="MT1" data-order="1"><span class="category_bg mart"></span>
							마트</li>
						<li id="PM9" data-order="2"><span class="category_bg pharmacy"></span>
							약국</li>
						<li id="HP8" data-order="3"><span class="category_bg hospital"></span>
							병원</li>
						<li id="PO3" data-order="4"><span class="category_bg publicOffice"></span>
							공공기관</li>
						<li id="SW8" data-order="5"><span class="category_bg subway"></span>
							지하철</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=71a85629fc48e906b151821200dfd650&libraries=services,clusterer"></script>
	<script>
	$(function(){
		$.ajax({
			url : '/facilityInfo',
			type : 'post',
			dataType : 'json',
			success : function(json) {
				var latitude=json.f_latitude;
				var longitude=json.f_longitude;
				
				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~```
				var placeOverlay = new daum.maps.CustomOverlay({
					zIndex : 1
				}), contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
				markers = [], // 마커를 담을 배열입니다
				currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

				var container = document.getElementById('map');
				var options = {
					center : new daum.maps.LatLng(latitude,longitude),
					level : 5
				};
				var map = new daum.maps.Map(container, options);
				
				// 마커가 표시될 위치입니다 
				var markerPosition = new daum.maps.LatLng(latitude,longitude);

				// 마커를 생성합니다 
				var marker = new daum.maps.Marker({
					position : markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map); 

				//시험삼앙아아ㅏ아아아아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ
				var iwContent = '<div style="padding:5px;margin-left: 30px;">우리 아파트</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    			iwPosition = new daum.maps.LatLng(latitude,longitude); //인포윈도우 표시 위치입니다

				// 인포윈도우를 생성합니다
				var infowindow = new daum.maps.InfoWindow({
				    position : iwPosition, 
				    content : iwContent 
				});
				 
				// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
				infowindow.open(map, marker); 
				

				// 장소 검색 객체를 생성합니다
				var ps = new daum.maps.services.Places(map);

				// 지도에 idle 이벤트를 등록합니다
				daum.maps.event.addListener(map, 'idle', searchPlaces);

				// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
				contentNode.className = 'placeinfo_wrap';

				// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
				// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
				addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
				addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);

				// 커스텀 오버레이 컨텐츠를 설정합니다
				placeOverlay.setContent(contentNode);

				// 각 카테고리에 클릭 이벤트를 등록합니다
				addCategoryClickEvent();

				// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
				function addEventHandle(target, type, callback) {
					if (target.addEventListener) {
						target.addEventListener(type, callback);
					} else {
						target.attachEvent('on' + type, callback);
					}
				}

				// 카테고리 검색을 요청하는 함수입니다
				function searchPlaces() {
					if (!currCategory) {
						return;
					}

					// 커스텀 오버레이를 숨깁니다 
					placeOverlay.setMap(null);

					// 지도에 표시되고 있는 마커를 제거합니다
					removeMarker();

					ps.categorySearch(currCategory, placesSearchCB, {
						useMapBounds : true
					});
				}

				// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
				function placesSearchCB(status, data, pagination) {
					if (status === daum.maps.services.Status.OK) {

						// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
						displayPlaces(data.places);
					} else if (status === daum.maps.services.Status.ZERO_RESULT) {
						// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

					} else if (status === daum.maps.services.Status.ERROR) {
						// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요

					}
				}

				// 지도에 마커를 표출하는 함수입니다
				function displayPlaces(places) {

					// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
					// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
					var order = document.getElementById(currCategory).getAttribute(
							'data-order');

					for (var i = 0; i < places.length; i++) {

						// 마커를 생성하고 지도에 표시합니다
						var marker = addMarker(new daum.maps.LatLng(places[i].latitude,
								places[i].longitude), order);

						// 마커와 검색결과 항목을 클릭 했을 때
						// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
						(function(marker, place) {
							daum.maps.event.addListener(marker, 'click', function() {
								displayPlaceInfo(place);
							});
						})(marker, places[i]);
					}
				}

				// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
				function addMarker(position, order) {
					var imageSrc = '/resources/images/syeon/places_icon5.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
					imageSize = new daum.maps.Size(27, 28), // 마커 이미지의 크기
					imgOptions = {
						spriteSize : new daum.maps.Size(72, 208), // 스프라이트 이미지의 크기
						spriteOrigin : new daum.maps.Point(45, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
						offset : new daum.maps.Point(11, 28)
					// 마커 좌표에 일치시킬 이미지 내에서의 좌표
					}, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
							imgOptions), marker = new daum.maps.Marker({
						position : position, // 마커의 위치
						image : markerImage
					});

					marker.setMap(map); // 지도 위에 마커를 표출합니다
					markers.push(marker); // 배열에 생성된 마커를 추가합니다

					return marker;
				}

				// 지도 위에 표시되고 있는 마커를 모두 제거합니다
				function removeMarker() {
					for (var i = 0; i < markers.length; i++) {
						markers[i].setMap(null);
					}
					markers = [];
				}

				// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
				function displayPlaceInfo(place) {
					var content = '<div class="placeinfo">'
							+ '   <a class="title" href="' + place.placeUrl + '" target="_blank" title="' + place.title + '">'
							+ place.title + '</a>';

					if (place.newAddress) {
						content += '    <span title="' + place.newAddress + '">'
								+ place.newAddress
								+ '</span>'
								+ '  <span class="jibun" title="' + place.address + '">(지번 : '
								+ place.address + ')</span>';
					} else {
						content += '    <span title="' + place.address + '">'
								+ place.address + '</span>';
					}

					content += '    <span class="tel">' + place.phone + '</span>'
							+ '</div>' + '<div class="after"></div>';

					contentNode.innerHTML = content;
					placeOverlay.setPosition(new daum.maps.LatLng(place.latitude,
							place.longitude));
					placeOverlay.setMap(map);
				}

				// 각 카테고리에 클릭 이벤트를 등록합니다
				function addCategoryClickEvent() {
					
					var category = document.getElementById('category'), children = category.children;

					for (var i = 0; i < children.length; i++) {
						children[i].onclick = onClickCategory;
					}
				}

				// 카테고리를 클릭했을 때 호출되는 함수입니다
				function onClickCategory() {
					
					var id = this.id, className = this.className;

					placeOverlay.setMap(null);
					
					if (className === 'on') {
						currCategory = '';
						changeCategoryClass();
						removeMarker();
					} else {
						currCategory = id;
						changeCategoryClass(this);
						searchPlaces();
					}
				}

				// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
				function changeCategoryClass(el) {
					var category = document.getElementById('category'), children = category.children, i;

					for (i = 0; i < children.length; i++) {
						children[i].className = '';
					}

					if (el) {
						el.className = 'on';
					}
				}
				
			},
			error : function() {
				alert('ajax실패');
			}

		})
	});
	
		

		

	</script>

</body>
</html>