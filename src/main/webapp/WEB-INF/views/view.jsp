<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<th>Property</th>
				<th>Value</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Name</td>
				<td><c:out value="${person.name}" /></td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td><c:out value="${person.email}" /></td>
			</tr>
		</tbody>
	</table>

</body>
</html>