<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='/resources/bootstrap/bootstrap.min.css' type='text/css' rel="stylesheet" />
<link rel='stylesheet' href='/resources/dist/css/mainFont.css'
	type='text/css' rel="stylesheet" />
<link rel='stylesheet'
	href='//fonts.googleapis.com/css?family=Lato&#038;ver=e7d1598c32c9180e5e08e97723f82bcd'
	type='text/css' media='all' />
<link rel='stylesheet' href='/resources/dist/css/main1.css'
	type='text/css' rel="stylesheet" />
<script type='text/javascript' src='/resources/dist/js/main1.js'></script>
<script type='text/javascript' src='/resources/dist/js/main2.js'></script>
<script type='text/javascript' src='/resources/dist/js/main3.js'></script>
<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/dist/css/headerCss.css' type='text/css' media='all' />
</head>

<body>

	<div id="page" class="hfeed site">
		<header id="masthead" class="site-header clearfix">

		<div id="header-text-nav-container">
			<div class="inner-wrap">

				<div id="header-text-nav-wrap" class="clearfix">
					<div id="header-left-section">
						<div id="header-logo-image">
							<a href="/main" title="Spacious" rel="home"><img
								src="http://demo.themegrill.com/spacious/wp-content/uploads/sites/2/2014/03/spacious-logo.png"
								alt="Spacious"></a>
						</div>
						<!-- #header-logo-image -->
						<div id="header-text" class="">
                     <h1 id="site-title">
                        <a href="/main" title="Spacious" rel="home">KOPART</a>
                     </h1>
                     <p id="site-description">KOSTA Apart Management System</p>
                     <!-- #site-description -->
                  </div>
						<!-- #header-text -->
					</div>
					<!-- #header-left-section -->
					<div id="header-right-section">
						<div id="header-right-sidebar" class="clearfix">
							<ul class="sub-menu1 ">
								<c:if test="${loginOn !=1 }">
									<li><a href="/member/login">로그인</a></li>
									<li><a href="/member/loginCheck">회원가입</a></li>
								</c:if>

								<c:if test="${loginOn ==1 }">
									<li><a href="/member/logout">로그아웃</a></li>
									<li><a href="/member/changeMemberInfo">내정보수정</a></li>
								</c:if>

								<li><a href="main.jsp?body=login.jsp">설문지 보기</a></li>
							</ul>

							<div id="search-3" class="widget widget_search"
								style="width: 200px">
								<form action="http://demo.themegrill.com/spacious/"
									class="search-form searchform clearfix" method="get">
									<div class="search-wrap">
										<input type="text" placeholder="Search" class="s field"
											name="s" id="head-serch">
										<button class="search-icon" type="submit"></button>
									</div>
								</form>
							</div>
						</div>
						<nav id="site-navigation" class="main-navigation"
							role="navigation">
						<h3 class="menu-toggle">Menu</h3>
						<div class="menu-primary-container">
							<ul id="menu-primary" class="menu">


								<li id="menu-item-52"
									class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-7 current_page_item menu-item-9"><a
									href="/calendar/calendar">커뮤니티</a>
									<ul class="sub-menu">
										<li id="menu-item-109"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-109"><a
											href="/calendar/calendar">스케줄</a></li>
										<li id="menu-item-108"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-108"><a
											href="/Property/aptRealTransaction?page=0">아파트시세</a></li>
											
										<li id="menu-item-106"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-106"><a
											href='/store/listStore'>상가정보</a></li>
											<li id="menu-item-106"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-106"><a
											href='/facility/facilityMap'>주변시설정보</a></li>
										<li id="menu-item-106"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-106"><a
											href="/voter/groupPresiMain">투표</a></li>
										<li id="menu-item-107"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-107"><a
											href="/ProductSale/proApplicationList">중고거래</a></li>


										<li id="menu-item-108"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-107"><a
											href="/Survey/surveyResult">설문조사</a></li>

										<li id="menu-item-109"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-107"><a
											href='/groupNotice/listAll'>공지사항</a></li>

									</ul></li>



								<li id="menu-item-9"
									class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-254"><a
									href="/managementFee/managementFeeList">관리비</a>
									<ul class="sub-menu">
										<li id="menu-item-109"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-109"><a
											href="/managementFee/managementFeeList">전체관리비</a></li>
										<li id="menu-item-109"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-109"><a
											href="/publicmana/appropia">예산</a></li>
										<li id="menu-item-107"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-107"><a
											href="/publicmana/PublicManageFee">공통관리비</a></li>
									</ul></li>
									
								<li id="menu-item-111"
									class="menu-item menu-item-type-custom menu-item-object-custom menu-item-165"><a
									target="_blank" href="/Property/aptNews?newsNum=0&page=0">부동산</a>
									<ul class="sub-menu">
										<li id="menu-item-255"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-255"><a
											href="/Property/aptNews?newsNum=0&page=0">부동산뉴스</a></li>
										<li id="menu-item-256"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-256"><a
											href="/Property/OtheraptRealTransaction">아파트시세</a></li>
										
										<li id="menu-item-107"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-107"><a
											href="/Property/aptSale">아파트매물등록</a></li>

										<li id="menu-item-107"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-107"><a
											href="/Property/aptSaleList">아파트매물보기</a></li>
									</ul></li>

								<li id="menu-item-254"
									class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-254"><a
									href="/siteNotice/faqMain">고객센터</a>
									<ul class="sub-menu">
										<li id="menu-item-106"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-109"><a
											href="/siteNotice/faqMain">FAQ</a></li>
										<li id="menu-item-107"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-108"><a
											href="/siteNotice/inquiryMain">1:1문의</a></li>
										<li id="menu-item-108"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-106"><a
											href="/siteNotice/siteNoticeAllList">공지사항</a></li>
										<li id="menu-item-109"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-106"><a
											href="/siteNotice/joinInquiry">가입문의</a></li>
									</ul></li>
								<li id="menu-item-105"
									class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-105"><a
									href="/mypage">마이페이지</a>
							</li>


							</ul>
						</div>
						</nav>
					</div>
					<!-- #header-right-section -->

				</div>
				<!-- #header-text-nav-wrap -->
			</div>
			<!-- .inner-wrap -->
		</div>


		</header>
	</div>

	<style>
