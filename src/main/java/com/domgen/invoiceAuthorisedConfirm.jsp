<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
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
<LINK href="theme/dg-consumer.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript"
	src="dg-consumer.js"></script>

<title><bean:message key="marketingBudgets.text" /></title>

<style type="text/css">
/* scrollable table with fixed header */
div.tableContainer {
	height: 400px; /* must be greater than tbody*/
	/*width: 500px; /* must be greater than tbody*/
	overflow: auto;
}

table > tbody {
	overflow: auto;
	height: 380px;
	/*width: 300px;*/
}

thead td {
	font-weight: bold;
	font-size: 0.7em;
	padding: 3px 10px 3px 3px;
	text-align: left;
	vertical-align: top;
	background-color: #e5eef7;
	position: relative;
	top: expression(document . getElementById("data") . scrollTop-8 ); /*IE5+ only*/
}

tfoot td {
	text-align: center;
	font-size: 11px;
	font-weight: bold;
	background-color: papayawhip;
	color: steelblue;
	border-top: solid #94B7D9 1px;
}

/* expandable sections */
a.dsphead {
	text-decoration: none;
	margin-left: 0px;
	color: #003366;
	background-color: #e5eef7;
}

a.dsphead:hover {
	text-decoration: none;
}

a.dsphead span.dspchar {
	color: #003366;
	font-family: monospace;
	font-weight: normal;
}

.dspcont {
	color: #003366;
	display: none;
	mrgin-left: 0px;
}

