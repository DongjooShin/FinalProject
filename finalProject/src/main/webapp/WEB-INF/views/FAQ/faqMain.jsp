<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/resources/FAQ_CSSnJS/style.css">

<title>Frequently Asked Questions</title>

<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/bootstrap/bootstrap.min.css' type='text/css' media='all' />
<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/dist/css/mainFont.css' type='text/css' media='all' />
<link rel='stylesheet' id='google_fonts-css'
	href='//fonts.googleapis.com/css?family=Lato&#038;ver=e7d1598c32c9180e5e08e97723f82bcd'
	type='text/css' media='all' />
<link rel='stylesheet' id='spacious_style-css' href='/resources/dist/css/main1.css'
	type='text/css' media='all' />

<script src="/resources/FAQ_CSSnJS/modernizr.js"></script>
</head>
<body style="background-color: #eaeaea;">


<%-- -----------------Header include----------------- --%>	
	<div class="header">
		 <jsp:include page="../include/head.jsp"></jsp:include> 
	</div>
	
<%-- ------------------------------Body------------------------------------------- --%>	
	
	<div class="main" id="page">
		<div class="container">
			<div class="col-md-3">
				<jsp:include page="../siteNotice/CustomerSidebar.jsp"></jsp:include>
				<br><br>
				<div style="margin-left: 40px;">
				
					<ul class="cd-faq-categories" style="transform: translateY(0px);">
							<h2 style="padding-top: 10px;">Nav</h2>
							<li><a class="selected" href="#faq_site_using">사이트이용</a></li>
							<li><a href="#faq_member">회원</a></li>
							<li><a href="#faq_management_fee">관리비</a></li>
							<li><a href="#faq_community">커뮤니티</a></li>
							<li><a href="#faq_property">부동산</a></li>
					</ul>
				</div>
			</div>
			
			<!-- 리스트,입력,상세보기 -->
			<div class="col-md-8" style="margin-top: 50px; margin-left:50px;">
				
				<h1 id="mainTitle">Frequently Asked Questions</h1>
				<section class="cd-faq">
					
					<div class="cd-faq-items">
						<ul id="faq_site_using" class="cd-faq-group">
							<li class="cd-faq-title"><h2>사이트 이용</h2></li>
							<li class="content-visible">
								<a class="cd-faq-trigger" href="#0">APT Manager란?</a>
								<div class="cd-faq-content" style="display: block;">
									<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;본 서비스는 전국 아파트 단지의 관리소와 연계되어 입주민께서 해당 아파트의 동/호를 입력하여 
										가입하시면 편리하게 관리비를 조회하고 납부할 수 있는 서비스입니다.<br><br>
										본인의 단지 내 관리비 통계 뿐만 아니라 타 단지에 대한 관리비도 지역별로 확인하실 수 있으며
										아파트내 예·결산, 일정 등을 조회할 수 있으며, 단지 내 선거, 중고거래, 주변 시설 조회 등을 이용하실 수
										 있습니다.
									</p>
								</div>
							</li>
						</ul>
							
						<ul id="faq_member" class="cd-faq-group">
							<li class="cd-faq-title"><h2>회원</h2></li>
							<li>
								<a class="cd-faq-trigger" href="#0">단지 가입 문의는?</a>
								<div class="cd-faq-content">
									<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;본 사이트 메뉴의 [고객센터] > [가입문의] 에서 확인해 주십시오. </p>
								</div>
							</li>
							<li>
								<a class="cd-faq-trigger" href="#0">입주민의 사이트 가입?</a>
								<div class="cd-faq-content">
									<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가입시 단지를 검색하여, 동/호수를 기재하여야 
										또한 관리소에서 단지 가입을 하지 않은 경우, 즉 사이트 내에 단지가
										존재하지 않는 회원에 대해서는 사이트 가입이 불가능하도록 되어 있으므로, 이 경우에 가입을 원하시는 회원께서는
										해당 단지 관리소에 문의하여 단지 가입을 먼저 이루어 주시기 바랍니다.</p>
								</div>
							</li>
							<li>
								<a class="cd-faq-trigger" href="#0">ID와 비밀번호를 잊은 경우?</a>
								<div class="cd-faq-content">
									<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그인 페이지 하단의 ID, 비밀번호 찾기를 이용하시면 간단하게 ID와 비밀번호를 찾을 수 있습니다.</p>
								</div>
							</li>
							<li>
								<a class="cd-faq-trigger" href="#0">회원정보 변경?</a>
								<div class="cd-faq-content">
									<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그인 후 [마이페이지]>[개인정보 수정] 에서 변경하실 수 있습니다.<br></p>
								</div>
							</li>
							<li>
								<a class="cd-faq-trigger" href="#0">ID입력시 비밀번호가 자동 입력?</a>
								<div class="cd-faq-content">
									<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자동입력을 원하지 않으신다면 아래 방법에 따라 해보시길 바랍니다.<br><br>
										·브라우져 상단에 있는 [도구]메뉴를 클릭하신후 [인터넷 옵션] 선택<br>·새 창에서 상단 탭메뉴에서 [내용]을 클릭하신후 하단에 위치한 [자동완성] 버튼을 클릭하여 선택<br>
										·자동완성 사용대상에서 [웹주소]를 제외한 모든 항목의 체크를 해제<br>·그런 다음 [폼지우기],[암호지우기]버튼을 클릭<br>
										·하단에 [확인] 버튼을 클릭하셔서 창을 닫으시고 또 한번 하단에 [확인] 버튼을 클릭하셔서 창을 닫음<br>·브라우저를 모두 닫고 다시 실행<br>
										·비밀번호를 저장하겠느냐는 메시지창이 뜬다면 아니오를 선택
									</p>
								</div>
							</li>
							<li>
								<a class="cd-faq-trigger" href="#0">이메일로 임시비밀번호가 오지 않는 경우?</a>
								<div class="cd-faq-content">
									<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;당사에서 이메일 발송은 되었으나, 수신받는 메일측 서버에서 받아들이지 못하거나 스팸메일함으로 연결되는 경우가 많습니다.<br>
										이에 스팸메일함을 확인해주시기 바라며, 스팸메일함에도 발송된 메일이 없을 경우 1544-9999 로 문의주시기 바랍니다.  
									</p>
								</div>
							</li>
						</ul>
						<ul id="faq_management_fee" class="cd-faq-group">
							<li class="cd-faq-title"><h2>관리비</h2></li>
							<li>
								<a class="cd-faq-trigger" href="#0">관리비 조회가 되지 않는 경우?</a>
								<div class="cd-faq-content">
									<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관리비는 거주하시는 아파트 관리사무소에서 직접 부과하는 방식으로, 관리소에서 부과 작업을 마감하면 그 때부터 사이트 내
										조회가 가능하며 관리소의 업무처리에 따라 시일이 달라질 수 있습니다. 관리사무소를 통해 자료를 올리도록 요청해 주시길 바랍니다.
									</p>
								</div>
							</li>
							<li>
								<a class="cd-faq-trigger" href="#0">관리비 부분 납부?</a>
								<div class="cd-faq-content">
									<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;미납액이 존재할 경우, 최근 납입월에 합산하여 결제하도록 되어 있으며  부분 납부는 불가합니다.</p>
								</div>
							</li>
							<li>
								<a class="cd-faq-trigger" href="#0">관리비 납부 영수증 및 세금 계산서 발행?</a>
								<div class="cd-faq-content">
									<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아파트 관리비는 공과금으로, 소득공제 대상이 아니며 따라서 현금영수증 발급 제외 대상입니다. 또한 본 사이트는 결제대행업체이므로
										해당 관리비를 영수하지 않기 때문에 일반적인 영수증, 세금계산서 등은 발급하고 있지 않습니다.
									</p>
								</div>
							</li>
							<li>
								<a class="cd-faq-trigger" href="#0">종이고지서와 내역이 다르다면?</a>
								<div class="cd-faq-content">
									<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;본 사이트의 관리비 데이터는 귀하의 단지에서 매월 종이고지서를 발행하기 위해 전산업체에 등록하는 데이터와 연동되어 표기하고 있습니다. 
										이에 그 항목 및 금액의 타당성을 판단할 수는 없으나, 원칙은 '종이고지서'이기에 종이고지서에 표기된 금액대로 처리하는 것이 올바르며
										이 경우 관리소에 문의하시는 것을 권유드립니다.
									</p>
								</div>
							</li>
							<li>
								<a class="cd-faq-trigger" href="#0">지난 관리비 조회?</a>
								<div class="cd-faq-content">
									<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;단지의 가입일 이후 청구된 관리비에 대해서만 조회가 가능하며, 단지 관리소에서 업무적 문제로 과거 월에 관리비 데이터가 존재하지 않는 경우
										조회가 불가능할 수 있습니다.
									</p>
								</div>
							</li>
							<li>
								<a class="cd-faq-trigger" href="#0">관리비 납부수단 및 납부가능일?</a>
								<div class="cd-faq-content">
									<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;본 사이트의 관리비 납부 방법으로는  <br>[실시간 계좌이체 및 무통장 입금], [신용카드 결제], [카카오페이], [휴대폰 결제] 가 있습니다.   
										<br>당사에서 관리비를 직접부과하고 수납받는 것이 아닌 단지 납부대행 서비스이기 때문에 여러모로 제한되는 사항들이 있습니다. 따라서 납부방법별 납부기간을 꼭 숙지해주시기 바랍니다.
									</p><br>
									<table id="pay_means">
										<thead><tr><td>납부수단</td><td>납부수수료</td><td>납부가능일(영업일기준)</td><td>납부불가</td></tr></thead>
										<tbody>
											<tr><td>실시간 계좌이체 <br>및 무통장 입금</td><td>400원</td><td>·납기내 : 마감일 기준 2일전<br>·납기후 : 마감일 기준 4일후</td><td>·납부마감일 당일 및 전일<br>·평일 23:00~00:30<br>(서비스 점검 시간)<br>·토요일,일요일,공휴일</td></tr>
											<tr><td>신용카드 결제</td><td>카드별상이</td><td>·납기내 : 마감일 기준 2일전<br>·납기후 : 마감일 기준 4일후</td><td>·카드사별 서비스점검시간</td></tr>
											<tr><td>카카오페이</td><td>카드별상이</td><td>·납기내 : 마감일 기준 2일전<br>·납기후 : 마감일 기준 4일후</td><td>·카드사별 서비스점검시간</td></tr>
											<tr><td>휴대폰 결제</td><td>400원</td><td>·납기내 : 마감일 기준 2일전<br>·납기후 : 마감일 기준 7일후</td><td>·통신사별 서비스점검시간</td></tr>
										</tbody>
									</table><br>
									<p>※ '영업일'이라함은 주말/공휴일을 제외한 평일만을 의마합니다. 이점 꼭 참고바랍니다.※</p>
									<p>※ 납기 마감일이 지난 이후에는 연체료가 발생할 수 있으므로 기한 내 납기 부탁드립니다.※</p>
							
								</div>
							</li>
						</ul>
						<ul id="faq_community" class="cd-faq-group">
							<li class="cd-faq-title"><h2>커뮤니티</h2></li>
							<li>
								<a class="cd-faq-trigger" href="#0">자신의 게시물은?</a>
								<div class="cd-faq-content">
									<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 게시물을 올린 위치에서 검색하여 관리하거나, 마이페이지에서 관리할 수 있습니다.
									</p>
								</div>
							</li>
						</ul>
						<ul id="faq_property" class="cd-faq-group">
							<li class="cd-faq-title"><h2>부동산</h2></li>
							<li>
								<a class="cd-faq-trigger" href="#0">아파트 실거래가 조회?</a>
								<div class="cd-faq-content">
									<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사이트 관리자가 매달 업데이트하므로, 한달 간격으로 거래된 실거래가를 확인할 수 있습니다. 메뉴의 [부동산]>[아파트시세]에서 확인가능합니다.
									</p>
								</div>
							</li>
							<li>
								<a class="cd-faq-trigger" href="#0">아파트 매물 등록 및 조회?</a>
								<div class="cd-faq-content" >
									<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 메뉴의 [부동산] 에서 자신의 아파트 매물을 직접 등록하거나, 타인의 매물을 조회할 수 있으나 사이트 내에서 온라인상 거래는 불가능합니다. 쪽지 기능이나 기재된 연락처를 통해 연락하여 오프라인상 부동산 거래를  이용하시기 바랍니다.
										매물 거래상 발생한 불이익에 관해서 본 사이트는 어떠한 책임도 지지 않음을 유념하여 주시기 바랍니다.
									</p>
								</div>
							</li>
						</ul>
						
					</div>	<%-- END OF ITEMS --%>
				
				
				
				</section>
			</div>
		</div>
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>

<%-- ----------------------Footer include----------------- --%>
	<div class = "footer">
	
					
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>

<script src="/resources/FAQ_CSSnJS/jquery-2.1.1.js"></script>
<script src="/resources/FAQ_CSSnJS/jquery.mobile.custom.min.js"></script>
<script src="/resources/FAQ_CSSnJS/main.js"></script>

</body>
</html>