.rpwe-block ul {
	list-style: none !important;
	margin-left: 0 !important;
	padding-left: 0 !important;
}

.rpwe-block li {
	border-bottom: 1px solid #eee;
	margin-bottom: 10px;
	padding-bottom: 10px;
	list-style-type: none;
}

.rpwe-block a {
	display: inline !important;
	text-decoration: none;
}

.rpwe-block h3 {
	background: none !important;
	clear: none;
	margin-bottom: 0 !important;
	margin-top: 0 !important;
	font-weight: 400;
	font-size: 12px !important;
	line-height: 1.5em;
}

.rpwe-thumb {
	border: 1px solid #EEE !important;
	box-shadow: none !important;
	margin: 2px 10px 2px 0;
	padding: 3px !important;
}

.rpwe-summary {
	font-size: 12px;
}

.rpwe-time {
	color: #bbb;
	font-size: 11px;
}

.rpwe-comment {
	color: #bbb;
	font-size: 11px;
	padding-left: 5px;
}

.rpwe-alignleft {
	display: inline;
	float: left;
}

.rpwe-alignright {
	display: inline;
	float: right;
}

.rpwe-aligncenter {
	display: block;
	margin-left: auto;
	margin-right: auto;
}

.rpwe-clearfix:before, .rpwe-clearfix:after {
	content: "";
	display: table !important;
}

.rpwe-clearfix:after {
	clear: both;
}

.rpwe-clearfix {
	zoom: 1;
}
</style>



</body>
</html>