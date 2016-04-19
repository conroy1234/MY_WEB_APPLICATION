<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Home</title>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<script type="text/javascript"
	src="<c:url value="/resources/js/main.js" />"></script>
</head>
<body class="body">
	<table class="tableContents">
		<form:form method="post" action="customer?customerLogin"
			modelAttribute="customer">
			<tr>
				<td class="tableDefinition">Name: <form:label class="path"
						path="name" /></td>
			</tr>
			<tr>
				<td class="tableDefinition"><form:input class="path"
						path="name" /></td>
			</tr>

			<tr>
				<td class="tableDefinition">Number:<form:label class="path"
						path="number" /></td>
			</tr>
			<tr>
				<td class="tableDefinition"> <form:input class="path"
						path="number" /></td>
			</tr>
			<tr>
				<td class="tableDefinition">Address:<form:label class="path"
						path="address" /></td>
			</tr>
			<tr>
				<td class="tableDefinition"> <form:input class="path"
						path="address" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="submit" class="submit" /></td>
			</tr>


		</form:form>


	</table>
</body>
</html>
