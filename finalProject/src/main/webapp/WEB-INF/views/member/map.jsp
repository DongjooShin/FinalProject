<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='/resources/bootstrap/bootstrap.min.css'
	type='text/css' rel="stylesheet" />
<link rel='stylesheet' href='/resources/bootstrap/mypage-bootstrap.css'
	type='text/css' rel="stylesheet" />
<script type="text/javascript"
	src="/resources/jquery/jQuery-2.1.4.min.js"></script>

</head>
<script type="text/javascript">
	$(function() {
		$("#selectState").change(function() {
			state = $("#selectState option:selected").text();
			var stateNum = $(this).val();
			$("#mapImage").attr({"src" : "/resources/images/dong/map" + stateNum + ".png"	});
			
			
			
			$.ajax({
				url : '/member/test',
				type : 'POST',
				data : {
					"state" : state
				},
				success : function(result) {
					var str = "";
					$(result).each(function() {

						str += "<option>" + this.addr_city + "</option>"
						$("#city").html(str);
					});

				},
				error : function(hxr, data, error) {
					alert('이메일 전송이 실패 하였습니다.');
				}
			});
		});

		$("#city").change(function() {
			var city = $(this).val();
			var state = $("#selectState option:selected").text();
			$.ajax({
				url : '/member/test1',
				type : 'POST',
				data : {
					"state" : state,
					"city" : city
				},
				success : function(result) {
					var str = "";
					$(result).each(function() {
						str += "<option>" + this.f_groupname + "</option>"
						$("#aptname").html(str);
					});

				},
				error : function(hxr, data, error) {
					alert('이메일 전송이 실패 하였습니다.');
				}
			});
		});

	});

	function fncRegnCd(strRegnCd) {
			var state = $('#'+strRegnCd).attr("title");
		var stateNum = $('#'+strRegnCd).attr("alt");
		$("#mapImage").attr({	"src" : "/resources/images/dong/map" + stateNum + ".png"	});
		
		$("#selectState").val(stateNum).attr("selected", "selected");
		getCity(state);
	};

	function getCity(state) {

		$.ajax({
			url : '/member/test',
			type : 'POST',
			data : {
				"state" : state
			},
			success : function(result) {
				var str = "";
				$(result).each(function() {

					str += "<option>" + this.addr_city + "</option>"
					$("#city").html(str);
				});

			},
			error : function(hxr, data, error) {
				alert('이메일 전송이 실패 하였습니다.');
			}
		});

	}

	function selectApt() {
		opener.document.form.state.value = $("#selectState option:selected").text();
		opener.document.form.city.value = $("#city").val();
		opener.document.form.aptname.value = $("#aptname").val();
		location.href = "loginCheck.jsp";
		self.close();

	}
