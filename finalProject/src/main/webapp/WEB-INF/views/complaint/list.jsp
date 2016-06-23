<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<style type="text/css">
#mypageUl {
	margin-top: -53px;
}

#mypageUl li {
	display: inline;
	float: left;
	position: relative;
	margin-right: 5px;
	padding: 10px;
	background-color: rgba(0, 0, 0, 0.3);
	padding: 15px 35px 15px 35px;
	border-radius: 3px;
	color: #fff;
	font-size: 21px;
}

#mypageLayout {
	border: 3px solid #eaeaea;
	border-top: 4px solid #09b9e5;
	display: inline-block;
	width: 100%;
	margin-top: 70px;
}

.content {
	display: none;
	margin-top: 15px;
}

#sixthContent {
	min-height: 500px;
}

.manu {
	color: white;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#thirdManu').css('background', '#09b9e5');

	});
</script>
<!-- Main content -->
<section class="contents">
	<div class="row">
		<!-- left column -->
		<div class="col-lg-12">

			<div class="col-lg-1"></div>
			<div class="col-lg-10" style="background-color: white;">
				<!-- general form elements -->
				<div class='box'>
					<div class="box-header with-border">
					<br> <br> <label
						style="font-size: 25px; color: black; border-bottom: 3px solid #eaeaea; padding: 0 15px 13px 15px; margin-bottom: 15px;">건의 / 불만 게시판</label>
					
					</div>


					<div class='box-body' class="row">
						<div class="col-md-3">
							<select name="searchType" class="form-control">
								<option value="n"
									<c:out value="${cri.searchType == null?'selected':''}"/>>
									---</option>
								<option value="t"
									<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
									제목</option>
								<option value="c"
									<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
									내용</option>
								<option value="w"
									<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
									글쓴이</option>
								<option value="tc"
									<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
									제목 OR 내용</option>
								<option value="cw"
									<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
									내용 OR 글쓴이</option>
								<option value="tcw"
									<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
									제목 OR 내용 OR 글쓴이</option>
							</select>
						</div>
						<div class="col-md-5">
							<c:choose>
								<c:when test="${cri.keyword ==null }">

									<input type="text" name='keyword' id="keywordInput"
										placeholder="검색어를 작성해 주세요">
								</c:when>
								<c:otherwise>
									<input type="text" name='keyword' id="keywordInput"
										value='${cri.keyword }'>
								</c:otherwise>
							</c:choose>
						</div>
						<div>
							<button id='searchBtn'>Search</button>
							<button id='newBtn'>New 글쓰기</button>
						</div>
					</div>
				</div>


				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">LIST PAGING</h3>
					</div>
					<div class="box-body">
						<table class="table table-bordered">
							<tr>
								<th>BNO</th>
								<th>TITLE</th>
								<th>WRITER</th>
								<th>date</th>
								<th>처리상태</th>
							</tr>

							<c:forEach items="${list}" var="Complaint">

								<tr>
									<td>${Complaint.cp_complaintNo}</td>
									<td><c:choose>
											<c:when test="${Complaint.cp_flag ==1}">
												<c:choose>
													<c:when
														test="${member.m_memberNo ==Complaint.m_memberNo||member.m_grade >2}">
														<a
															href='/publicmana/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&cp_complaintNo=${Complaint.cp_complaintNo}'>
															${Complaint.cp_title} </a>
													</c:when>
													<c:otherwise>
														<p>사용자의 요청에 의해 비공개처리되었습니다.</p>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<a
													href='/publicmana/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&cp_complaintNo=${Complaint.cp_complaintNo}'>
													${Complaint.cp_title} </a>
											</c:otherwise>
										</c:choose> <c:if test="${Complaint.cp_ref !=0 }">
											<strong>[${Complaint.cp_ref }]</strong>
										</c:if></td>
									<td>${Complaint.m_memberNo}</td>
									<td><span class="badge bg-red">${Complaint.cp_date }</span></td>
									<td>${Complaint.cp_state }</td>
								</tr>

							</c:forEach>

						</table>
					</div>
					<!-- /.box-body -->


					<div class="box-footer">

						<div class="text-center">
							<ul class="pagination">

								<c:if test="${pageMaker.prev}">
									<li><a
										href="/publicmana/list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a href="/publicmana/list${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="/publicmana/list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:if>

							</ul>
						</div>

					</div>
					<!-- /.box-footer-->
				</div>
			</div>
			<!--/.col (left) -->

			<div class="col-lg-1"></div>
		</div>
	</div>
	<!-- /.row -->
</section>
<!-- /.content -->


<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
	$(function() {

		$('#searchBtn').on(
				"click",
				function(event) {
					location.href = "/publicmana/list"
							+ '${pageMaker.makeQuery(1)}' + "&searchType="
							+ $("select option:selected").val() + "&keyword="
							+ $('#keywordInput').val();

				});

		$('#newBtn').on("click", function(event) {
			alert('dd')
			location.href = "/publicmana/register";

		});
	});
</script>

<!--  <script>
	function search() {
		
		Location.href = "/publicmana/list"
			+ '${pageMaker.makeQuery(1)}'
			+ "&searchType="
			+ $("select option:selected").val()
			+ "&keyword=" + $('#keywordInput').val();

	}
	function newCreate() {
		alert('dd')
	Window.href = "/publicmana/register";
	}

</script> 
 -->
