<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/resources/jquery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() {

		$("#${cssPage }").attr('class', 'active');
		$("#selectApt")
				.click(
						function() {
							var state = $("#selectState").val();
							var city = $("#city").val();
							var gugu = $("#gugu").val();

							$ .ajax({
										url : '/Property/getOtherApt',
										type : 'POST',
										data : {
											"state" : state,
											"city" : city,
											"gugu" : gugu
										},
										success : function(result) {
											$("#myAptTable").empty();
											$("#paging").empty();
											var html = "";
											html += '<tr height="30">';
											html += '<th width="400">시군구</th>';
											html += '<th width="130">번지</th>';
											html += '<th width="180">단지명</th>';
											html += '<th width="120">전용면적</th>';
											html += '<th width="100">계약일</th>';
											html += '<th width="100">거래금액(만원)</th>';
											html += '<th width="70">층</th>';
											html += '<th width="100">건축년도</th>';
											html += '<th width="130">도로명</th>';
											html += '</tr>';

											
											
											$(result).each(function() {
												 html += '<tr>';
												 html += '<td align="center">'+this.address +'</td>';
												 html += '<td align="center">'+this.addressNum +'</td>';
												 html += '<td align="center">'+this.aptName +'</td>';
												 html += '<td align="center">'+this.area +'(㎡)</td>';
												 html += '<td align="center">'+this.contract +'</td>';
												 html += '<td align="center">'+this.aptPrice +'</td>';
												 html += '<td align="center">'+this.floor +'</td>';
											     html += '<td align="center">'+this.builtYear +'</td>';
												 html += '<td align="center">'+this.addressName +'</td>';
												 html += '</tr>';
															});
										
											$("#myAptTable").append(html);
										},
										error : function(hxr, data, error) {
											alert('이메일 전송이 실패 하였습니다.');
										}
									});

						});

		$("#selectState").change(function() {
			state = $("#selectState option:selected").text();

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

	});
</script>
</head>
<body>
	<div class="header">

		<jsp:include page="../include/head.jsp"></jsp:include>

	</div>

	<div id="page" class="hfeed site"
		style="border-top: 2px solid; display: inline-block;">
		<div class="col-md-12">
			<div class="col-md-3">
				<jsp:include page="aptSideBar.jsp"></jsp:include>
			</div>
			<div class="col-md-9">
				
				<label
						style="font-size: 25px; color: black; border-bottom: 3px solid #eaeaea; padding: 0 15px 13px 15px; margin-bottom: 15px; margin-top: 63px;">아파트 실거래가</label>
				<div style="margin-top: 40px;">
					<select name="selectState" id="selectState"
						style="width: 120px; height: 30px; margin-right: 10px;">
						<option id="select1" selected="selected">선택</option>
						<option value="강원도">강원</option>
						<option value="경기도">경기</option>
						<option value="경상남도">경남</option>
						<option value="경상북도">경북</option>
						<option value="광주광역시">광주</option>
						<option value="대구광역시">대구</option>
						<option value="대전광역시">대전</option>
						<option value="부산광역시">부산</option>
						<option value="서울특별시">서울</option>
						<option value="세종특별자치시">세종</option>
						<option value="울산광역시">울산</option>
						<option value="인천광역시">인천</option>
						<option value="전라남도">전남</option>
						<option value="전라북도">전북</option>
						<option value="제주특별자치도">제주</option>
						<option value="충청남도">충남</option>
						<option value="충청북도">충북</option>
					</select> <select name="city"
						style="width: 120px; height: 30px; margin-right: 10px;" id="city">
						<option id="select2">선택</option>
					</select> <input type="text"
						style="width: 200px; height: 30px; padding: 0; margin-right: 10px;"
						name="gugu" id="gugu"> <input type="button" value="확인"
						id="selectApt">

				</div>
				<br>
				<div style="min-height: 282px;">
					<table class="table table-striped">
						<tbody id="myAptTable">
							<tr height="30">
								<th width="400">시군구</th>
								<th width="130">번지</th>
								<th width="180">단지명</th>
								<th width="120">전용면적</th>
								<th width="100">계약일</th>
								<th width="100">거래금액(만원)</th>
								<th width="70">층</th>
								<th width="100">건축년도</th>
								<th width="130">도로명</th>

							</tr>
							<c:forEach var="temp" begin="${startPage }" end="${endPage }"
								step="1">
								<tr>
									<td align="center">${list.get(temp).address }</td>
									<td align="center">${list.get(temp).addressNum }</td>
									<td align="center">${list.get(temp).aptName }</td>
									<td align="center">${list.get(temp).area }(㎡)</td>
									<td align="center">${list.get(temp).contract }</td>
									<td align="center">${list.get(temp).aptPrice }</td>
									<td align="center">${list.get(temp).floor }</td>
									<td align="center">${list.get(temp).builtYear }</td>
									<td align="center">${list.get(temp).addressName }</td>

								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>
				<div style="text-align: center; margin-bottom: 100px;" id="paging">
					<ul class="pagination">
						<c:forEach var="page1" begin="${firstPageNum }"
							end="${totalPageNum }" step="1">
							<li id="${page1 }"><a
								href="/Property/aptRealTransaction?page=${page1-1 }">${page1 }</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>