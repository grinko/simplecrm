<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/resources/css/bootstrap.css"/>' />
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/resources/css/style.css"/>' />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit person's data</title>
</head>
<body>
<form action="update" method="post">
		<input type="hidden" name="id" value="${person.id}" /> 
		<label for="name">Person Name</label> <input type="text" id="name" name="name" value="${person.name}"/> 
		<label for="email">Person E-mail</label> <input type="text" id="email" name="email" value="${person.email}"/> 
		<input type="submit" value="Submit" class="tblBtn btn btn-xs btn-info"/>
	</form>

</body>
</html>