</script>
<body>

	<div style="background: white; padding: 0px; height: 400px;">
		<h3 align="center" style="padding-top: 40px;">우리 아파트 찾기</h3>
		<div>
			<img id="mapImage" src="/resources/images/dong/map0.png"
				usemap="#interior" style="float: left;">
		</div>
		<div>
			<map name="interior" id="map">
				<area alt="16" href="#" id="Seoul" title="서울"
					coords="66,66,66,71,68,73,72,73,76,74,79,72,83,68,82,64,78,65,77,61,75,58,71,60,67,63"
					onclick="fncRegnCd('Seoul')" shape="poly">
				<area alt="3" href="#" id="Busan" title="부산"
					coords="171,181,164,187,162,188,160,190,157,190,155,192,155,194,156,195,157,196,157,198,159,197,161,197,163,197,164,197,166,196,168,194,170,193,171,190,173,189,174,187,174,185,174,183,172,182,170,180"
					onclick="fncRegnCd('Busan');" shape="poly">
				<area alt="15" href="#" id="Incheon" title="인천"
					coords="55,63,57,69,57,73,55,76,58,77,62,75,64,69,63,65,59,63,56,61"
					onclick="fncRegnCd('Incheon');" shape="poly">
				<area alt="5" href="#" id="Daegu" title="대구"
					coords="136,152,134,155,136,156,138,157,139,157,139,159,138,161,138,161,136,163,135,165,135,168,135,169,136,170,138,170,138,169,141,167,142,164,145,164,147,163,148,161,148,159,149,156,150,154,150,152,150,150,148,149,144,149,141,150,140,151,137,153,135,153"
					onclick="fncRegnCd('Daegu');" shape="poly">
				<area alt="7" href="#" id="Gwangju" title="광주"
					coords="58,194,57,194,57,196,58,197,59,198,60,199,61,200,62,201,63,200,65,199,66,199,68,199,69,199,70,199,71,198,72,197,72,196,71,194,70,193,69,193,67,193,65,193,67,194,63,192,64,192,60,190,58,190"
					onclick="fncRegnCd('Gwangju');" shape="poly">
				<area alt="10" href="#" id="Daejeon" title="대전"
					coords="90,125,87,128,86,130,85,132,85,134,85,135,86,136,87,136,88,135,89,136,90,136,91,137,92,137,93,136,94,135,95,134,96,133,96,132,96,130,95,129,93,127,92,126,90,125,89,124"
					onclick="fncRegnCd('Daejeon');" shape="poly">
				<area alt="2" href="#" id="Ulsan" title="울산"
					coords="163,169,162,172,163,173,164,173,166,173,167,175,168,176,168,177,169,177,171,178,172,179,174,180,175,181,176,181,178,180,179,179,179,177,181,175,182,174,182,173,182,171,182,169,182,168,180,168,177,168,174,168,171,168,170,169,167,169,166,168,164,167,162,167"
					onclick="fncRegnCd('Ulsan');" shape="poly">
				<area alt="13" href="#" id="Gangwon" title="강원"
					coords="78,26,81,30,84,30,88,33,91,37,93,38,95,39,96,40,100,43,101,44,102,46,103,48,101,50,100,52,99,55,101,57,103,59,105,60,107,62,108,65,109,67,110,69,110,70,110,72,109,77,109,80,108,83,109,86,111,86,114,86,118,84,120,83,121,83,124,83,129,85,129,85,130,86,138,89,141,90,146,91,148,91,153,89,154,89,163,89,164,89,167,89,170,89,171,88,174,87,174,86,170,76,163,60,157,53,145,37,140,27,137,18,134,8,130,11,127,17,124,20,124,21,119,24,110,24,103,23,92,23,90,23,81,23,80,23"
					onclick="fncRegnCd('Gangwon');" shape="poly">
				<area alt="14" href="#" id="Gyeonggi" title="경기"
					coords="49,50,47,54,45,57,48,60,53,61,56,59,60,60,63,64,65,64,67,60,73,56,76,56,79,60,82,63,85,67,81,72,76,76,63,73,60,78,51,77,49,79,52,83,59,87,62,92,65,98,70,99,77,98,83,98,85,99,87,99,90,97,94,94,95,91,100,89,104,86,106,84,107,76,108,73,106,66,101,59,98,57,97,53,99,49,100,47,97,43,90,38,89,37,85,33,80,30,78,27,71,29,68,30,66,32,66,34,68,35,69,36,69,37,68,39,67,40,62,43,60,44,60,45,63,47,63,48,61,50,60,52,58,53,57,54,55,53,52,52,50,51,47,50"
					onclick="fncRegnCd('Gyeonggi');" shape="poly">
				<area alt="4" href="#" id="Gyeongnam" title="경남"
					coords="111,157,108,160,107,162,106,164,105,166,104,167,104,169,104,170,104,172,104,174,104,176,105,177,105,177,106,180,106,181,106,182,106,183,106,184,105,185,104,186,103,187,103,188,101,189,101,189,101,190,101,191,101,192,101,193,102,194,102,196,103,197,104,199,105,201,105,202,107,204,108,205,110,205,112,204,115,203,116,201,118,201,120,202,121,204,122,206,123,207,125,207,127,207,129,207,130,208,132,208,133,208,134,206,134,203,136,201,137,199,139,197,142,196,144,197,146,198,146,198,146,196,146,195,146,193,147,192,149,193,152,194,154,197,153,193,152,191,154,189,156,189,158,188,160,187,163,185,166,183,168,181,168,180,166,177,164,175,161,175,160,175,161,172,161,170,157,168,155,169,152,171,148,172,142,172,138,172,132,172,127,172,123,169,122,166,121,164,119,162,116,160,112,157"
					onclick="fncRegnCd('Gyeongnam');" shape="poly">
				<area alt="6" href="#" id="Gyeongbuk" title="경북"
					coords="174,90,170,91,167,91,164,91,161,91,158,91,155,91,153,91,152,91,150,91,149,92,147,93,143,95,141,97,139,97,138,99,137,100,138,102,137,103,135,105,132,105,128,105,127,104,124,104,121,105,119,107,117,108,115,111,113,113,112,116,112,119,112,122,112,126,113,129,113,131,114,134,117,137,120,138,120,140,119,142,118,145,116,146,115,148,113,151,113,154,114,156,115,157,117,158,120,159,123,161,124,164,125,166,126,168,127,168,133,170,132,169,134,167,132,164,132,163,135,160,137,159,134,157,132,156,130,156,130,154,134,152,138,149,139,150,143,148,145,148,147,147,151,147,150,149,153,151,152,156,150,157,150,159,150,163,148,164,146,166,144,166,143,166,141,168,141,170,145,169,150,168,156,166,163,168,165,165,170,167,173,165,176,167,182,166,181,163,183,163,183,153,186,148,186,143,182,147,179,147,177,144,178,131,179,125,179,114,175,89"
					onclick="fncRegnCd('Gyeongbuk');" shape="poly">
				<area alt="8" href="#" id="Jeonnam" title="전남"
					coords="58,185,59,188,61,188,63,189,66,190,69,191,73,192,73,193,74,195,75,199,73,201,71,202,67,202,63,203,60,202,57,200,55,198,54,196,54,193,55,192,55,189,54,187,52,186,49,184,48,183,46,185,44,189,43,191,45,193,46,197,46,198,46,200,46,202,45,205,44,207,44,208,44,209,44,210,44,212,44,213,44,217,44,218,42,219,41,222,42,224,44,227,46,229,49,230,49,232,50,235,51,239,54,239,57,236,59,233,60,230,63,226,65,228,65,231,67,233,68,233,71,228,72,225,77,221,84,217,86,218,87,220,86,223,83,223,81,226,79,229,83,230,85,230,86,231,86,232,87,232,89,231,89,229,90,227,93,226,93,225,91,222,90,217,92,214,94,213,97,212,99,214,100,217,100,219,99,221,102,218,103,217,105,216,105,212,104,212,100,210,101,208,105,206,106,205,102,202,100,197,99,191,97,188,93,186,89,187,86,188,83,188,79,186,76,185,74,183,72,181,69,179,65,179,62,181,57,184"
					onclick="fncRegnCd('Jeonnam');" shape="poly">
				<area alt="9" href="#" id="Jeonbuk" title="전북"
					coords="101,147,98,150,96,151,94,151,90,151,89,151,86,149,84,147,82,146,80,146,78,145,74,144,73,144,71,144,69,146,68,147,64,150,60,150,58,151,55,151,54,152,56,154,57,156,58,157,59,157,60,158,61,158,61,159,60,161,59,162,58,163,57,163,56,164,55,165,54,167,53,168,51,170,52,171,54,172,55,172,56,174,55,175,55,176,52,177,51,178,49,179,49,181,51,183,54,183,56,183,59,182,60,180,62,177,65,177,68,177,72,177,74,179,77,181,80,184,83,185,87,186,90,185,92,183,95,184,96,185,99,185,100,185,102,183,103,181,103,179,101,177,101,172,101,169,103,164,106,160,108,157,111,155,111,152,111,149,103,147,101,146"
					onclick="fncRegnCd('Jeonbuk');" shape="poly">
				<area alt="12" href="#" id="Chungnam" title="충남"
					coords="83,100,78,100,75,100,72,101,68,101,66,100,64,99,62,98,60,97,55,94,54,92,50,91,48,92,45,94,45,96,45,98,47,98,47,100,46,101,45,103,43,103,40,104,37,105,34,106,32,108,34,110,37,111,38,111,41,112,44,113,46,114,49,115,49,116,50,119,51,124,51,125,52,128,53,130,53,131,54,136,54,139,55,141,57,143,57,146,57,149,59,149,62,148,64,146,68,144,70,142,72,141,75,142,76,143,78,143,81,143,82,143,84,145,86,146,88,147,91,149,94,149,97,148,99,146,99,145,98,142,98,140,96,137,95,139,91,139,89,138,84,138,83,136,82,134,82,130,82,129,84,127,85,126,88,124,88,122,87,120,85,116,86,112,87,109,87,105,84,102,83,100"
					onclick="fncRegnCd('Chungnam');" shape="poly">
				<area alt="11" href="#" id="Chungbuk" title="충북"
					coords="86,101,89,105,91,108,88,112,88,114,90,119,91,122,92,123,96,126,99,127,100,131,100,133,97,136,101,138,103,143,103,145,106,147,110,147,115,146,116,143,118,141,116,139,113,135,112,132,111,130,111,123,111,121,111,117,111,114,113,110,117,106,122,104,126,102,129,101,132,103,134,103,135,103,136,101,136,98,138,96,140,95,142,94,143,93,138,91,134,89,128,86,124,85,120,85,112,88,107,87"
					onclick="fncRegnCd('Chungbuk');" shape="poly">
				<area alt="1" href="#" id="Jeju" title="제주"
					coords="65,256,69,250,76,246,86,244,95,244,100,249,98,258,88,261,75,264,67,263"
					onclick="fncRegnCd('Jeju');" shape="poly">
			</map>
		</div>
		<br>

		<div style="margin-top: 40px">
			<form action="map" name="chooseState" method="post">
				<select name="selectState" id="selectState" style="width: 120px">
					<option id="select1" selected="selected">선택</option>
					<option value="13">강원</option>
					<option value="14">경기</option>
					<option value="4">경남</option>
					<option value="6">경북</option>
					<option value="7">광주</option>
					<option value="5">대구</option>
					<option value="10">대전</option>
					<option value="3">부산</option>
					<option value="16">서울</option>
					<option value="0">세종</option>
					<option value="2">울산</option>
					<option value="15">인천</option>
					<option value="9">전남</option>
					<option value="8">전북</option>
					<option value="1">제주</option>
					<option value="12">충남</option>
					<option value="11">충북</option>
				</select> <select name="city" style="width: 120px" id="city" >
					<option id="select2">선택</option>
				</select> <select name="aptname" style="width: 120px" id="aptname">
					<option id="APTName" selected="selected">아파트선택</option>
				</select> <input type="button" value="확인" onclick="selectApt()">
			</form>
		</div>
	</div>
</body>
</html>

