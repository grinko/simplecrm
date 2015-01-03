<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/resources/css/bootstrap.css"/>' />
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/resources/css/style.css"/>' />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View person's data</title>
</head>
<body>

	<table class="table table-hover table-condensed table-bordered persons">
		<thead>
			<tr>
				<th><spring:message key="view.table.property"/></th>
				<th><spring:message key="view.table.value"/></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><spring:message key="view.table.name"/></td>
				<td><c:out value="${person.name}" /></td>
			</tr>
			<tr>
				<td><spring:message key="view.table.email"/></td>
				<td><c:out value="${person.email}" /></td>
			</tr>
		</tbody>
	</table>
<a href="/" class="btn btn-info"><spring:message key="buttons.back"/></a>


<div class="carousel slide" id="fotoCarousel" style="width: 600px;">
	<ol class="carousel-indicators">
		<li class="active" data-target="#fotoCarousel" data-slide-to="0"></li>
		<li data-target="#fotoCarousel" data-slide-to="1"></li>
		<li data-target="#fotoCarousel" data-slide-to="2"></li>
	</ol>
	<div class="carousel-inner">
		<div class="item active">
			<img src="resources/img/1.jpg" style="width: 620px;">
			<div class="carousel-caption">
				<h4>Title 1</h4>
				<p>For the use of text editors with Wikipedia, see Wikipedia</p>
			</div>
		</div>
		<div class="item">
			<img src="resources/img/2.jpg" style="width: 600px;">
			<div class="carousel-caption">
				<h4>Title 2</h4>
				<p>For the use of text editors with Wikipedia, see Wikipedia</p>
			</div>
		</div>
		<div class="item">
			<img src="resources/img/3.jpg" style="width: 600px;">
			<div class="carousel-caption">
				<h4>Title 3</h4>
				<p>For the use of text editors with Wikipedia, see Wikipedia</p>
			</div>
		</div>
	</div>
	<a href="#fotoCarousel" class="carousel-control left" data-slide="prev">&lsaquo;</a>
	<a href="#fotoCarousel" class="carousel-control right" data-slide="next">&rsaquo;</a>
</div>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type='text/javascript' src='<c:url value="/resources/js/bootstrap.min.js"/>'></script>
</body>
</html>