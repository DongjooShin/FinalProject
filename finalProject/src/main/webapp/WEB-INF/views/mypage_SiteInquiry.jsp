<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/resources/FAQ_CSSnJS/style.css">

<title>My Page - Site Inquiry</title>

<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/bootstrap/bootstrap.min.css' type='text/css'
	media='all' />
<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/dist/css/mainFont.css' type='text/css' media='all' />
<link rel='stylesheet' id='google_fonts-css'
	href='//fonts.googleapis.com/css?family=Lato&#038;ver=e7d1598c32c9180e5e08e97723f82bcd'
	type='text/css' media='all' />
<link rel='stylesheet' id='spacious_style-css'
	href='/resources/dist/css/main1.css' type='text/css' media='all' />

<script src="/resources/FAQ_CSSnJS/modernizr.js"></script>

<script type="text/javascript"
   src="/resources/jquery/jQuery-2.1.4.min.js"></script>

<script type="text/javascript">

	$(function() {


		$('#fourthManu').css('background', '#09b9e5');

	});

</script>
</head>
<body>
<div class="header">
      <jsp:include page="include/head.jsp"></jsp:include>
   </div>
   <div id="page"
      style="background: white; display: inline-block; ">
      <div class="col-md-12">
 
					<jsp:include page="include/mypagehead.jsp"></jsp:include>

				<div class="col-lg-10 col-lg-offset-1">
					<br> <br> <label
						style="font-size: 25px; color: black; border-bottom: 3px solid #eaeaea; padding: 0 15px 13px 15px; margin-bottom: 15px;">1:1문의</label>
					<br> <br>
	
			
				<section class="cd-faq" style="margin-top:30px;">
				
					<c:if test="${myqna != null }">	<!-- 1:1 inquiry exist -->
						<c:forEach var="my" items="${myqna}">	<!-- All inquiry print -->
								<span style="color: #408080;">${my.q_name }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${my.q_date }" pattern="yyyy-MM-dd"/><br>
								<div class="cd-faq-items">
									<ul id="" class="cd-faq-group">
										<li><a class="cd-faq-trigger" style="font-size: 15px;" href="#0">${my.q_title }</a>
											<div class="cd-faq-content">
												<p>${my.q_content }</p>
												<c:if test="${reply != null }">
													<c:forEach var="reply" items="${reply}">
														<br><br>
														<c:if test="${reply.q_ref == my.qnaNo }">
															<p style="padding-left: 20px;">	${reply.q_content }	<p>
														</c:if>
													</c:forEach>
												</c:if>
											</div>
										</li>
									</ul>
								</div>
								<hr>
						</c:forEach>
					</c:if>
				<%-- END OF ITEMS --%>
				</section>
		
</div></div></div>
	<script src="/resources/FAQ_CSSnJS/jquery-2.1.1.js"></script>
	<script src="/resources/FAQ_CSSnJS/jquery.mobile.custom.min.js"></script>
	<script src="/resources/FAQ_CSSnJS/main.js"></script>

<div class="footer">
		<jsp:include page="include/footer.jsp"></jsp:include>
	</div>
</body>
</html>