.save {
	behaviour: url(#default#savehistory);
}
</style>

<script type="text/javascript">

function topBarNavigation(goTo)
{
	invoiceAuthorisedConfirmForm.actionChosen.value= goTo;
	invoiceAuthorisedConfirmForm.actionChosenType.value= "nav";
	invoiceAuthorisedConfirmForm.submit();
}
function secondBarNavigation(goTo)
{
	invoiceAuthorisedConfirmForm.actionChosen.value= goTo;
	invoiceAuthorisedConfirmForm.actionChosenType.value= "func";
	invoiceAuthorisedConfirmForm.submit();
}
function setAction(action)
{
	invoiceAuthorisedConfirmForm.actionChosen.value= action;
	invoiceAuthorisedConfirmForm.actionChosenType.value= "func";
}
</script>

<script type="text/javascript">

function dsp(loc)
{
	if (document.getElementById)
	{
		var foc = loc.firstChild;
		foc = loc.firstChild.innerHTML?loc.firstChild:loc.firstChild.nextSibling;
		foc.innerHTML = foc.innerHTML=='+'?'-':'+';
		foc = loc.parentNode.nextSibling.style?loc.parentNode.nextSibling:loc.parentNode.nextSibling.nextSibling;
		foc.style.display = foc.style.display=='block'?'none':'block';
	}
}

</script>
</HEAD>
<BODY>

<div id="topLogo"><img src="images/domgen_logo.gif"
	alt="Domestic &amp; General Logo" width="136" height="75" /> <i
	class="topStrap" style="text-indent: 15px"><bean:message key="marketingBudgets.text" /></i></div>

<bean:define id="roleid" name="navScreenResults" property="role" />
<bean:define id="functionid" name="navScreenResults" property="function" />
<div id="navMain"><logic:equal name="navScreenResults" property="role"
	value="ACCMGR">
	<jsp:include page="navAccountsManager.jsp" />
</logic:equal> <logic:equal name="navScreenResults" property="role"
	value="ACCUSR">
	<jsp:include page="navAccountsUser.jsp" />
</logic:equal> <logic:equal name="navScreenResults" property="role"
	value="UWMGR">
	<jsp:include page="navUWManager.jsp" />
</logic:equal> <logic:equal name="navScreenResults" property="role"
	value="UWUSR">
	<jsp:include page="navUWUser.jsp" />
</logic:equal> <logic:equal name="navScreenResults" property="role"
	value="SSMGR">
	<jsp:include page="navSSManager.jsp" />
</logic:equal> <logic:equal name="navScreenResults" property="role"
	value="SSUSR">
	<jsp:include page="navSSUser.jsp" />
</logic:equal> <logic:equal name="navScreenResults" property="role"
	value="AHMMGR">
	<jsp:include page="navAccountHMsManager.jsp" />
</logic:equal> <logic:equal name="navScreenResults" property="role"
	value="AHMUSR">
	<jsp:include page="navAccountHMsManager.jsp" />
</logic:equal></div>

<div id="navTrail">
<ul>
	<!-- InstanceBeginEditable name="trail" -->
	<li><bean:write name="navScreenResults" property="function"/>&nbsp;&gt;</li>
	<li><a href="#" onClick="secondBarNavigation('goToInvoiceAuthorisedSelection');return false;"><bean:message key="invoiceAuthorisedSelection.text" /></a>&nbsp;&gt;</li>	
	<li class="sectionSelected"><bean:message
		key="invoiceAuthorisedConfirm.navBar.text" /></li>
	<!-- InstanceEndEditable -->
</ul>
</div>

<div id="content"><html:form action="/invoiceAuthorisedConfirm.do">

	<html:hidden property="actionChosen" value=""></html:hidden>
	<html:hidden property="actionChosenType" value=""></html:hidden>
	<div id="mainContent">
	<div class="box">

	<h3 class="headingB"><bean:message key="invoiceAuthorisedConfirm.text" />&nbsp;<bean:write name="invoiceAuthorisedResults" property="invoiceAuthorisedConfirmCount"/></h3>

	<br>

	<div class="tableContainer" id="data">
	<table border="0" cellpadding="2" cellspacing="0">
		<thead>
			<TR>
				<TD width="150"><bean:message key="invoiceId.text" /></TD>
				<TD width="150"><bean:message key="invoiceEntryDate.text" /></TD>
				<TD width="150"><bean:message key="invoiceDate.text" /></TD>
				<TD width="150"><bean:message key="invoiceNo.text" /></TD>
				<TD width="150"><bean:message key="account.text" /></TD>
				<TD width="150"><bean:message key="grossAmount.col.text" /></TD>
				<TD width="150"><bean:message key="uwAuthoriser.text" /></TD>
				<TD width="150"><bean:message key="ssAuthoriser.text" /></TD>
			</TR>
		</thead>
		<TBODY>
			<logic:iterate name="invoiceAuthorisedResults" property="invoiceAuthorisedConfirm"
				id="invoiceAuthorisedConfirmID" indexId="i">

				<TR>
				<td width="150" valign="top"><bean:write name="invoiceAuthorisedConfirmID" property="invoiceIdLineNo"/></td>
				<td width="150" valign="top"><bean:write name="invoiceAuthorisedConfirmID" property="entryDateFormatted"/></td>
				<td width="150" valign="top"><bean:write name="invoiceAuthorisedConfirmID" property="invoiceMonth"/>/20<bean:write name="invoiceAuthorisedConfirmID" property="invoiceYear"/></td>
					<td width="150" valign="top">
				<logic:equal name="invoiceAuthorisedConfirmID" property="financeDivision" value="DOM">
					<font color="blue"><bean:write name="invoiceAuthorisedConfirmID" property="invoiceNo"/>*<bean:write name="invoiceAuthorisedConfirmID" property="numberOfLines"/></font>
				</logic:equal>
				<logic:notEqual name="invoiceAuthorisedConfirmID" property="financeDivision" value="DOM">
					<bean:write name="invoiceAuthorisedConfirmID" property="invoiceNo"/>*<bean:write name="invoiceAuthorisedConfirmID" property="numberOfLines"/>
				</logic:notEqual>
				<td width="150" valign="top"><bean:write name="invoiceAuthorisedConfirmID" property="smaReference"/></td>							
				<td width="150" valign="top"><bean:write name="invoiceAuthorisedConfirmID" property="amountGross"/></td>									
				<td width="150" valign="top"><bean:write name="invoiceAuthorisedConfirmID" property="approverUnderwriting"/></td>									
				<td width="150" valign="top"><bean:write name="invoiceAuthorisedConfirmID" property="approverSalesSupport"/></td>									
				</TR>
			</logic:iterate>
		</tbody>
	</table>

	</div>
	<br>
	<p><input type="submit" class="formButton" value="Confirm" onClick="javascript:setAction('confirm');">&nbsp;<font color="red"><html:errors property="confirmError" /></font></p>
	<p><input type="submit" class="formButton" value="Back" onClick="javascript:setAction('back');">&nbsp;<font color="red"><html:errors property="backError" /></font></p>

	</div>
	</div>

</html:form>


<div class="clearBoth">&nbsp;</div>

<div id="footer">
<p>&copy; <bean:message key="domesticAndGeneral.text" /></p>
</div>
</BODY>
</html:html>




