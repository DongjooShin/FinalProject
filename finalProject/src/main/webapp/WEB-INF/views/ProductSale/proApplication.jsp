
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../../../resources/bootstrap/bootstrap.min.css" rel="stylesheet">
</head>

<body
	class="home singular page page-id-7 page-template page-template-page-templates page-template-business page-template-page-templatesbusiness-php ">



	<jsp:include page="../include/head.jsp"></jsp:include>




	<div id="page" class="hfeed site">

		<div class="row">

			<div class="col-md-9">
				<div class="row">
					<div class="col-lg-12">
						<div class="well bs-component">
							<form class="form-horizontal" action="/ProductSale/proApplication" method="post">


								<div class="form-group">
									<label class="col-lg-3 control-label">분류</label>
									<div class="col-lg-7">
									<select class="form-control" name="pro_group" id="select">
										<option>식품</option>
										<option>뷰티</option>
										<option>패션/의류</option>
										<option>생활/주방용품</option>
										<option>가구/디지털</option>
										<option>완구/도서</option>
										<option>스포츠/레저상품</option>
									</select>
									</div>
								</div>


								<div class="form-group">
									<label class="col-lg-3 control-label">판매상품명</label>
									<div class="col-lg-7">
										<input type="text" class="form-control" name="pro_name"
											placeholder="판매상품명">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-lg-3 control-label">휴대폰번호</label>
									<div class="col-lg-7">
										<div class="col-lg-4 phoneNumfirst">
											<input type="text" name="pro_tel1" class="form-control"
												placeholder="010">
										</div>

										<div class="col-lg-4 phoneNum">
											<input type="text" name="pro_tel2" class="form-control"
												placeholder="1234">
										</div>

										<div class="col-lg-4 phoneNum">
											<input type="text" name="pro_tel3" class="form-control"
												placeholder="5678">
										</div>
									</div>
								</div>
								
								
								<div class="form-group">
									<label class="col-lg-3 control-label">상품내용</label>
									<div class="col-lg-7">
									<textarea class="form-control" rows="3" name="pro_context" id="textArea"></textarea>
										
									</div>
							
								</div>
								

								<div class="form-group">
									<div class="col-lg-6 col-lg-offset-5">
										<!-- 											<input type="hidden" name="id" value="">
	 -->

										<button type="reset" class="btn btn-default">Cancel</button>
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</div>
							</form>

						</div>
					</div>

				</div>
			</div>
		</div>

	</div>

	<br>
	<br>
	<br>
</body>
</html>