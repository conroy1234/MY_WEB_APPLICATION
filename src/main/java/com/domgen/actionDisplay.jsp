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
<script language="JavaScript" type="text/JavaScript" src="dg-consumer.js"></script>
	
<title><bean:message key="marketingBudgets.text"/></title>

<style type="text/css">
/* scrollable table with fixed header */
div.tableContainer {
	height:500px; /* must be greater than tbody*/
	/*width: 500px; /* must be greater than tbody*/
	overflow: auto;
}

table > tbody {
	overflow: auto;
	height: 480px;
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
	actionDisplayForm.actionChosen.value= goTo;
	actionDisplayForm.actionChosenType.value= "nav";
	actionDisplayForm.submit();
}
function setAction(action)
{
	actionDisplayForm.actionChosen.value= action;
	actionDisplayForm.actionChosenType.value= "func";
}
function setActionUpdate(actionEditKey)
{
	actionDisplayForm.actionChosen.value= "actionEdit";
	actionDisplayForm.actionChosenType.value= "func";
	actionDisplayForm.actionEditKey.value= actionEditKey;
	actionDisplayForm.submit();
}
function resetAccountName()
{
	actionDisplayForm.accountNameSel.value= "reset"
}
function resetAccountHandler()
{
	actionDisplayForm.accountHandlerSel.value= "reset"
}
function resetAccountManager()
{
	actionDisplayForm.accountManagerSel.value= "reset"
}
function resetStatus()
{
	actionDisplayForm.statusSel.value= "reset"
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

<div id="topLogo"><img src="images/domgen_logo.gif" alt="Domestic &amp; General Logo" width="136" height="75" />
	<i class="topStrap" style="text-indent: 15px"><bean:message key="marketingBudgets.text" /></i>
</div>
<bean:define id="roleid" name="navScreenResults" property="role" />
<div id="navMain">
	<logic:equal name="navScreenResults" property="role" value="SSMGR"><jsp:include page="navSSManager.jsp"/></logic:equal>	
	<logic:equal name="navScreenResults" property="role" value="AHMMGR"><jsp:include page="navAccountHMsManager.jsp"/></logic:equal>
	<logic:equal name="navScreenResults" property="role" value="AHMUSR"><jsp:include page="navAccountHMsUser.jsp"/></logic:equal>
</div>

<div id="navTrail">
<ul>
	<!-- InstanceBeginEditable name="trail" -->
	<li><bean:message key="accountHandlerManagers.text" />&nbsp;&gt;</li>
	<li class="sectionSelected"><bean:message key="actionDisplay.text" /></li>
	<!-- InstanceEndEditable -->
</ul>
</div>

<div id="content"><html:form action="/actionDisplay.do" >

	<html:hidden property="actionChosen" value=""></html:hidden>
	<html:hidden property="actionChosenType" value=""></html:hidden>
	<html:hidden property="actionEditKey" value=""></html:hidden>
	<bean:define id="clients" name="navResults" property="clients" />
	<bean:define id="accountHandlers" name="navResults" property="accountHandlers" />
	<bean:define id="accountManagers" name="navResults" property="accountManagers" />

<div id="subSections">
<div class="box">
	<h3 class="listHeadingA">Search</h3>

	<table width="60%" border="0" cellpadding="2" cellspacing="0">
			<tr>
			<td><bean:message key="accountName.text" /></td>
		</tr>
		<tr>
			<td>
				<html:select name="navResults" property="accountNameSel">
				<html:option value="reset">&nbsp;</html:option>
					<html:options collection="clients" property="accountName"/>
				</html:select><html:button styleClass="formButtonSmall" property="Reset" value="R" onclick="javascript:resetAccountName();" tabindex="4"/>&nbsp;<font color="red"><html:errors property="accountNameSelError" /></font>
				</td>
		</tr>
		<tr>
			<td><bean:message key="accountManager.text" /></td>
		</tr>
		<tr>
			<td>
				<html:select name="navResults" property="accountManagerSel">
					<html:option value="reset">&nbsp;</html:option>
					<html:options collection="accountManagers" property="initials"/>
				</html:select><html:button styleClass="formButtonSmall" property="Reset" value="R" onclick="javascript:resetAccountManager();" tabindex="6"/>&nbsp;<font color="red"><html:errors property="accountManagerSelError" /></font>
				</td>
		</tr>
		<tr>
			<td><bean:message key="accountHandler.text" /></td>
		</tr>
		<tr>
			<td>
				<html:select name="navResults" property="accountHandlerSel">
					<html:option value="reset">&nbsp;</html:option>
					<html:options collection="accountHandlers" property="initials"/>
				</html:select><html:button styleClass="formButtonSmall" property="Reset" value="R" onclick="javascript:resetAccountHandler();" tabindex="8"/>&nbsp;<font color="red"><html:errors property="accountHandlerSelError" /></font>
				</td>
		</tr>
			<tr>
			<td><bean:message key="status.text" /></td>
		</tr>
		<tr>
			<td><html:select name="navResults" property="statusSel" tabindex="11">
			<html:option value="reset">&nbsp;</html:option>
				<html:option value="10">New</html:option>
				<html:option value="20">Acknowledged</html:option>
				<html:option value="30">WIP</html:option>
				<html:option value="40">Completed</html:option>
				</html:select><html:button styleClass="formButtonSmall" property="Reset" value="R" onclick="javascript:resetStatus();" tabindex="12"/>&nbsp;<font color="red"><html:errors property="statusSelError" /></font>
		</td>
		</tr>
		<tr>
			<td><html:submit styleClass="formButton" value="Search" onclick="javascript:setAction('search');" tabindex="17"/></td>
		</tr>
	</table>

	<h3 class="listHeadingA">Sort</h3>
	<table width="60%" border="0" cellpadding="2" cellspacing="0">
		<tr>
			<td><bean:message key="sortBy.text" /></td>
		</tr>
		<tr>
				<td><html:select name="navResults" property="sortBy" tabindex="19">
				<html:option value="reset">&nbsp;</html:option>
				<html:option value="MBACCN" >Account Name</html:option>
				<html:option value="MBACCM" >Account Manager</html:option>	
				<html:option value="MBSTAT" >Status</html:option>
			</html:select></td>
		</tr>
		<tr>
			<td><html:submit styleClass="formButton" value="Sort" onclick="javascript:setAction('search');" tabindex="20"/></td>
		</tr>		
	</table>

</div>
</div>
	
<div id="mainContent">
<div class="box">

	<h3 class="headingB"><bean:message key="actions.text" /></h3>

	<br>

	<div class="tableContainer" id="data">
	<table border="0" cellpadding="2" cellspacing="0">
		<thead>
			<tr>
				<td colspan="8"><bean:message key="total.text" />&nbsp;<bean:write name="navResults" property="actionsCount"/></td>
			</tr>
			<TR>
				<TD width="14%"><bean:message key="dateCreated.text" /></TD>
				<TD width="20%"><bean:message key="createdBy.text" /></TD>
				<TD width="15%"><bean:message key="accountName.text" /></TD>
				<TD width="20%"><bean:message key="action.text" /></TD>
				<TD width="15%"><bean:message key="status.text" /></TD>
				<TD width="15%">&nbsp;</TD>
			</TR>
		</thead>
		<TBODY>
		<logic:iterate name="navResults" property="actions" id="actionsID" indexId="i">
							
		<tr>
		<td width="14%" valign="top"><bean:write name="actionsID" property="dateFormatted"/></td>
		<td width="20%" valign="top"><bean:write name="actionsID" property="actionOriginator"/></td>
		<td width="15%" valign="top"><bean:write name="actionsID" property="accountName"/></td>
		<td width="20%" valign="top"><bean:write name="actionsID" property="actionTextShort"/></td>
		<td width="15%" valign="top"><bean:write name="actionsID" property="statusText"/></td>
		<td width="15%" valign="top"><input name="Update" type="button" class="formButton" value="Update" onClick="javascript:setActionUpdate('<bean:write name="actionsID" property="actionOriginator"/>.<bean:write name="actionsID" property="date"/>.<bean:write name="actionsID" property="time"/>');"></td>		
		</tr>
		</logic:iterate>
	</tbody>
	</table>

</div>
</div>
</div>
</div>
</html:form>
<div class="clearBoth">&nbsp;</div>
<div id="footer">
<p>&copy; <bean:message key="domesticAndGeneral.text" /></p>
</div>
</BODY>
</html:html>



