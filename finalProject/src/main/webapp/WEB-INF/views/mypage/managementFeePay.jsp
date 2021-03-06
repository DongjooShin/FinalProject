<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>관리비</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <link rel='stylesheet' href='/resources/bootstrap/bootstrap.min.css' type='text/css' rel="stylesheet" /> -->
<script type="text/javascript"
	src="/resources/js/kyungtae/bootstrap.min.js"></script>
<script type="text/javascript"
	src="/resources/js/kyungtae/jQuery-2.1.4.min.js"></script>
<style type="text/css">
#Table_01 {
	background-image: url('/resources/images/kyungtae/managementFee.png');
	font-family: 돋움;
	font-size: 10px;
	text-align: center;
}

#buttonArea {
	text-align: center;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#closer").on('click', function() {
			window.close();
		})
		$('#mntPay').on('click',function(){
			window.location.href="/managementFee/paySequence1";
		});
	})
</script>
</html>
</head>

<body>
	<div class="row">
		<div class="col-lg-12">
			<table id="Table_01" width="659" height="622" border="0"
				cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="19"><img
						src="/resources/images/kyungtae/blank.png" width="657" height="8"
						alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="8" alt=""></td>
				</tr>
				<tr>
					<td rowspan="44"><img
						src="/resources/images/kyungtae/blank.png" width="48" height="613"
						alt=""></td>
					<td>
						<!-- 연 -->
						<div width="52" height="19" alt="">${fn:substring(monthMntFee.mf_date,0,4) }</div>
					</td>
					<td rowspan="44"><img
						src="/resources/images/kyungtae/blank.png" width="21" height="613"
						alt=""></td>
					<td colspan="2">
						<!-- 월 -->
						<div width="44" height="19" alt="">${fn:substring(monthMntFee.mf_date,5,7) }</div>
					</td>
					<td colspan="14" rowspan="2"><img
						src="/resources/images/kyungtae/blank.png" width="492" height="45"
						alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="19" alt=""></td>
				</tr>
				<tr>
					<td rowspan="43"><img
						src="/resources/images/kyungtae/blank.png" width="52" height="594"
						alt=""></td>
					<td colspan="2"><img
						src="/resources/images/kyungtae/blank.png" width="44" height="26"
						alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="26" alt=""></td>
				</tr>
				<tr>
					<td rowspan="42"><img
						src="/resources/images/kyungtae/blank.png" width="20" height="568"
						alt=""></td>
					<td colspan="2">
						<div width="69" height="16" alt="">298239</div>
					</td>
					<td colspan="13" rowspan="9"><img
						src="/resources/images/kyungtae/blank.png" width="447"
						height="138" alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="16" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<!--할인총계  -->
						<div width="69" height="14" alt="">0</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="14" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<div width="69" height="14" alt="">0</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="14" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<div width="69" height="15" alt="">0</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="15" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<div width="69" height="15" alt="">298239</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="15" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<div width="69" height="15" alt="">1.05%</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="15" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<div width="69" height="14" alt="">301200</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="14" alt=""></td>
				</tr>
				<tr>
					<td colspan="2"><img
						src="/resources/images/kyungtae/blank.png" width="69" height="21"
						alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="21" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<!-- 일반관리비 -->
						<div width="69" height="14" alt="">${monthPublicFee.pm_general }</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="14" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<!-- 청소비 -->
						<div width="69" height="13" alt="">${monthPublicFee.pm_clean }</div>
					</td>
					<td colspan="4" rowspan="12"><img
						src="/resources/images/kyungtae/blank.png" width="193"
						height="123" alt=""></td>
					<td colspan="6" rowspan="3">
						<div width="162" height="31" alt="">31</div>
					</td>
					<td colspan="3" rowspan="25"><img
						src="/resources/images/kyungtae/blank.png" width="92" height="334"
						alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="13" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<!-- 소독비 -->
						<div width="69" height="13" alt="">${monthPublicFee.pm_disinfection }</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="13" alt=""></td>
				</tr>
				<tr>
					<td colspan="2" rowspan="3">
						<!-- 승강기유지비 -->
						<div width="69" height="14" alt="">${monthPublicFee.pm_liftMaintain }</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="5" alt=""></td>
				</tr>
				<tr>
					<td colspan="6"><img
						src="/resources/images/kyungtae/blank.png" width="162" height="6"
						alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="6" alt=""></td>
				</tr>
				<tr>
					<td colspan="2" rowspan="3">
						<div width="81" height="24" alt="">702호</div>
					</td>
					<td colspan="4" rowspan="3">
						<div width="81" height="24" alt="">101호</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="3" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<!-- 수선유지비 -->
						<div width="69" height="14" alt="">${monthPublicFee.pm_maintain }
						</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="14" alt=""></td>
				</tr>
				<tr>
					<td colspan="2" rowspan="2">
						<div width="69" height="13" alt="">8474</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="7" alt=""></td>
				</tr>
				<tr>
					<td colspan="6" rowspan="5"><img
						src="/resources/images/kyungtae/blank.png" width="162" height="62"
						alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="6" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<!-- 경비용역비 -->
						<div width="69" height="13" alt="">${monthPublicFee.pm_security }</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="13" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<div width="69" height="15" alt="">3939</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="15" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<div width="69" height="13" alt="">3249</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="13" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<!-- 대표회의운영비 -->
						<div width="69" height="15" alt="">${monthPublicFee.pm_meeting }</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="15" alt=""></td>
				</tr>
				<tr>
					<td colspan="3"><img
						src="/resources/images/kyungtae/blank.png" width="99" height="39"
						alt=""></td>
					<td colspan="7" rowspan="9">
						<div width="285" height="160" alt="">내용
					</td>
					<td colspan="2" rowspan="13"><img
						src="/resources/images/kyungtae/blank.png" width="40" height="211"
						alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="39" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<!-- 세대 전기료 -->
						<div width="69" height="14" alt="">${monthMntFee.mf_electricFee }</div>
					</td>
					<td rowspan="20">
						<div width="30" height="268" alt=""></div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="14" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<!-- 공동전기료 -->
						<div width="69" height="13" alt="">${monthPublicFee.pm_publicElectric }</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="13" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<!-- 승강기전기료 -->
						<div width="69" height="14" alt="">${monthPublicFee.pm_liftElectric }</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="14" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<div width="69" height="13" alt="">${monthPublicFee.pm_TVFee }</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="13" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<div width="69" height="14" alt="">2344</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="14" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<!-- 세대 수도료 -->
						<div width="69" height="12" alt="">${monthMntFee.mf_waterFee }
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="12" alt=""></td>
				</tr>
				<tr>
					<td colspan="2"><img
						src="/resources/images/kyungtae/blank.png" width="69" height="29"
						alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="29" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<!-- 세대 난방비 -->
						<div width="69" height="12" alt="">${monthMntFee.mf_gasFee }</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="12" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<div width="69" height="14" alt="">1353</div>
					</td>
					<td colspan="7" rowspan="4"><img
						src="/resources/images/kyungtae/blank.png" width="285" height="51"
						alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="14" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<div width="69" height="14" alt=""></div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="14" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<div width="69" height="13" alt="">8944</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="13" alt=""></td>
				</tr>
				<tr>
					<td colspan="2" rowspan="2">
						<div width="69" height="14" alt="">4429</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="10" alt=""></td>
				</tr>
				<tr>
					<td rowspan="8"><img
						src="/resources/images/kyungtae/blank.png" width="60" height="96"
						alt=""></td>
					<td rowspan="2">
						<div width="64" height="18" alt="">40</div>
					</td>
					<td colspan="2" rowspan="2">
						<div width="61" height="18" alt="">${monthMntFee.mf_electricAmount }</div>
					</td>
					<td colspan="2" rowspan="2">
						<div width="69" height="18" alt="">42</div>
					</td>
					<td colspan="2" rowspan="2">
						<div width="47" height="18" alt="">201602</div>
					</td>
					<td colspan="2" rowspan="2">
						<div width="60" height="18" alt="">232912</div>
					</td>
					<td rowspan="2">
						<div width="48" height="18" alt=""></div>
					</td>
					<td rowspan="8"><img
						src="/resources/images/kyungtae/blank.png" width="8" height="96"
						alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="4" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<div width="69" height="14" alt="">5631</div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="14" alt=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<div width="69" height="13" alt="">5000</div>
					</td>
					<td rowspan="2">
						<div width="64" height="17" alt="">46</div>
					</td>
					<td colspan="2" rowspan="2">
						<div width="61" height="17" alt="">47</div>
					</td>
					<td colspan="2" rowspan="2">
						<div width="69" height="17" alt="">48</div>
					</td>
					<td colspan="2" rowspan="2">
						<div width="47" height="17" alt="">201603</div>
					</td>
					<td colspan="2" rowspan="2">
						<div width="60" height="17" alt="">203599</div>
					</td>
					<td rowspan="2">
						<div width="48" height="17" alt=""></div>
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="13" alt=""></td>
				</tr>
				<tr>
					<td colspan="2" rowspan="5"><img
						src="/resources/images/kyungtae/blank.png" width="69" height="65"
						alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="4" alt=""></td>
				</tr>
				<tr>
					<td>
						<div width="64" height="17" alt="">52</div>
					</td>
					<td colspan="2">
						<div width="61" height="17" alt="">${monthMntFee.mf_waterAmount }</div>
					</td>
					<td colspan="2">
						<div width="69" height="17" alt="">54</div>
					</td>
					<td colspan="2">
						<div width="47" height="17" alt="">201604</div>
					</td>
					<td colspan="2">
						<div width="60" height="17" alt="">590708</div>
					</td>
					<td>
						<div width="48" height="17" alt=""></div>
					</td>
					<td>
						<div width="1" height="17" alt=""></div>
					</td>
				</tr>
				<tr>
					<td>
						<div width="64" height="19" alt="">
					</td>
					<td colspan="2">
						<div width="61" height="19" alt="">${monthMntFee.mf_gasAmount }
					</td>
					<td colspan="2">
						<div width="69" height="19" alt="">
					</td>
					<td colspan="2">
						<div width="47" height="19" alt="">201605
					</td>
					<td colspan="2">
						<div width="60" height="19" alt="">245053
					</td>
					<td>
						<div width="48" height="19" alt="">
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="19" alt=""></td>
				</tr>
				<tr>
					<td colspan="5" rowspan="2"><img
						src="/resources/images/kyungtae/blank.png" width="194" height="25"
						alt=""></td>
					<td colspan="2">
						<div width="47" height="16" alt="">${monthMntFee.mf_date }
					</td>
					<td colspan="2">
						<div width="60" height="16" alt="">229563
					</td>
					<td>
						<div width="48" height="16" alt="">
					</td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="16" alt=""></td>
				</tr>
				<tr>
					<td colspan="5"><img
						src="/resources/images/kyungtae/blank.png" width="155" height="9"
						alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="1"
						height="9" alt=""></td>
				</tr>
				<tr>
					<td><img src="/resources/images/kyungtae/blank.png" width="48"
						height="1" alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="52"
						height="1" alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="21"
						height="1" alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="20"
						height="1" alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="24"
						height="1" alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="45"
						height="1" alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="30"
						height="1" alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="60"
						height="1" alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="64"
						height="1" alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="39"
						height="1" alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="22"
						height="1" alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="59"
						height="1" alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="10"
						height="1" alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="31"
						height="1" alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="16"
						height="1" alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="24"
						height="1" alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="36"
						height="1" alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="48"
						height="1" alt=""></td>
					<td><img src="/resources/images/kyungtae/blank.png" width="8"
						height="1" alt=""></td>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
	<div id="buttonArea">
		<input type="button" id="mntPay" value="결제하기" />&nbsp;<input type="button" id="closer" value="닫기" />
	</div>
	<!-- End Save for Web Slices -->
</body>

<!-- End Save for Web Slices -->
</body>
</html>

