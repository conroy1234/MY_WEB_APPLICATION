
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<html:html>
<HEAD>
<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
%>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="theme/dg-consumer.css" rel="stylesheet"	type="text/css">
<script language="JavaScript" type="text/JavaScript" src="dg-consumer.js"></script>
	
<title><bean:message key="marketingBudgets.text"/></title>

</HEAD>
<BODY onload="javascript:indexForm.userName.focus();">
<div id="topLogo"><img src="images/domgen_logo.gif"
	alt="Domestic &amp; General Logo" width="136" height="75" /><i
	class="topStrap" style="text-indent: 15px"><bean:message key="marketingBudgets.text"/></i></div>
<div id="navMain">
<ul>
	<li><A style="border-right: none"></A></li>
</ul>
</div>
<%-- System.out.println("index.jsp after navMain DIV"); --%>
<div id="navTrail">
<ul>
	<li class="sectionSelected"><bean:message key="home.text"/></li>
</ul>
</div>
<%-- System.out.println("index.jsp after navTrail DIV"); --%>
<div id="content">
<div id="mainContent"><!-- InstanceBeginEditable name="Page content" -->
<div class="box">
<html:form action="/index.do">
<h3 class="headingB"><bean:message key="login.text"/></h3>

<p><bean:message key="index.prompt.text"/></p>
	<p>
	<font color="red"><html:errors property="processError" /></font>
	<br>
	</p>

<table width="90%" border="0" cellpadding="2" cellspacing="0">
	<tr>
		<td width="40%"><bean:message key="userName.text"/>&nbsp;<font color="#ff0000">*</font></td>
		<td width="55%" valign="top"><html:text property="userName"
			size="20" maxlength="10" tabindex="1"/>&nbsp;<font color="red"><html:errors property="userName"/></font></td>
	</tr>	
	<tr id="e1" class="extraInfo">
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td><bean:message key="password.text"/>&nbsp;<font color="#ff0000">*</font></td>
		<td><html:password property="password" size="20" maxlength="10"
			tabindex="2"/><font color="red">&nbsp;<html:errors property="password"/></font>&nbsp;</TD>
	</TR>
</table>
<p><font color="red"><html:errors property="authentication"/></font></p>
<p><html:submit styleClass="formButton"	value="Login" tabindex="3"/></p>
<br>

</html:form>
</div>
<!-- InstanceEndEditable --></div>
<div class="clearBoth">&nbsp;</div>
</div>
<div id="footer">
<p>&copy; <bean:message key="domesticAndGeneral.text"/></p>
</div>


</BODY>
</html:html>
