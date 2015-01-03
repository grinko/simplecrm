<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
		<label for="name"><spring:message key="edit.person.name"/></label> <input type="text" id="name" name="name" value="${person.name}"/>
		<label for="email"><spring:message key="edit.person.email"/></label> <input type="text" id="email" name="email" value="${person.email}"/>
        <a href="/" class="btn btn-info"><spring:message key="buttons.back"/></a>
		<input type="submit" value="<spring:message key='buttons.save'/>" class="tblBtn btn btn-xs btn-info"/>
	</form>

</body>
</html>