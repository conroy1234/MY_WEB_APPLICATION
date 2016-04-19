<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Home</title>
<em><h1>${welcome_display}</h1></em>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<script type="text/javascript"
	src="<c:url value="/resources/js/main.js" />"></script>

</head>
<body class="body">
	<input id="loginPage" type="button" value="about me"
		onclick="indexFunction();" />
	<br />
	<input id="ingexPage" type="button" value="Login"
		onclick="loginFunction ();" />


</body>
</html>
