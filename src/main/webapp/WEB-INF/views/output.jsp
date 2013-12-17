<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/resources/css/bootstrap.css"/>' />
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/resources/css/style.css"/>' />
<script type='text/javascript' src='<c:url value="/resources/js/jquery-1.6.4.min.js"/>'></script>

<!-- <script type='text/javascript'>
	</script> -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Simple CRM</title>
</head>
<body>
	<h2>Simple CRM</h2>

	<form action="save" method="post">
		<input type="hidden" name="id"/> 
		<label for="name">Person Name</label> <input type="text" id="name" name="name" /> 
		<label for="email">Person E-mail</label> <input type="text" id="email" name="email" /> 
		<input type="submit" value="Submit" class="tblBtn btn btn-xs btn-info" />
	</form>

	<table class="table table-hover table-condensed table-bordered persons">
	<thead>
	<tr>
		<th>#</th>
		<th>Person Name</th>
		<th>Person E-mail</th>
		<th></th>
	</tr>
	</thead>
		<c:forEach var="person" items="${personList}">
			<tr>
				<td>*</td>
				<td><c:out value="${person.name}" /></td>
				<td><c:out value="${person.email}" /></td>
				<td>
				<input id="viewBtn" class="tblBtn btn btn-xs btn-info" type="button" value="view" onclick="window.location='view?id=${person.id}'" />
				<input id="editBtn" class="tblBtn btn btn-xs btn-info" type="button" value="edit" onclick="window.location='edit?id=${person.id}'" />
				<input id="deleteBtn" class="tblBtn btn btn-xs btn-info" type="button" value="delete" onclick="window.location='delete?id=${person.id}'" />
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>