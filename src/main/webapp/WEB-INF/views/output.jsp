<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/resources/css/bootstrap.min.css"/>' />
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/resources/css/style.css"/>' />
<script type='text/javascript'	src='<c:url value="/resources/js/jquery-1.6.4.min.js"/>'></script>
<script type='text/javascript'	src='<c:url value="/resources/js/bootstrap.min.js"/>'></script>

<!-- <script type='text/javascript'>
	</script> -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Simple CRM</title>
</head>
<body>

	

	<div class="container-fluid" >
		<div class="row-fluid">
			<div class="span8">
			<div class="navbar navbar-inverse navbar-static-top">
		<nav class="navbar-inner">
			<a class="brand">Simple CRM</a>
			<ul class="nav">
				<li class="divider-vertical"></li>
				<li><a href="#">Home</a></li>
				<li><a href="#">Something</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Help <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Help Contents</a></li>
						<li><a href="#">About</a></li>
					</ul>
				</li>
			</ul>
			
			<form class="navbar-form pull-right">
				<input type="text" class="span8 search-query" placeholder="find in table" />
			</form>
		</nav>
	</div>
				<table class="table table-hover table-condensed table-bordered" style="margin-top: 40px;">
					<thead>
						<tr>
							<th>#</th>
							<th>Person Name</th>
							<th>Person E-mail</th>
							<th>Commands</th>
						</tr>
					</thead>
					<c:forEach var="person" items="${personList}">
						<tr>
							<td>*</td>
							<td><c:out value="${person.name}" /></td>
							<td><c:out value="${person.email}" /></td>
							<td>
								<div class="btn-group">
									<a href="view?id=${person.id}" id="viewBtn"	class="tblBtn btn btn-xs btn-info">view</a> 
									<a href="edit?id=${person.id}" id="editBtn" class="tblBtn btn btn-xs btn-info">edit</a> 
									<a href="delete?id=${person.id}" id="deleteBtn" class="tblBtn btn btn-xs btn-info">delete</a>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="span4" style="background-color:rgb(91, 192, 222);height:100%;">
				<form action="save" method="post" class="navbar-form" style="margin-top: 80px; margin-left: 40px;">
					<input type="hidden" name="id" /> <label for="name">Person's Name</label> 
					<input type="text" id="name" name="name" /> <label for="email">Person E-mail</label> 
					<input type="text" id="email" name="email" /> <input type="submit" value="Submit" class="tblBtn btn btn-xs btn-info" />
				</form>

			</div>
		</div>
	</div>


</body>
</html>