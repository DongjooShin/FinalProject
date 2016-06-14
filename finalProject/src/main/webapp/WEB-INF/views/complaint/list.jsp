<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
	<div class="col-lg-12">
	<div class="col-lg-1"></div>
		<div class="col-lg-10" style="background-color: white;">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">건의 / 불만 게시판</h3>
				</div>


					<div class='box-body'>

					<select name="searchType">
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
					<c:choose>
					<c:when test="${cri.keyword ==null }">
											
					<input type="text" name='keyword' id="keywordInput" placeholder="검색어를 작성해 주세요">
					</c:when>
					<c:otherwise>
					<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }'>
					</c:otherwise>
					</c:choose>
					<button id='searchBtn' onclick="search()">Search</button>
					<button id='newBtn' onclick="newCreate()">New 글쓰기</button>

				</div>
			</div>


			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST PAGING</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th >BNO</th>
							<th>TITLE</th>
							<th>WRITER</th>
							<th >date</th>
							<th >처리상태</th>
						</tr>

						<c:forEach items="${list}" var="Complaint">

							<tr>
								<td>${Complaint.cp_complaintNo}</td>
								<td>
								<c:choose>
								<c:when test="${Complaint.cp_flag ==1}">
								<c:choose>
								<c:when test="${member.m_memberNo ==Complaint.m_memberNo||member.m_grade >2}">
								<a href='/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&cp_complaintNo=${Complaint.cp_complaintNo}'>
									${Complaint.cp_title} </a>
								</c:when>
								<c:otherwise>
								  <p>사용자의 요청에 의해 비공개처리되었습니다.</p>
								</c:otherwise>
								</c:choose>
								</c:when>
								<c:otherwise>
								<a href='/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&cp_complaintNo=${Complaint.cp_complaintNo}'>
									${Complaint.cp_title} </a>
								</c:otherwise>
								</c:choose>
										<c:if test="${Complaint.cp_ref !=0 }">
										<strong>[${Complaint.cp_ref }]</strong>
										</c:if>
										</td>
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
									href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
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
</script>

<script>
	$(function () {
		

				$('#searchBtn').on(
						"click",
						function(event) {
							alert('11')
							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(event) {
					alert('11222')
					self.location = "register";

				});
	});

</script>
<!-- <script>
	function search() {
		
		Location.href = "list"
			+ '${pageMaker.makeQuery(1)}'
			+ "&searchType="
			+ $("select option:selected").val()
			+ "&keyword=" + $('#keywordInput').val();

	}
	function newCreate() {
		alert('dd')
	Window.href = "register";
	}

</script> -->

