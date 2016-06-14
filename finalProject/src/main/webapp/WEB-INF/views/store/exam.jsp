<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form class="navbar-form navbar-left" role="search" method="get" action="/search/searchMain">
		<select class="form-control" id="searchCtg" name="searchCtg">

			<option selected="selected">스터디</option>

			<option selected="selected" value="인물">인물</option>



		</select>
		<div class="form-group">
			<input type="text" class="form-control" placeholder="Search"
				name="searchWord" value="${search.searchWord }">


		</div>
		<button type="submit" class="btn btn-default">검색</button>

	</form>
</body>
</html>