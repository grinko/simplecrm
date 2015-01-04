<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/resources/css/bootstrap.min.css"/>' />
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/resources/css/style.css"/>' />


<!-- <script type='text/javascript'>
	</script> -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Simple CRM</title>
</head>
<body>


<%--Current Locale : ${pageContext.response.locale}--%>
	<div class="container-fluid" style="min-width: 800px;">
		<div class="row-fluid" style="height: 100%;">
			<div class="span8" style="height: 100%;">
				<div class="navbar navbar-inverse navbar-static-top">
					<nav class="navbar-inner">
						<div class="row-fluid">
							<div class="span8">
								<a class="brand" href="#">Simple CRM</a>
								<ul class="nav navbar-nav">
									<li class="divider-vertical"></li>
									<li><a href="#"><spring:message key="menu.top.home"/></a></li>
									<li><a href="#"><spring:message key="menu.top.something"/></a></li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown"><spring:message key="menu.top.help"/><b class="caret"></b></a>
										<ul class="dropdown-menu navbar-inverse">
											<li><a href="#"><spring:message key="menu.top.help.content"/></a></li>
											<li id="about" data-target="#modalId" data-toggle="modal"><a href="#"><spring:message key="menu.top.help.about"/></a></li>
										</ul></li>
								</ul>

							</div>
							<div class="span4">
								<%--<form class="navbar-form pull-right">
									<input type="text" class="search-query span12" placeholder="not working yet..." />
								</form>--%>
                                <div class="pull-right" style="padding-top: 10px;">
                                    <a href="?lang=en">ENG</a> | <a href="?lang=de">DEU</a>
                                </div>
							</div>

						</div>

					</nav>
				</div>
				<table  id="example" class="table table-hover table-condensed table-bordered" style="margin-top: 0px;">
					<thead>
						<tr>
							<th>#</th>
							<th><spring:message key="person.table.name"/></th>
							<th><spring:message key="person.table.email"/></th>
							<sec:authorize ifAnyGranted="ROLE_ADMIN, ROLE_USER">
							<th style="width: 80px;"><spring:message key="person.table.commands"/></th>
							</sec:authorize>
						</tr>
					</thead>
					<c:forEach var="person" items="${personList}">
					<c:set var="count" value="${count + 1}" scope="page"/>
						<tr>
							<td><c:out value="${count}" /></td>
							<td><c:out value="${person.name}" /></td>
							<td><c:out value="${person.email}" /></td>
							<sec:authorize ifAnyGranted="ROLE_ADMIN, ROLE_USER">
							<td>
								<div class="btn-toolbar">
								<div class="btn-group">
									<a href="view?id=${person.id}" id="viewBtn" class="btn btn-info"><i class="icon-search icon-white"></i></a> 
									<a href="edit?id=${person.id}" id="editBtn" class="btn btn-info"><i class="icon-pencil icon-white"></i></a> 
									<a href="delete?id=${person.id}" id="deleteBtn"	class="btn btn-info"><i class="icon-trash icon-white"></i></a>
								</div>
								</div>
							</td>
							</sec:authorize>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="span4" style="background-color: rgb(91, 192, 222); height: 100%;">
			    <br/>
			    <%--<div style="align-content: center">
                    <a href="?lang=en">ENG</a> | <a href="?lang=de">DEU</a>
                </div>--%>
				<sec:authorize ifAllGranted="ROLE_ANONYMOUS">
				<div class="container" style="margin-left: 60px">
					<div class="row">
						<div class="well span4">
							<legend><spring:message key="main.authorization.authorization"/></legend>
							<div class="alert alert-error">
								<a href="#" class="close" data-dismiss="alert">x</a> <spring:message key="main.authorization.invalid.authentication"/>
							</div>
							<form method="POST" action="<c:url value='j_spring_security_check' />">
								<input type="text" class="span12" placeholder="Login" name="j_username" />
								<input type="password" class="span12" placeholder="Password" name="j_password" />
								<label class="checkbox">
									<input type="checkbox" name="j_spring_security_remember_me" value="1" /> <spring:message key="main.authorization.remember.me"/>
								</label>
								<button type="submit" class="btn btn-block btn-success"><spring:message key="main.authorization.login"/></button>
							</form>
						</div>
					</div>
				</div>
				</sec:authorize>
				
				<sec:authorize ifAnyGranted="ROLE_ADMIN, ROLE_USER">
				<p style="margin-left: 40px"><a href="logout"><spring:message key="main.authorization.logout"/></a></p>
				<form action="save" method="post" class="navbar-form" style="margin-top: 80px; margin-left: 40px;">
                    <div><spring:message key="person.add.new"/></div>
					<input type="hidden" name="id" /> <label for="name"><spring:message key="person.add.person.name"/></label>
					<input type="text" id="name" name="name" /> <label for="email"><spring:message key="person.add.person.email"/></label>
					<input type="text" id="email" name="email" /> <input type="submit" value="Submit" class="tblBtn btn btn-xs btn-info" />
				</form>
				</sec:authorize>
			</div>
		</div>
	</div>
	
	<div class="modal fade hide" id="modalId" tabindex="-1" style="display: none;" aria-hidden="true">
		<div class="modal-header">
			<button id="closeAboutButton" class="close pull-right">&times;</button>
			<h3>About</h3>
		</div>
		<div class="modal-body">
		
			<p>Simple CRM is a web application for working with portfolio of models. 
			You can write/read contact info, notes, upload photos and watch this with slideshow.</p>
			<p>Developed by grinko.nikolai@gmail.com</p>
		</div>
		<div class="modal-footer">
			<button id="closeAbout" class="btn-default btn" type="button">OK</button>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script type='text/javascript' src='<c:url value="/resources/js/bootstrap.min.js"/>'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/jquery.dataTables.js"/>'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/bootstrap.datatables.pagination.js"/>'></script>
	
	<script type="text/javascript">
		$('#closeAbout').click(function() {
			$('#modalId').modal('hide');
		});
		$('#closeAboutButton').click(function() {
			$('#modalId').modal('hide');
		});
		
		/* Default class modification */
		$.extend( $.fn.dataTableExt.oStdClasses, {
			"sSortAsc": "header headerSortDown",
			"sSortDesc": "header headerSortUp",
			"sSortable": "header"
		} ); 

		/* Table initialisation */
		$(document).ready(function() {
			$('#example').dataTable( {
				"sDom": "<'row-fluid'<'span8'l><'span4'f>r>t<'row-fluid'<'span8'i><'span4'p>>", 
				"sPaginationType": "bootstrap"
			} );
		} );
	</script>
</body>
</html>